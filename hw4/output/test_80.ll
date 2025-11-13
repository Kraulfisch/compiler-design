; generated from: oatprograms/run53.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2649 = alloca i64
  %_func_uid2651 = alloca { i64, [0 x i8*] }*
  %_str2662 = alloca i8*
  store i64 %argc, i64* %_func_uid2649
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2651
  %_raw_array2653 = call i64* @oat_alloc_array(i64 3)
  %_array2654 = bitcast i64* %_raw_array2653 to { i64, [0 x i64] }*
  %_arr_init_ptr2655 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2654, i32 0, i32 1, i32 0
  store i64 110, i64* %_arr_init_ptr2655
  %_arr_init_ptr2657 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2654, i32 0, i32 1, i32 1
  store i64 110, i64* %_arr_init_ptr2657
  %_arr_init_ptr2659 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2654, i32 0, i32 1, i32 2
  store i64 110, i64* %_arr_init_ptr2659
  %_call2661 = call i8* @string_of_array({ i64, [0 x i64] }* %_array2654)
  store i8* %_call2661, i8** %_str2662
  %_load_ref2663 = load i8*, i8** %_str2662
  call void @print_string(i8* %_load_ref2663)
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
