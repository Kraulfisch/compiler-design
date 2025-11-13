; generated from: oatprograms/run29.oat
target triple = "x86_64-unknown-linux"
@b = global i1 1

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid487 = alloca i64
  %_func_uid489 = alloca { i64, [0 x i8*] }*
  %_i491 = alloca i64
  store i64 %argc, i64* %_func_uid487
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid489
  store i64 0, i64* %_i491
  %_load_val492 = load i1, i1* @b
  br i1 %_load_val492, label %_lthen494, label %_lelse495
_lthen494:
  store i64 1, i64* %_i491
  br label %_lafter496
_lelse495:
  br label %_lafter496
_lafter496:
  %_load_val497 = load i64, i64* %_i491
  ret i64 %_load_val497
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
