; generated from: oatprograms/lib14.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2874 = alloca i64
  %_func_uid2876 = alloca { i64, [0 x i8*] }*
  %_a2900 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid2874
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2876
  %_raw_array2878 = call i64* @oat_alloc_array(i64 10)
  %_array2879 = bitcast i64* %_raw_array2878 to { i64, [0 x i64] }*
  %_arr_init_ptr2880 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2879, i32 0, i32 1, i32 0
  store i64 126, i64* %_arr_init_ptr2880
  %_arr_init_ptr2882 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2879, i32 0, i32 1, i32 1
  store i64 125, i64* %_arr_init_ptr2882
  %_arr_init_ptr2884 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2879, i32 0, i32 1, i32 2
  store i64 124, i64* %_arr_init_ptr2884
  %_arr_init_ptr2886 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2879, i32 0, i32 1, i32 3
  store i64 123, i64* %_arr_init_ptr2886
  %_arr_init_ptr2888 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2879, i32 0, i32 1, i32 4
  store i64 122, i64* %_arr_init_ptr2888
  %_arr_init_ptr2890 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2879, i32 0, i32 1, i32 5
  store i64 121, i64* %_arr_init_ptr2890
  %_arr_init_ptr2892 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2879, i32 0, i32 1, i32 6
  store i64 120, i64* %_arr_init_ptr2892
  %_arr_init_ptr2894 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2879, i32 0, i32 1, i32 7
  store i64 119, i64* %_arr_init_ptr2894
  %_arr_init_ptr2896 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2879, i32 0, i32 1, i32 8
  store i64 118, i64* %_arr_init_ptr2896
  %_arr_init_ptr2898 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2879, i32 0, i32 1, i32 9
  store i64 117, i64* %_arr_init_ptr2898
  store { i64, [0 x i64] }* %_array2879, { i64, [0 x i64] }** %_a2900
  %_load_ref2901 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2900
  %_call2902 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref2901)
  call void @print_string(i8* %_call2902)
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
