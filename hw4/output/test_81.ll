; generated from: oatprograms/lib4.oat
target triple = "x86_64-unknown-linux"
@str = global i8* bitcast ([6 x i8]* @_str_data2692 to i8*)
@_str_data2692 = global [6 x i8] c"hello\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2665 = alloca i64
  %_func_uid2667 = alloca { i64, [0 x i8*] }*
  %_arr2671 = alloca { i64, [0 x i64] }*
  %_s2672 = alloca i64
  %_i2673 = alloca i64
  store i64 %argc, i64* %_func_uid2665
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2667
  %_load_ref2669 = load i8*, i8** @str
  %_call2670 = call { i64, [0 x i64] }* @array_of_string(i8* %_load_ref2669)
  store { i64, [0 x i64] }* %_call2670, { i64, [0 x i64] }** %_arr2671
  store i64 0, i64* %_s2672
  store i64 0, i64* %_i2673
  br label %_lpre2686
_lpre2686:
  %_load_val2677 = load i64, i64* %_i2673
  %_binop2678 = icmp slt i64 %_load_val2677, 5
  br i1 %_binop2678, label %_lbody2687, label %_lpost2688
_lbody2687:
  %_load_val2679 = load i64, i64* %_s2672
  %_load_ref2680 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr2671
  %_load_val2681 = load i64, i64* %_i2673
  %_index_ptr2682 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2680, i32 0, i32 1, i64 %_load_val2681
  %_index_load2683 = load i64, i64* %_index_ptr2682
  %_binop2684 = add i64 %_load_val2679, %_index_load2683
  store i64 %_binop2684, i64* %_s2672
  %_load_val2674 = load i64, i64* %_i2673
  %_binop2675 = add i64 %_load_val2674, 1
  store i64 %_binop2675, i64* %_i2673
  br label %_lpre2686
_lpost2688:
  %_load_val2689 = load i64, i64* %_s2672
  call void @print_int(i64 %_load_val2689)
  %_load_val2691 = load i64, i64* %_s2672
  ret i64 %_load_val2691
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
