; generated from: oatprograms/run34.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid543 = alloca i64
  %_func_uid545 = alloca { i64, [0 x i8*] }*
  %_a585 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_s586 = alloca i64
  %_i587 = alloca i64
  %_j593 = alloca i64
  store i64 %argc, i64* %_func_uid543
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid545
  %_raw_array547 = call i64* @oat_alloc_array(i64 3)
  %_array548 = bitcast i64* %_raw_array547 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array549 = call i64* @oat_alloc_array(i64 4)
  %_array550 = bitcast i64* %_raw_array549 to { i64, [0 x i64] }*
  %_arr_init_ptr551 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array550, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr551
  %_arr_init_ptr553 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array550, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr553
  %_arr_init_ptr555 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array550, i32 0, i32 1, i32 2
  store i64 2, i64* %_arr_init_ptr555
  %_arr_init_ptr557 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array550, i32 0, i32 1, i32 3
  store i64 3, i64* %_arr_init_ptr557
  %_arr_init_ptr559 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array548, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array550, { i64, [0 x i64] }** %_arr_init_ptr559
  %_raw_array561 = call i64* @oat_alloc_array(i64 4)
  %_array562 = bitcast i64* %_raw_array561 to { i64, [0 x i64] }*
  %_arr_init_ptr563 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array562, i32 0, i32 1, i32 0
  store i64 4, i64* %_arr_init_ptr563
  %_arr_init_ptr565 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array562, i32 0, i32 1, i32 1
  store i64 5, i64* %_arr_init_ptr565
  %_arr_init_ptr567 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array562, i32 0, i32 1, i32 2
  store i64 6, i64* %_arr_init_ptr567
  %_arr_init_ptr569 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array562, i32 0, i32 1, i32 3
  store i64 7, i64* %_arr_init_ptr569
  %_arr_init_ptr571 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array548, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array562, { i64, [0 x i64] }** %_arr_init_ptr571
  %_raw_array573 = call i64* @oat_alloc_array(i64 4)
  %_array574 = bitcast i64* %_raw_array573 to { i64, [0 x i64] }*
  %_arr_init_ptr575 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array574, i32 0, i32 1, i32 0
  store i64 8, i64* %_arr_init_ptr575
  %_arr_init_ptr577 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array574, i32 0, i32 1, i32 1
  store i64 9, i64* %_arr_init_ptr577
  %_arr_init_ptr579 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array574, i32 0, i32 1, i32 2
  store i64 10, i64* %_arr_init_ptr579
  %_arr_init_ptr581 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array574, i32 0, i32 1, i32 3
  store i64 11, i64* %_arr_init_ptr581
  %_arr_init_ptr583 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array548, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array574, { i64, [0 x i64] }** %_arr_init_ptr583
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array548, { i64, [0 x { i64, [0 x i64] }*] }** %_a585
  store i64 0, i64* %_s586
  store i64 0, i64* %_i587
  br label %_lpre612
_lpre612:
  %_load_val591 = load i64, i64* %_i587
  %_binop592 = icmp slt i64 %_load_val591, 3
  br i1 %_binop592, label %_lbody613, label %_lpost614
_lbody613:
  store i64 0, i64* %_j593
  br label %_lpre609
_lpre609:
  %_load_val597 = load i64, i64* %_j593
  %_binop598 = icmp slt i64 %_load_val597, 4
  br i1 %_binop598, label %_lbody610, label %_lpost611
_lbody610:
  %_load_val599 = load i64, i64* %_s586
  %_load_ref600 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a585
  %_load_val601 = load i64, i64* %_i587
  %_index_ptr602 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref600, i32 0, i32 1, i64 %_load_val601
  %_index_load603 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr602
  %_load_val604 = load i64, i64* %_j593
  %_index_ptr605 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load603, i32 0, i32 1, i64 %_load_val604
  %_index_load606 = load i64, i64* %_index_ptr605
  %_binop607 = add i64 %_load_val599, %_index_load606
  store i64 %_binop607, i64* %_s586
  %_load_val594 = load i64, i64* %_j593
  %_binop595 = add i64 %_load_val594, 1
  store i64 %_binop595, i64* %_j593
  br label %_lpre609
_lpost611:
  %_load_val588 = load i64, i64* %_i587
  %_binop589 = add i64 %_load_val588, 1
  store i64 %_binop589, i64* %_i587
  br label %_lpre612
_lpost614:
  %_load_val615 = load i64, i64* %_s586
  ret i64 %_load_val615
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
