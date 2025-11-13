; generated from: oatprograms/run32.oat
target triple = "x86_64-unknown-linux"
@i = global i64 11

define i64 @f() {
  %_i521 = alloca i64
  store i64 12, i64* %_i521
  %_load_val522 = load i64, i64* %_i521
  ret i64 %_load_val522
}

define i64 @g() {
  %_i519 = alloca i64
  store i64 10, i64* %_i519
  %_load_val520 = load i64, i64* %_i519
  ret i64 %_load_val520
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid510 = alloca i64
  %_func_uid512 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid510
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid512
  %_call514 = call i64 @f()
  %_call515 = call i64 @g()
  %_binop516 = add i64 %_call514, %_call515
  %_load_val517 = load i64, i64* @i
  %_binop518 = add i64 %_binop516, %_load_val517
  ret i64 %_binop518
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
