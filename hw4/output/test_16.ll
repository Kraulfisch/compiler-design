; generated from: oatprograms/globals2.oat
target triple = "x86_64-unknown-linux"
@y = global i1 1

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %args) {
  %_func_uid215 = alloca i64
  %_func_uid217 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid215
  store { i64, [0 x i8*] }* %args, { i64, [0 x i8*] }** %_func_uid217
  %_load_val219 = load i1, i1* @y
  br i1 %_load_val219, label %_lthen220, label %_lelse221
_lthen220:
  ret i64 17
_lelse221:
  br label %_lafter222
_lafter222:
  ret i64 15
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
