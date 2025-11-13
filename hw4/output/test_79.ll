; generated from: oatprograms/run48.oat
target triple = "x86_64-unknown-linux"
@a = global i64 1

define i64 @f() {
  %_load_val2645 = load i64, i64* @a
  %_binop2646 = add i64 %_load_val2645, 1
  store i64 %_binop2646, i64* @a
  %_load_val2648 = load i64, i64* @a
  ret i64 %_load_val2648
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2620 = alloca i64
  %_func_uid2622 = alloca { i64, [0 x i8*] }*
  %_b2627 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid2620
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2622
  %_call2624 = call i64 @f()
  %_raw_array2625 = call i64* @oat_alloc_array(i64 %_call2624)
  %_array2626 = bitcast i64* %_raw_array2625 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array2626, { i64, [0 x i64] }** %_b2627
  %_load_ref2628 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b2627
  %_call2629 = call i64 @f()
  %_assign_ptr2630 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2628, i32 0, i32 1, i32 0
  store i64 %_call2629, i64* %_assign_ptr2630
  %_load_ref2632 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b2627
  %_call2633 = call i64 @f()
  %_assign_ptr2634 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2632, i32 0, i32 1, i32 1
  store i64 %_call2633, i64* %_assign_ptr2634
  %_load_val2636 = load i64, i64* @a
  %_load_ref2637 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b2627
  %_index_ptr2638 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2637, i32 0, i32 1, i32 0
  %_index_load2639 = load i64, i64* %_index_ptr2638
  %_binop2640 = add i64 %_load_val2636, %_index_load2639
  %_load_ref2641 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b2627
  %_index_ptr2642 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2641, i32 0, i32 1, i32 1
  %_index_load2643 = load i64, i64* %_index_ptr2642
  %_binop2644 = add i64 %_binop2640, %_index_load2643
  ret i64 %_binop2644
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
