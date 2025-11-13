; generated from: oatprograms/lib11.oat
target triple = "x86_64-unknown-linux"
@_string_hoist2838 = global [11 x i8] c"1234967890\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2834 = alloca i64
  %_func_uid2836 = alloca { i64, [0 x i8*] }*
  %_arr2841 = alloca { i64, [0 x i64] }*
  %_sum2842 = alloca i64
  %_i2843 = alloca i64
  %_i2857 = alloca i64
  store i64 %argc, i64* %_func_uid2834
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2836
  %_str_ptr2839 = getelementptr [11 x i8], [11 x i8]* @_string_hoist2838, i32 0, i32 0
  %_call2840 = call { i64, [0 x i64] }* @array_of_string(i8* %_str_ptr2839)
  store { i64, [0 x i64] }* %_call2840, { i64, [0 x i64] }** %_arr2841
  store i64 0, i64* %_sum2842
  store i64 0, i64* %_i2843
  br label %_lpre2854
_lpre2854:
  %_load_val2847 = load i64, i64* %_i2843
  %_binop2848 = icmp slt i64 %_load_val2847, 10
  br i1 %_binop2848, label %_lbody2855, label %_lpost2856
_lbody2855:
  %_load_ref2849 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr2841
  %_load_val2850 = load i64, i64* %_i2843
  %_load_val2851 = load i64, i64* %_i2843
  %_assign_ptr2852 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2849, i32 0, i32 1, i64 %_load_val2850
  store i64 %_load_val2851, i64* %_assign_ptr2852
  %_load_val2844 = load i64, i64* %_i2843
  %_binop2845 = add i64 %_load_val2844, 1
  store i64 %_binop2845, i64* %_i2843
  br label %_lpre2854
_lpost2856:
  store i64 0, i64* %_i2857
  br label %_lpre2870
_lpre2870:
  %_load_val2861 = load i64, i64* %_i2857
  %_binop2862 = icmp slt i64 %_load_val2861, 10
  br i1 %_binop2862, label %_lbody2871, label %_lpost2872
_lbody2871:
  %_load_val2863 = load i64, i64* %_sum2842
  %_load_ref2864 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr2841
  %_load_val2865 = load i64, i64* %_i2857
  %_index_ptr2866 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2864, i32 0, i32 1, i64 %_load_val2865
  %_index_load2867 = load i64, i64* %_index_ptr2866
  %_binop2868 = add i64 %_load_val2863, %_index_load2867
  store i64 %_binop2868, i64* %_sum2842
  %_load_val2858 = load i64, i64* %_i2857
  %_binop2859 = add i64 %_load_val2858, 1
  store i64 %_binop2859, i64* %_i2857
  br label %_lpre2870
_lpost2872:
  %_load_val2873 = load i64, i64* %_sum2842
  ret i64 %_load_val2873
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
