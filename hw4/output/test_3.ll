; generated from: oatprograms/globals5.oat
target triple = "x86_64-unknown-linux"
@s = global i8* bitcast ([7 x i8]* @_gstr278 to i8*)
@_gstr278 = global [7 x i8] c"hello!\00"

define i64 @program(i64 %_argc272, { i64, [0 x i8*] }* %_args273) {
  %_args276 = alloca { i64, [0 x i8*] }*
  %_argc274 = alloca i64
  store { i64, [0 x i8*] }* %_args273, { i64, [0 x i8*] }** %_args276
  store i64 %_argc272, i64* %_argc274
  ret i64 17
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
