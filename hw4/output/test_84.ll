; generated from: oatprograms/lib7.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2764 = alloca i64
  %_func_uid2766 = alloca { i64, [0 x i8*] }*
  %_arr12780 = alloca { i64, [0 x i64] }*
  %_str2783 = alloca i8*
  %_arr22786 = alloca { i64, [0 x i64] }*
  %_s2787 = alloca i64
  %_i2788 = alloca i64
  store i64 %argc, i64* %_func_uid2764
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2766
  %_raw_array2768 = call i64* @oat_alloc_array(i64 5)
  %_array2769 = bitcast i64* %_raw_array2768 to { i64, [0 x i64] }*
  %_arr_init_ptr2770 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2769, i32 0, i32 1, i32 0
  store i64 111, i64* %_arr_init_ptr2770
  %_arr_init_ptr2772 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2769, i32 0, i32 1, i32 1
  store i64 112, i64* %_arr_init_ptr2772
  %_arr_init_ptr2774 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2769, i32 0, i32 1, i32 2
  store i64 113, i64* %_arr_init_ptr2774
  %_arr_init_ptr2776 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2769, i32 0, i32 1, i32 3
  store i64 114, i64* %_arr_init_ptr2776
  %_arr_init_ptr2778 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2769, i32 0, i32 1, i32 4
  store i64 115, i64* %_arr_init_ptr2778
  store { i64, [0 x i64] }* %_array2769, { i64, [0 x i64] }** %_arr12780
  %_load_ref2781 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr12780
  %_call2782 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref2781)
  store i8* %_call2782, i8** %_str2783
  %_load_ref2784 = load i8*, i8** %_str2783
  %_call2785 = call { i64, [0 x i64] }* @array_of_string(i8* %_load_ref2784)
  store { i64, [0 x i64] }* %_call2785, { i64, [0 x i64] }** %_arr22786
  store i64 0, i64* %_s2787
  store i64 0, i64* %_i2788
  br label %_lpre2801
_lpre2801:
  %_load_val2792 = load i64, i64* %_i2788
  %_binop2793 = icmp slt i64 %_load_val2792, 5
  br i1 %_binop2793, label %_lbody2802, label %_lpost2803
_lbody2802:
  %_load_val2794 = load i64, i64* %_s2787
  %_load_ref2795 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr22786
  %_load_val2796 = load i64, i64* %_i2788
  %_index_ptr2797 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2795, i32 0, i32 1, i64 %_load_val2796
  %_index_load2798 = load i64, i64* %_index_ptr2797
  %_binop2799 = add i64 %_load_val2794, %_index_load2798
  store i64 %_binop2799, i64* %_s2787
  %_load_val2789 = load i64, i64* %_i2788
  %_binop2790 = add i64 %_load_val2789, 1
  store i64 %_binop2790, i64* %_i2788
  br label %_lpre2801
_lpost2803:
  %_load_val2804 = load i64, i64* %_s2787
  ret i64 %_load_val2804
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
