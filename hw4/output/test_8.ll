; generated from: oatprograms/easyrun4.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid31 = alloca i64
  %_func_uid33 = alloca { i64, [0 x i8*] }*
  %_x35 = alloca i64
  %_i36 = alloca i64
  store i64 %argc, i64* %_func_uid31
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid33
  store i64 0, i64* %_x35
  store i64 0, i64* %_i36
  br label %_lpre45
_lpre45:
  %_load_val40 = load i64, i64* %_i36
  %_binop41 = icmp slt i64 %_load_val40, 3
  br i1 %_binop41, label %_lbody46, label %_lpost47
_lbody46:
  %_load_val42 = load i64, i64* %_x35
  %_binop43 = add i64 %_load_val42, 2
  store i64 %_binop43, i64* %_x35
  %_load_val37 = load i64, i64* %_i36
  %_binop38 = add i64 %_load_val37, 1
  store i64 %_binop38, i64* %_i36
  br label %_lpre45
_lpost47:
  %_load_val48 = load i64, i64* %_x35
  ret i64 %_load_val48
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
