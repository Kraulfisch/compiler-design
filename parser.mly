%{
open Ast

let loc (startpos:Lexing.position) (endpos:Lexing.position) (elt:'a) : 'a node =
  { elt ; loc=Range.mk_lex_range startpos endpos }

%}

%token EOF
%token <int64>  INT
%token NULL
%token <string> STRING
%token <string> IDENT

%token TINT     /* int */
%token TVOID    /* void */
%token TSTRING  /* string */
%token TBOOL    /* bool */
%token FOR      /* for loop */
%token NEW      /* new */
%token TRUE    /* true */
%token FALSE    /* false */
%token IF       /* if */
%token ELSE     /* else */
%token WHILE    /* while */
%token RETURN   /* return */
%token VAR      /* var */
%token RET      /* -> (function return type) */
%token SEMI     /* ; */
%token COMMA    /* , */
%token LBRACE   /* { */
%token RBRACE   /* } */
%token PLUS     /* + */
%token DASH     /* - */
%token STAR     /* * */
%token EQEQ     /* == */
%token EQ       /* = */
%token NEQ      /* != */
%token LT       /* < */
%token LTE      /* <= */
%token GT       /* > */
%token GTE      /* >= */
%token LPAREN   /* ( */
%token RPAREN   /* ) */
%token LBRACKET /* [ */
%token RBRACKET /* ] */
%token TILDE    /* ~ */
%token BANG     /* ! */
%token GLOBAL   /* global */
%token SHL      /* << */
%token SHR      /* >> */
%token SAR      /* >>> */
%token AND      /* & */
%token OR       /* | */
%token IAND     /* [&] */
%token IOR      /* [|] */

%left IOR       
%left IAND      
%left OR        
%left AND       
%left EQEQ NEQ  
%left LT LTE GT GTE  
%left SHL SHR SAR    
%left PLUS DASH
%left STAR
%nonassoc BANG
%nonassoc TILDE
%nonassoc LBRACKET
%nonassoc LPAREN

/* ---------------------------------------------------------------------- */

%start prog
%start exp_top
%start stmt_top
%type <Ast.exp Ast.node> exp_top
%type <Ast.stmt Ast.node> stmt_top

%type <Ast.prog> prog
%type <Ast.exp Ast.node> exp
%type <Ast.stmt Ast.node> stmt
%type <Ast.block> block
%type <Ast.ty> ty
%%

exp_top:
  | e=exp EOF { e }

stmt_top:
  | s=stmt EOF { s }

prog:
  | p=list(decl) EOF  { p }

decl:
  | GLOBAL name=IDENT EQ init=exp SEMI
    { Gvdecl (loc $startpos $endpos { name; init }) }
  | frtyp=ret_ty fname=IDENT LPAREN args=arglist RPAREN body=block
    { Gfdecl (loc $startpos $endpos { frtyp; fname; args; body }) }

arglist:
  | l=separated_list(COMMA, pair(ty,IDENT)) { l }
    
ty:
  | TBOOL { TBool }
  | TINT  { TInt }
  // | r=rtyp { TRef r }
  | TSTRING { TRef RString }
  | t=ty LBRACKET RBRACKET { TRef (RArray t) }

%inline ret_ty:
  | TVOID  { RetVoid }
  | t=ty   { RetVal t }

%inline rtyp:
  // | TSTRING { RString }
  | LPAREN args=separated_list(COMMA, ty) RPAREN RET ret=ret_ty { RFun (args, ret) }

%inline bop:
  | PLUS   { Add }
  | DASH   { Sub }
  | STAR   { Mul }
  | EQEQ   { Eq }
  | NEQ    { Neq }
  | LT     { Lt }
  | LTE    { Lte }
  | GT     { Gt }
  | GTE    { Gte }
  | AND    { And }
  | OR     { Or }
  | IAND   { IAnd }
  | IOR    { IOr }
  | SHL    { Shl }
  | SHR    { Shr }
  | SAR    { Sar }

%inline uop:
  | DASH  { Neg }
  | BANG  { Lognot }
  | TILDE { Bitnot }

lhs:  
  | id=IDENT { loc $startpos $endpos @@ Id id }
  | e=exp LBRACKET i=exp RBRACKET
    { loc $startpos $endpos @@ Index (e, i) }

exp:
  | NULL { loc $startpos $endpos @@ CNull RString }
  | i=INT { loc $startpos $endpos @@ CInt i }
  | TRUE { loc $startpos $endpos @@ CBool true }
  | FALSE { loc $startpos $endpos @@ CBool false }
  | s=STRING { loc $startpos $endpos @@ CStr s }
  | id=IDENT { loc $startpos $endpos @@ Id id }
  | NEW t=ty LBRACKET e=exp RBRACKET
    { loc $startpos $endpos @@ NewArr (t, e) }
  | NEW t=ty LBRACKET RBRACKET LBRACE es=separated_list(COMMA, exp) RBRACE
    { loc $startpos $endpos @@ CArr (t, es) }
  | e=exp LBRACKET i=exp RBRACKET
    { loc $startpos $endpos @@ Index (e, i) }
  | e=exp LPAREN es=separated_list(COMMA, exp) RPAREN
    { loc $startpos $endpos @@ Call (e, es) }
  | e1=exp b=bop e2=exp
    { loc $startpos $endpos @@ Bop (b, e1, e2) }
  | u=uop e=exp
    { loc $startpos $endpos @@ Uop (u, e) }
  | LPAREN e=exp RPAREN { e }

vdecl:
  | VAR id=IDENT EQ init=exp { (id, init) }

vdecls:
  | v=separated_list(COMMA, vdecl) { v }

exp_opt:
  | (* empty *) { None }
  | e=exp { Some e }

stmt_opt:
  | (* empty *) { None }
  | s=stmt { Some s }

stmt: 
  | d=vdecl SEMI
    { loc $startpos $endpos @@ Decl(d) }
  | lhs=lhs EQ e=exp SEMI
    { loc $startpos $endpos @@ Assn(lhs, e) }
  | e=exp LPAREN es=separated_list(COMMA, exp) RPAREN SEMI
    { loc $startpos $endpos @@ SCall (e, es) }
  | ifs=if_stmt { ifs }
  | RETURN SEMI
    { loc $startpos $endpos @@ Ret(None) }
  | RETURN e=exp SEMI
    { loc $startpos $endpos @@ Ret(Some e) }
  | WHILE LPAREN e=exp RPAREN b=block
    { loc $startpos $endpos @@ While(e, b) }
  | FOR LPAREN v=vdecls SEMI e=exp_opt SEMI s=stmt_opt RPAREN b=block
                    { loc $startpos $endpos @@ For(v, e, s, b) }
  // | FOR LPAREN v_dec=vdecl SEMI cond=option(exp) SEMI update=option(stmt) RPAREN b=block
  //   { loc $startpos $endpos @@ For ([v_dec], cond, update, b)}
  // | FOR LPAREN VAR id=IDENT EQ init=exp SEMI cond=option(exp) SEMI update=option(stmt) trail=option(SEMI) RPAREN b=block
  //   { loc $startpos $endpos @@ For([(id, init)], cond, update, b)}
  // | FOR LPAREN var_decls=separated_nonempty_list(COMMA, vdecl) SEMI cond=option(exp) SEMI update=option(stmt) trail=option(SEMI) RPAREN b=block
  //   { loc $startpos $endpos @@ For(var_decls, cond, update, b) }

block:
  | LBRACE stmts=list(stmt) RBRACE { stmts }

if_stmt:
  | IF LPAREN e=exp RPAREN b1=block b2=else_stmt
    { loc $startpos $endpos @@ If(e, b1, b2) }

else_stmt:
  | (* empty *) { [] }
  | ELSE b=block { b }
  | ELSE ifs=if_stmt { [ ifs ] }