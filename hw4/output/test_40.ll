; generated from: oatprograms/run35.oat
target triple = "x86_64-unknown-linux"
@a = global { i64, [0 x { i64, [0 x i64] }*] }* null

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid616 = alloca i64
  %_func_uid618 = alloca { i64, [0 x i8*] }*
  %_s659 = alloca i64
  %_i660 = alloca i64
  %_j666 = alloca i64
  store i64 %argc, i64* %_func_uid616
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid618
  %_raw_array620 = call i64* @oat_alloc_array(i64 3)
  %_array621 = bitcast i64* %_raw_array620 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array622 = call i64* @oat_alloc_array(i64 4)
  %_array623 = bitcast i64* %_raw_array622 to { i64, [0 x i64] }*
  %_arr_init_ptr624 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array623, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr624
  %_arr_init_ptr626 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array623, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr626
  %_arr_init_ptr628 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array623, i32 0, i32 1, i32 2
  store i64 2, i64* %_arr_init_ptr628
  %_arr_init_ptr630 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array623, i32 0, i32 1, i32 3
  store i64 3, i64* %_arr_init_ptr630
  %_arr_init_ptr632 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array621, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array623, { i64, [0 x i64] }** %_arr_init_ptr632
  %_raw_array634 = call i64* @oat_alloc_array(i64 4)
  %_array635 = bitcast i64* %_raw_array634 to { i64, [0 x i64] }*
  %_arr_init_ptr636 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array635, i32 0, i32 1, i32 0
  store i64 4, i64* %_arr_init_ptr636
  %_arr_init_ptr638 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array635, i32 0, i32 1, i32 1
  store i64 5, i64* %_arr_init_ptr638
  %_arr_init_ptr640 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array635, i32 0, i32 1, i32 2
  store i64 6, i64* %_arr_init_ptr640
  %_arr_init_ptr642 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array635, i32 0, i32 1, i32 3
  store i64 7, i64* %_arr_init_ptr642
  %_arr_init_ptr644 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array621, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array635, { i64, [0 x i64] }** %_arr_init_ptr644
  %_raw_array646 = call i64* @oat_alloc_array(i64 4)
  %_array647 = bitcast i64* %_raw_array646 to { i64, [0 x i64] }*
  %_arr_init_ptr648 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array647, i32 0, i32 1, i32 0
  store i64 8, i64* %_arr_init_ptr648
  %_arr_init_ptr650 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array647, i32 0, i32 1, i32 1
  store i64 9, i64* %_arr_init_ptr650
  %_arr_init_ptr652 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array647, i32 0, i32 1, i32 2
  store i64 10, i64* %_arr_init_ptr652
  %_arr_init_ptr654 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array647, i32 0, i32 1, i32 3
  store i64 11, i64* %_arr_init_ptr654
  %_arr_init_ptr656 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array621, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array647, { i64, [0 x i64] }** %_arr_init_ptr656
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array621, { i64, [0 x { i64, [0 x i64] }*] }** @a
  store i64 0, i64* %_s659
  store i64 0, i64* %_i660
  br label %_lpre685
_lpre685:
  %_load_val664 = load i64, i64* %_i660
  %_binop665 = icmp slt i64 %_load_val664, 3
  br i1 %_binop665, label %_lbody686, label %_lpost687
_lbody686:
  store i64 0, i64* %_j666
  br label %_lpre682
_lpre682:
  %_load_val670 = load i64, i64* %_j666
  %_binop671 = icmp slt i64 %_load_val670, 4
  br i1 %_binop671, label %_lbody683, label %_lpost684
_lbody683:
  %_load_val672 = load i64, i64* %_s659
  %_load_ref673 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** @a
  %_load_val674 = load i64, i64* %_i660
  %_index_ptr675 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref673, i32 0, i32 1, i64 %_load_val674
  %_index_load676 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr675
  %_load_val677 = load i64, i64* %_j666
  %_index_ptr678 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load676, i32 0, i32 1, i64 %_load_val677
  %_index_load679 = load i64, i64* %_index_ptr678
  %_binop680 = add i64 %_load_val672, %_index_load679
  store i64 %_binop680, i64* %_s659
  %_load_val667 = load i64, i64* %_j666
  %_binop668 = add i64 %_load_val667, 1
  store i64 %_binop668, i64* %_j666
  br label %_lpre682
_lpost684:
  %_load_val661 = load i64, i64* %_i660
  %_binop662 = add i64 %_load_val661, 1
  store i64 %_binop662, i64* %_i660
  br label %_lpre685
_lpost687:
  %_load_val688 = load i64, i64* %_s659
  ret i64 %_load_val688
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
