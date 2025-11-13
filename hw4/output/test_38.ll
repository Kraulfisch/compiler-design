; generated from: oatprograms/run33.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid523 = alloca i64
  %_func_uid525 = alloca { i64, [0 x i8*] }*
  %_b533 = alloca { i64, [0 x i1] }*
  %_i534 = alloca i64
  store i64 %argc, i64* %_func_uid523
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid525
  %_raw_array527 = call i64* @oat_alloc_array(i64 2)
  %_array528 = bitcast i64* %_raw_array527 to { i64, [0 x i1] }*
  %_arr_init_ptr529 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_array528, i32 0, i32 1, i32 0
  store i1 1, i1* %_arr_init_ptr529
  %_arr_init_ptr531 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_array528, i32 0, i32 1, i32 1
  store i1 0, i1* %_arr_init_ptr531
  store { i64, [0 x i1] }* %_array528, { i64, [0 x i1] }** %_b533
  store i64 0, i64* %_i534
  %_load_ref535 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_b533
  %_index_ptr536 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref535, i32 0, i32 1, i32 0
  %_index_load537 = load i1, i1* %_index_ptr536
  br i1 %_index_load537, label %_lthen539, label %_lelse540
_lthen539:
  store i64 1, i64* %_i534
  br label %_lafter541
_lelse540:
  br label %_lafter541
_lafter541:
  %_load_val542 = load i64, i64* %_i534
  ret i64 %_load_val542
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
