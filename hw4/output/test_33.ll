; generated from: oatprograms/run28.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid468 = alloca i64
  %_func_uid470 = alloca { i64, [0 x i8*] }*
  %_i472 = alloca i64
  %_j476 = alloca i64
  store i64 %argc, i64* %_func_uid468
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid470
  store i64 9, i64* %_i472
  %_load_val473 = load i64, i64* %_i472
  %_load_val474 = load i64, i64* %_i472
  %_binop475 = add i64 %_load_val473, %_load_val474
  store i64 %_binop475, i64* %_j476
  %_load_val477 = load i64, i64* %_i472
  %_load_val478 = load i64, i64* %_i472
  %_load_val479 = load i64, i64* %_i472
  %_binop480 = mul i64 %_load_val478, %_load_val479
  %_binop481 = add i64 %_load_val477, %_binop480
  %_load_val482 = load i64, i64* %_j476
  %_binop483 = sub i64 %_binop481, %_load_val482
  %_binop484 = lshr i64 %_binop483, 2
  %_binop485 = shl i64 %_binop484, 2
  %_binop486 = ashr i64 %_binop485, 2
  ret i64 %_binop486
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
