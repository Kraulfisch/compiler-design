; generated from: oatprograms/easyrun3.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid10 = alloca i64
  %_func_uid12 = alloca { i64, [0 x i8*] }*
  %_x14 = alloca i64
  %_i15 = alloca i64
  store i64 %argc, i64* %_func_uid10
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid12
  store i64 0, i64* %_x14
  store i64 0, i64* %_i15
  br label %_lpre27
_lpre27:
  %_load_val16 = load i64, i64* %_i15
  %_binop17 = icmp slt i64 %_load_val16, 10
  br i1 %_binop17, label %_lbody28, label %_lpost29
_lbody28:
  %_load_val18 = load i64, i64* %_x14
  %_load_val19 = load i64, i64* %_i15
  %_binop20 = add i64 %_load_val18, %_load_val19
  %_load_val21 = load i64, i64* %_i15
  %_binop22 = mul i64 %_binop20, %_load_val21
  store i64 %_binop22, i64* %_x14
  %_load_val24 = load i64, i64* %_i15
  %_binop25 = add i64 %_load_val24, 1
  store i64 %_binop25, i64* %_i15
  br label %_lpre27
_lpost29:
  %_load_val30 = load i64, i64* %_x14
  ret i64 %_load_val30
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
