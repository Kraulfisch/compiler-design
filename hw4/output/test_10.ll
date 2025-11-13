; generated from: oatprograms/easyrun6.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid71 = alloca i64
  %_func_uid73 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid71
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid73
  %_uop75 = icmp eq i1 1, 0
  %_uop76 = sub i64 0, 4
  %_binop77 = add i64 %_uop76, 5
  %_binop78 = icmp sgt i64 %_binop77, 0
  %_binop79 = mul i64 6, 4
  %_binop80 = icmp slt i64 %_binop79, 25
  %_binop81 = and i1 %_binop78, %_binop80
  %_binop82 = or i1 %_uop75, %_binop81
  br i1 %_binop82, label %_lthen83, label %_lelse84
_lthen83:
  ret i64 9
_lelse84:
  ret i64 4
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
