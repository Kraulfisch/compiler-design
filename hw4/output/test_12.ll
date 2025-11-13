; generated from: oatprograms/easyrun8.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid97 = alloca i64
  %_func_uid99 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid97
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid99
  %_binop101 = icmp ne i64 6, 5
  br i1 %_binop101, label %_lthen109, label %_lelse110
_lthen109:
  %_binop102 = shl i64 5, 17
  %_binop103 = lshr i64 %_binop102, 2
  %_binop104 = ashr i64 %_binop103, 10
  %_uop105 = xor i64 %_binop104, -1
  %_binop106 = mul i64 %_uop105, 2
  %_binop107 = sub i64 %_binop106, 100
  %_binop108 = add i64 %_binop107, 6
  ret i64 %_binop108
_lelse110:
  ret i64 2
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
