; generated from: oatprograms/lib9.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2814 = alloca i64
  %_func_uid2816 = alloca { i64, [0 x i8*] }*
  %_i2818 = alloca i64
  store i64 %argc, i64* %_func_uid2814
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2816
  store i64 1, i64* %_i2818
  br label %_lpre2830
_lpre2830:
  %_load_val2822 = load i64, i64* %_i2818
  %_load_val2823 = load i64, i64* %_func_uid2814
  %_binop2824 = icmp slt i64 %_load_val2822, %_load_val2823
  br i1 %_binop2824, label %_lbody2831, label %_lpost2832
_lbody2831:
  %_load_ref2825 = load { i64, [0 x i8*] }*, { i64, [0 x i8*] }** %_func_uid2816
  %_load_val2826 = load i64, i64* %_i2818
  %_index_ptr2827 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_load_ref2825, i32 0, i32 1, i64 %_load_val2826
  %_index_load2828 = load i8*, i8** %_index_ptr2827
  call void @print_string(i8* %_index_load2828)
  %_load_val2819 = load i64, i64* %_i2818
  %_binop2820 = add i64 %_load_val2819, 1
  store i64 %_binop2820, i64* %_i2818
  br label %_lpre2830
_lpost2832:
  %_load_val2833 = load i64, i64* %_func_uid2814
  ret i64 %_load_val2833
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
