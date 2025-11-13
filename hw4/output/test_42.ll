; generated from: oatprograms/run37.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid703 = alloca i64
  %_func_uid705 = alloca { i64, [0 x i8*] }*
  %_a725 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %argc, i64* %_func_uid703
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid705
  %_raw_array707 = call i64* @oat_alloc_array(i64 2)
  %_array708 = bitcast i64* %_raw_array707 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array709 = call i64* @oat_alloc_array(i64 2)
  %_array710 = bitcast i64* %_raw_array709 to { i64, [0 x i64] }*
  %_arr_init_ptr711 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array710, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr711
  %_arr_init_ptr713 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array710, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr713
  %_arr_init_ptr715 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array708, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array710, { i64, [0 x i64] }** %_arr_init_ptr715
  %_raw_array717 = call i64* @oat_alloc_array(i64 2)
  %_array718 = bitcast i64* %_raw_array717 to { i64, [0 x i64] }*
  %_arr_init_ptr719 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array718, i32 0, i32 1, i32 0
  store i64 3, i64* %_arr_init_ptr719
  %_arr_init_ptr721 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array718, i32 0, i32 1, i32 1
  store i64 4, i64* %_arr_init_ptr721
  %_arr_init_ptr723 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array708, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array718, { i64, [0 x i64] }** %_arr_init_ptr723
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array708, { i64, [0 x { i64, [0 x i64] }*] }** %_a725
  %_load_ref726 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a725
  %_index_ptr727 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref726, i32 0, i32 1, i32 0
  %_index_load728 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr727
  %_index_ptr729 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load728, i32 0, i32 1, i32 1
  %_index_load730 = load i64, i64* %_index_ptr729
  ret i64 %_index_load730
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
