; generated from: oatprograms/lib6.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2721 = alloca i64
  %_func_uid2723 = alloca { i64, [0 x i8*] }*
  %_arr12737 = alloca { i64, [0 x i64] }*
  %_str2740 = alloca i8*
  %_arr22743 = alloca { i64, [0 x i64] }*
  %_s2744 = alloca i64
  %_i2745 = alloca i64
  store i64 %argc, i64* %_func_uid2721
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2723
  %_raw_array2725 = call i64* @oat_alloc_array(i64 5)
  %_array2726 = bitcast i64* %_raw_array2725 to { i64, [0 x i64] }*
  %_arr_init_ptr2727 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2726, i32 0, i32 1, i32 0
  store i64 111, i64* %_arr_init_ptr2727
  %_arr_init_ptr2729 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2726, i32 0, i32 1, i32 1
  store i64 112, i64* %_arr_init_ptr2729
  %_arr_init_ptr2731 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2726, i32 0, i32 1, i32 2
  store i64 113, i64* %_arr_init_ptr2731
  %_arr_init_ptr2733 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2726, i32 0, i32 1, i32 3
  store i64 114, i64* %_arr_init_ptr2733
  %_arr_init_ptr2735 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2726, i32 0, i32 1, i32 4
  store i64 115, i64* %_arr_init_ptr2735
  store { i64, [0 x i64] }* %_array2726, { i64, [0 x i64] }** %_arr12737
  %_load_ref2738 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr12737
  %_call2739 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref2738)
  store i8* %_call2739, i8** %_str2740
  %_load_ref2741 = load i8*, i8** %_str2740
  %_call2742 = call { i64, [0 x i64] }* @array_of_string(i8* %_load_ref2741)
  store { i64, [0 x i64] }* %_call2742, { i64, [0 x i64] }** %_arr22743
  store i64 0, i64* %_s2744
  store i64 0, i64* %_i2745
  br label %_lpre2758
_lpre2758:
  %_load_val2749 = load i64, i64* %_i2745
  %_binop2750 = icmp slt i64 %_load_val2749, 5
  br i1 %_binop2750, label %_lbody2759, label %_lpost2760
_lbody2759:
  %_load_val2751 = load i64, i64* %_s2744
  %_load_ref2752 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr22743
  %_load_val2753 = load i64, i64* %_i2745
  %_index_ptr2754 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2752, i32 0, i32 1, i64 %_load_val2753
  %_index_load2755 = load i64, i64* %_index_ptr2754
  %_binop2756 = add i64 %_load_val2751, %_index_load2755
  store i64 %_binop2756, i64* %_s2744
  %_load_val2746 = load i64, i64* %_i2745
  %_binop2747 = add i64 %_load_val2746, 1
  store i64 %_binop2747, i64* %_i2745
  br label %_lpre2758
_lpost2760:
  %_load_val2761 = load i64, i64* %_s2744
  call void @print_int(i64 %_load_val2761)
  %_load_val2763 = load i64, i64* %_s2744
  ret i64 %_load_val2763
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
