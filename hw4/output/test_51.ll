; generated from: oatprograms/run61.oat
target triple = "x86_64-unknown-linux"
@s = global i8* bitcast ([3 x i8]* @_str_data959 to i8*)
@_str_data959 = global [3 x i8] c"42\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid953 = alloca i64
  %_func_uid955 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid953
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid955
  %_load_ref957 = load i8*, i8** @s
  call void @print_string(i8* %_load_ref957)
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
