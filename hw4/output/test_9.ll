; generated from: oatprograms/easyrun5.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid49 = alloca i64
  %_func_uid51 = alloca { i64, [0 x i8*] }*
  %_x54 = alloca i64
  %_y56 = alloca i64
  store i64 %argc, i64* %_func_uid49
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid51
  %_binop53 = lshr i64 100, 3
  store i64 %_binop53, i64* %_x54
  %_binop55 = shl i64 100, 3
  store i64 %_binop55, i64* %_y56
  %_load_val57 = load i64, i64* %_x54
  %_load_val58 = load i64, i64* %_y56
  %_binop59 = sub i64 %_load_val57, %_load_val58
  %_binop60 = icmp sle i64 %_binop59, 0
  br i1 %_binop60, label %_lthen68, label %_lelse69
_lthen68:
  %_load_val61 = load i64, i64* %_x54
  %_uop62 = sub i64 0, %_load_val61
  %_load_val63 = load i64, i64* %_y56
  %_binop64 = sub i64 %_uop62, %_load_val63
  ret i64 %_binop64
_lelse69:
  %_load_val65 = load i64, i64* %_x54
  %_load_val66 = load i64, i64* %_y56
  %_binop67 = sub i64 %_load_val65, %_load_val66
  ret i64 %_binop67
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
