; generated from: oatprograms/lib8.oat
target triple = "x86_64-unknown-linux"
@_string_hoist2809 = global [13 x i8] c"Hello world!\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2805 = alloca i64
  %_func_uid2807 = alloca { i64, [0 x i8*] }*
  %_str2811 = alloca i8*
  store i64 %argc, i64* %_func_uid2805
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2807
  %_str_ptr2810 = getelementptr [13 x i8], [13 x i8]* @_string_hoist2809, i32 0, i32 0
  store i8* %_str_ptr2810, i8** %_str2811
  %_load_ref2812 = load i8*, i8** %_str2811
  call void @print_string(i8* %_load_ref2812)
  ret i64 0
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
