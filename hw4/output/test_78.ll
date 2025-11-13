; generated from: oatprograms/run47.oat
target triple = "x86_64-unknown-linux"
@a = global i64 1

define i64 @f() {
  %_load_val2616 = load i64, i64* @a
  %_binop2617 = add i64 %_load_val2616, 1
  store i64 %_binop2617, i64* @a
  %_load_val2619 = load i64, i64* @a
  ret i64 %_load_val2619
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2593 = alloca i64
  %_func_uid2595 = alloca { i64, [0 x i8*] }*
  %_b2600 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid2593
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2595
  %_call2597 = call i64 @f()
  %_raw_array2598 = call i64* @oat_alloc_array(i64 %_call2597)
  %_array2599 = bitcast i64* %_raw_array2598 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array2599, { i64, [0 x i64] }** %_b2600
  %_load_ref2601 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b2600
  %_assign_ptr2602 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2601, i32 0, i32 1, i32 0
  store i64 0, i64* %_assign_ptr2602
  %_load_ref2604 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b2600
  %_assign_ptr2605 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2604, i32 0, i32 1, i32 1
  store i64 1, i64* %_assign_ptr2605
  %_load_val2607 = load i64, i64* @a
  %_load_ref2608 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b2600
  %_index_ptr2609 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2608, i32 0, i32 1, i32 0
  %_index_load2610 = load i64, i64* %_index_ptr2609
  %_binop2611 = add i64 %_load_val2607, %_index_load2610
  %_load_ref2612 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b2600
  %_index_ptr2613 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref2612, i32 0, i32 1, i32 1
  %_index_load2614 = load i64, i64* %_index_ptr2613
  %_binop2615 = add i64 %_binop2611, %_index_load2614
  ret i64 %_binop2615
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
