open Assert
open Ast
open Tctxt

(* Helper to create a simple struct context for testing *)
let mk_struct_ctxt (structs : (string * field list) list) : Tctxt.t =
  List.fold_left (fun tc (id, fields) ->
    Tctxt.add_struct tc id fields
  ) Tctxt.empty structs

(* Unit-tests for Typechecker.subtype *)
let provided_tests : suite = [
  Test ("Basic Subtype Tests", [
    ("subtype_int_int",
     (fun () ->
        if Typechecker.subtype Tctxt.empty TInt TInt then () 
        else failwith "TInt <: TInt failed"));

    ("subtype_bool_bool",
     (fun () ->
        if Typechecker.subtype Tctxt.empty TBool TBool then () 
        else failwith "TBool <: TBool failed"));

    ("no_subtype_int_bool",
     (fun () ->
        if Typechecker.subtype Tctxt.empty TInt TBool then
          failwith "TInt <: TBool should fail" 
        else ()));

    ("no_subtype_bool_int",
     (fun () ->
        if Typechecker.subtype Tctxt.empty TBool TInt then
          failwith "TBool <: TInt should fail" 
        else ()));
  ]);

  Test ("Reference Subtype Tests", [
    ("subtype_string_string",
     (fun () ->
        if Typechecker.subtype Tctxt.empty (TRef RString) (TRef RString) then () 
        else failwith "TRef RString <: TRef RString failed"));

    ("subtype_nullstring_nullstring",
     (fun () ->
        if Typechecker.subtype Tctxt.empty (TNullRef RString) (TNullRef RString) then () 
        else failwith "TNullRef RString <: TNullRef RString failed"));

    ("subtype_ref_to_nullref",
     (fun () ->
        if Typechecker.subtype Tctxt.empty (TRef RString) (TNullRef RString) then () 
        else failwith "TRef RString <: TNullRef RString should hold"));

    ("no_subtype_nullref_to_ref",
     (fun () ->
        if Typechecker.subtype Tctxt.empty (TNullRef RString) (TRef RString) then
          failwith "TNullRef RString <: TRef RString should not hold" 
        else ()));
  ]);

  Test ("Array Subtype Tests", [
    ("subtype_array_int_same",
     (fun () ->
        let t = TRef (RArray TInt) in
        if Typechecker.subtype Tctxt.empty t t then () 
        else failwith "RArray TInt <: RArray TInt failed"));

    ("no_subtype_array_int_bool",
     (fun () ->
        if Typechecker.subtype Tctxt.empty (TRef (RArray TInt)) (TRef (RArray TBool)) then
          failwith "RArray TInt <: RArray TBool should fail" 
        else ()));

    ("subtype_array_nullable",
     (fun () ->
        let t = TRef (RArray TInt) in
        if Typechecker.subtype Tctxt.empty t (TNullRef (RArray TInt)) then () 
        else failwith "TRef (RArray TInt) <: TNullRef (RArray TInt) should hold"));
  ]);

  Test ("Struct Subtype Tests - Width Subtyping", [
    ("subtype_struct_same",
     (fun () ->
        let fields = [{fieldName="x"; ftyp=TInt}; {fieldName="y"; ftyp=TInt}] in
        let tc = mk_struct_ctxt [("Point", fields)] in
        if Typechecker.subtype tc (TRef (RStruct "Point")) (TRef (RStruct "Point")) then ()
        else failwith "Point <: Point should hold"));

    ("subtype_struct_width",
     (fun () ->
        (* S1 has fields x, y, z; S2 has fields x, y *)
        let s1_fields = [{fieldName="x"; ftyp=TInt}; {fieldName="y"; ftyp=TInt}; {fieldName="z"; ftyp=TInt}] in
        let s2_fields = [{fieldName="x"; ftyp=TInt}; {fieldName="y"; ftyp=TInt}] in
        let tc = mk_struct_ctxt [("S1", s1_fields); ("S2", s2_fields)] in
        if Typechecker.subtype tc (TRef (RStruct "S1")) (TRef (RStruct "S2")) then ()
        else failwith "S1 with extra field should be subtype of S2"));

    ("no_subtype_struct_missing_field",
     (fun () ->
        (* S1 has field x; S2 has fields x, y *)
        let s1_fields = [{fieldName="x"; ftyp=TInt}] in
        let s2_fields = [{fieldName="x"; ftyp=TInt}; {fieldName="y"; ftyp=TInt}] in
        let tc = mk_struct_ctxt [("S1", s1_fields); ("S2", s2_fields)] in
        if Typechecker.subtype tc (TRef (RStruct "S1")) (TRef (RStruct "S2")) then
          failwith "S1 missing field y should not be subtype of S2"
        else ()));

    ("subtype_struct_reordered_fields",
     (fun () ->
        (* S1 has x, y, z; S2 has y, x (different order) *)
        let s1_fields = [{fieldName="x"; ftyp=TInt}; {fieldName="y"; ftyp=TInt}; {fieldName="z"; ftyp=TInt}] in
        let s2_fields = [{fieldName="y"; ftyp=TInt}; {fieldName="x"; ftyp=TInt}] in
        let tc = mk_struct_ctxt [("S1", s1_fields); ("S2", s2_fields)] in
        if Typechecker.subtype tc (TRef (RStruct "S1")) (TRef (RStruct "S2")) then ()
        else failwith "S1 should be subtype of S2 (field order shouldn't matter)"));

    ("no_subtype_struct_wrong_field_type",
     (fun () ->
        (* S1 has x:int, y:int; S2 has x:int, y:bool *)
        let s1_fields = [{fieldName="x"; ftyp=TInt}; {fieldName="y"; ftyp=TInt}] in
        let s2_fields = [{fieldName="x"; ftyp=TInt}; {fieldName="y"; ftyp=TBool}] in
        let tc = mk_struct_ctxt [("S1", s1_fields); ("S2", s2_fields)] in
        if Typechecker.subtype tc (TRef (RStruct "S1")) (TRef (RStruct "S2")) then
          failwith "S1.y:int should not be subtype of S2.y:bool"
        else ()));

    ("subtype_struct_nullable",
     (fun () ->
        let fields = [{fieldName="x"; ftyp=TInt}] in
        let tc = mk_struct_ctxt [("S", fields)] in
        if Typechecker.subtype tc (TRef (RStruct "S")) (TNullRef (RStruct "S")) then ()
        else failwith "TRef (RStruct S) <: TNullRef (RStruct S) should hold"));
  ]);

  Test ("Function Subtype Tests", [
    ("subtype_rfun_same",
     (fun () ->
        let r = RFun ([TInt; TRef (RArray TInt)], RetVal (TRef RString)) in
        if Typechecker.subtype Tctxt.empty (TRef r) (TRef r) then () 
        else failwith "RFun equality subtype failed"));

    ("subtype_rfun_void_same",
     (fun () ->
        let r = RFun ([TInt; TBool], RetVoid) in
        if Typechecker.subtype Tctxt.empty (TRef r) (TRef r) then ()
        else failwith "RFun with RetVoid should be equal to itself"));
  ]);
]