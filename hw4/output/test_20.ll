; generated from: oatprograms/globals6.oat
target triple = "x86_64-unknown-linux"
@_string_hoist241 = global [7 x i8] c"hello!\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %args) {
  %_func_uid237 = alloca i64
  %_func_uid239 = alloca { i64, [0 x i8*] }*
  %_s243 = alloca i8*
  store i64 %argc, i64* %_func_uid237
  store { i64, [0 x i8*] }* %args, { i64, [0 x i8*] }** %_func_uid239
  %_str_ptr242 = getelementptr [7 x i8], [7 x i8]* @_string_hoist241, i32 0, i32 0
  store i8* %_str_ptr242, i8** %_s243
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
