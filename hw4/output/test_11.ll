; generated from: oatprograms/easyrun7.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid86 = alloca i64
  %_func_uid88 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid86
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid88
  %_uop90 = xor i64 5, -1
  %_binop91 = and i64 %_uop90, 6
  %_binop92 = or i64 2, 0
  %_binop93 = icmp sge i64 %_binop91, %_binop92
  br i1 %_binop93, label %_lthen94, label %_lelse95
_lthen94:
  ret i64 23
_lelse95:
  ret i64 46
}


declare i64* @oat_alloc_array(i64)
declare { i64, [0 x i64] }* @array_of_string(i8*)
declare i8* @string_of_array({ i64, [0 x i64] }*)
declare i64 @length_of_string(i8*)
declare i8* @string_of_int(i64)
declare i8* @string_cat(i8*, i8*)
declare void @print_string(i8*)
declare void @print_int(i64)
declare void @print_bool(i1)
