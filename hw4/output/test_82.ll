; generated from: oatprograms/lib5.oat
target triple = "x86_64-unknown-linux"
@_string_hoist2697 = global [6 x i8] c"hello\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2693 = alloca i64
  %_func_uid2695 = alloca { i64, [0 x i8*] }*
  %_str2699 = alloca i8*
  %_arr2702 = alloca { i64, [0 x i64] }*
  %_s2703 = alloca i64
  %_i2704 = alloca i64
  store i64 %argc, i64* %_func_uid2693
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2695
  %_str_ptr2698 = getelementptr [6 x i8], [6 x i8]* @_string_hoist2697, i32 0, i32 0
  store i8* %_str_ptr2698, i8** %_str2699
  %_load_ref2700 = load i8*, i8** %_str2699
  %_call2701 = call { i64, [0 x i64] }* @array_of_string(i8* %_load_ref2700)
  store { i64, [0 x i64] }* %_call2701, { i64, [0 x i64] }** %_arr2702
  store i64 0, i64* %_s2703
  store i64 0, i64* %_i2704
  br label %_lpre2717
_lpre2717:
  %_load_val2708 = load i64, i64* %_i2704
  %_binop2709 = icmp slt i64 %_load_val2708, 5
  br i1 %_binop2709, label %_lbody2718, label %_lpost2719
_lbody2718:
  %_load_val2710 = load i64, i64* %_s2703
  %_load_ref2711 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr2702
  %_load_val2712 = load i64, i64* %_i2704
  %_index_ptr2713 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2711, i32 0, i32 1, i64 %_load_val2712
  %_index_load2714 = load i64, i64* %_index_ptr2713
  %_binop2715 = add i64 %_load_val2710, %_index_load2714
  store i64 %_binop2715, i64* %_s2703
  %_load_val2705 = load i64, i64* %_i2704
  %_binop2706 = add i64 %_load_val2705, 1
  store i64 %_binop2706, i64* %_i2704
  br label %_lpre2717
_lpost2719:
  %_load_val2720 = load i64, i64* %_s2703
  ret i64 %_load_val2720
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
