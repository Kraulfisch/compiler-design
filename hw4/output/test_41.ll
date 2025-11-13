; generated from: oatprograms/run36.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid689 = alloca i64
  %_func_uid691 = alloca { i64, [0 x i8*] }*
  %_a699 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid689
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid691
  %_raw_array693 = call i64* @oat_alloc_array(i64 2)
  %_array694 = bitcast i64* %_raw_array693 to { i64, [0 x i64] }*
  %_arr_init_ptr695 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array694, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr695
  %_arr_init_ptr697 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array694, i32 0, i32 1, i32 1
  store i64 0, i64* %_arr_init_ptr697
  store { i64, [0 x i64] }* %_array694, { i64, [0 x i64] }** %_a699
  %_load_ref700 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a699
  %_index_ptr701 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref700, i32 0, i32 1, i32 1
  %_index_load702 = load i64, i64* %_index_ptr701
  ret i64 %_index_load702
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
