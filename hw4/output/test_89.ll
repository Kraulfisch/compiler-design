; generated from: oatprograms/lib15.oat
target triple = "x86_64-unknown-linux"
define i8* @sub(i8* %str, i64 %start, i64 %len) {
  %_func_uid2913 = alloca i8*
  %_func_uid2915 = alloca i64
  %_func_uid2917 = alloca i64
  %_arr2921 = alloca { i64, [0 x i64] }*
  %_r2925 = alloca { i64, [0 x i64] }*
  %_i2926 = alloca i64
  store i8* %str, i8** %_func_uid2913
  store i64 %start, i64* %_func_uid2915
  store i64 %len, i64* %_func_uid2917
  %_load_ref2919 = load i8*, i8** %_func_uid2913
  %_call2920 = call { i64, [0 x i64] }* @array_of_string(i8* %_load_ref2919)
  store { i64, [0 x i64] }* %_call2920, { i64, [0 x i64] }** %_arr2921
  %_load_val2922 = load i64, i64* %_func_uid2917
  %_raw_array2923 = call i64* @oat_alloc_array(i64 %_load_val2922)
  %_array2924 = bitcast i64* %_raw_array2923 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array2924, { i64, [0 x i64] }** %_r2925
  store i64 0, i64* %_i2926
  br label %_lpre2943
_lpre2943:
  %_load_val2930 = load i64, i64* %_i2926
  %_load_val2931 = load i64, i64* %_func_uid2917
  %_binop2932 = icmp slt i64 %_load_val2930, %_load_val2931
  br i1 %_binop2932, label %_lbody2944, label %_lpost2945
_lbody2944:
  %_load_ref2933 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_r2925
  %_load_val2934 = load i64, i64* %_i2926
  %_load_ref2935 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr2921
  %_load_val2936 = load i64, i64* %_i2926
  %_load_val2937 = load i64, i64* %_func_uid2915
  %_binop2938 = add i64 %_load_val2936, %_load_val2937
  %_index_ptr2939 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2935, i32 0, i32 1, i64 %_binop2938
  %_index_load2940 = load i64, i64* %_index_ptr2939
  %_assign_ptr2941 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2933, i32 0, i32 1, i64 %_load_val2934
  store i64 %_index_load2940, i64* %_assign_ptr2941
  %_load_val2927 = load i64, i64* %_i2926
  %_binop2928 = add i64 %_load_val2927, 1
  store i64 %_binop2928, i64* %_i2926
  br label %_lpre2943
_lpost2945:
  %_load_ref2946 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_r2925
  %_call2947 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref2946)
  ret i8* %_call2947
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2904 = alloca i64
  %_func_uid2906 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid2904
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2906
  %_load_ref2908 = load { i64, [0 x i8*] }*, { i64, [0 x i8*] }** %_func_uid2906
  %_index_ptr2909 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_load_ref2908, i32 0, i32 1, i32 1
  %_index_load2910 = load i8*, i8** %_index_ptr2909
  %_call2911 = call i8* @sub(i8* %_index_load2910, i64 3, i64 5)
  call void @print_string(i8* %_call2911)
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
