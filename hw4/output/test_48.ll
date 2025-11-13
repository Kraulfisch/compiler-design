; generated from: oatprograms/run49.oat
target triple = "x86_64-unknown-linux"
@_string_hoist937 = global [4 x i8] c"abc\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid933 = alloca i64
  %_func_uid935 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid933
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid935
  %_str_ptr938 = getelementptr [4 x i8], [4 x i8]* @_string_hoist937, i32 0, i32 0
  call void @print_string(i8* %_str_ptr938)
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
