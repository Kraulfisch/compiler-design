; generated from: oatprograms/lcs.oat
target triple = "x86_64-unknown-linux"
@buf = global { i64, [0 x i64] }* bitcast ({ i64, [1 x i64] }* @_garr_data5628 to { i64, [0 x i64] }*)
@_garr_data5628 = global { i64, [1 x i64] } { i64 1, [1 x i64] [ i64 0 ] }
@_string_hoist5552 = global [1 x i8] c"\00"
@_string_hoist5529 = global [7 x i8] c"TOMATO\00"
@_string_hoist5532 = global [8 x i8] c"ORATING\00"

define i8* @lcs(i64 %i, i64 %j, i8* %a, i8* %b) {
  %_func_uid5539 = alloca i64
  %_func_uid5541 = alloca i64
  %_func_uid5543 = alloca i8*
  %_func_uid5545 = alloca i8*
  %_a_chars5559 = alloca { i64, [0 x i64] }*
  %_b_chars5562 = alloca { i64, [0 x i64] }*
  %_last_char_a5567 = alloca i64
  %_last_char_b5572 = alloca i64
  %_prev_lcs5583 = alloca i8*
  %_next_char5593 = alloca i8*
  %_left_lcs5606 = alloca i8*
  %_right_lcs5613 = alloca i8*
  %_left_len5616 = alloca i64
  %_right_len5619 = alloca i64
  store i64 %i, i64* %_func_uid5539
  store i64 %j, i64* %_func_uid5541
  store i8* %a, i8** %_func_uid5543
  store i8* %b, i8** %_func_uid5545
  %_load_val5547 = load i64, i64* %_func_uid5539
  %_binop5548 = icmp slt i64 %_load_val5547, 0
  %_load_val5549 = load i64, i64* %_func_uid5541
  %_binop5550 = icmp slt i64 %_load_val5549, 0
  %_binop5551 = or i1 %_binop5548, %_binop5550
  br i1 %_binop5551, label %_lthen5554, label %_lelse5555
_lthen5554:
  %_str_ptr5553 = getelementptr [1 x i8], [1 x i8]* @_string_hoist5552, i32 0, i32 0
  ret i8* %_str_ptr5553
_lelse5555:
  br label %_lafter5556
_lafter5556:
  %_load_ref5557 = load i8*, i8** %_func_uid5543
  %_call5558 = call { i64, [0 x i64] }* @array_of_string(i8* %_load_ref5557)
  store { i64, [0 x i64] }* %_call5558, { i64, [0 x i64] }** %_a_chars5559
  %_load_ref5560 = load i8*, i8** %_func_uid5545
  %_call5561 = call { i64, [0 x i64] }* @array_of_string(i8* %_load_ref5560)
  store { i64, [0 x i64] }* %_call5561, { i64, [0 x i64] }** %_b_chars5562
  %_load_ref5563 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a_chars5559
  %_load_val5564 = load i64, i64* %_func_uid5539
  %_index_ptr5565 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5563, i32 0, i32 1, i64 %_load_val5564
  %_index_load5566 = load i64, i64* %_index_ptr5565
  store i64 %_index_load5566, i64* %_last_char_a5567
  %_load_ref5568 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b_chars5562
  %_load_val5569 = load i64, i64* %_func_uid5541
  %_index_ptr5570 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5568, i32 0, i32 1, i64 %_load_val5569
  %_index_load5571 = load i64, i64* %_index_ptr5570
  store i64 %_index_load5571, i64* %_last_char_b5572
  %_load_val5573 = load i64, i64* %_last_char_a5567
  %_load_val5574 = load i64, i64* %_last_char_b5572
  %_binop5575 = icmp eq i64 %_load_val5573, %_load_val5574
  br i1 %_binop5575, label %_lthen5597, label %_lelse5598
_lthen5597:
  %_load_val5576 = load i64, i64* %_func_uid5539
  %_binop5577 = sub i64 %_load_val5576, 1
  %_load_val5578 = load i64, i64* %_func_uid5541
  %_binop5579 = sub i64 %_load_val5578, 1
  %_load_ref5580 = load i8*, i8** %_func_uid5543
  %_load_ref5581 = load i8*, i8** %_func_uid5545
  %_call5582 = call i8* @lcs(i64 %_binop5577, i64 %_binop5579, i8* %_load_ref5580, i8* %_load_ref5581)
  store i8* %_call5582, i8** %_prev_lcs5583
  %_load_ref5584 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @buf
  %_load_ref5585 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a_chars5559
  %_load_val5586 = load i64, i64* %_func_uid5539
  %_index_ptr5587 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5585, i32 0, i32 1, i64 %_load_val5586
  %_index_load5588 = load i64, i64* %_index_ptr5587
  %_assign_ptr5589 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5584, i32 0, i32 1, i32 0
  store i64 %_index_load5588, i64* %_assign_ptr5589
  %_load_ref5591 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @buf
  %_call5592 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref5591)
  store i8* %_call5592, i8** %_next_char5593
  %_load_ref5594 = load i8*, i8** %_prev_lcs5583
  %_load_ref5595 = load i8*, i8** %_next_char5593
  %_call5596 = call i8* @string_cat(i8* %_load_ref5594, i8* %_load_ref5595)
  ret i8* %_call5596
_lelse5598:
  br label %_lafter5599
_lafter5599:
  %_load_val5600 = load i64, i64* %_func_uid5539
  %_load_val5601 = load i64, i64* %_func_uid5541
  %_binop5602 = sub i64 %_load_val5601, 1
  %_load_ref5603 = load i8*, i8** %_func_uid5543
  %_load_ref5604 = load i8*, i8** %_func_uid5545
  %_call5605 = call i8* @lcs(i64 %_load_val5600, i64 %_binop5602, i8* %_load_ref5603, i8* %_load_ref5604)
  store i8* %_call5605, i8** %_left_lcs5606
  %_load_val5607 = load i64, i64* %_func_uid5539
  %_binop5608 = sub i64 %_load_val5607, 1
  %_load_val5609 = load i64, i64* %_func_uid5541
  %_load_ref5610 = load i8*, i8** %_func_uid5543
  %_load_ref5611 = load i8*, i8** %_func_uid5545
  %_call5612 = call i8* @lcs(i64 %_binop5608, i64 %_load_val5609, i8* %_load_ref5610, i8* %_load_ref5611)
  store i8* %_call5612, i8** %_right_lcs5613
  %_load_ref5614 = load i8*, i8** %_left_lcs5606
  %_call5615 = call i64 @length_of_string(i8* %_load_ref5614)
  store i64 %_call5615, i64* %_left_len5616
  %_load_ref5617 = load i8*, i8** %_right_lcs5613
  %_call5618 = call i64 @length_of_string(i8* %_load_ref5617)
  store i64 %_call5618, i64* %_right_len5619
  %_load_val5620 = load i64, i64* %_left_len5616
  %_load_val5621 = load i64, i64* %_right_len5619
  %_binop5622 = icmp slt i64 %_load_val5620, %_load_val5621
  br i1 %_binop5622, label %_lthen5625, label %_lelse5626
_lthen5625:
  %_load_ref5623 = load i8*, i8** %_right_lcs5613
  ret i8* %_load_ref5623
_lelse5626:
  %_load_ref5624 = load i8*, i8** %_left_lcs5606
  ret i8* %_load_ref5624
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid5525 = alloca i64
  %_func_uid5527 = alloca { i64, [0 x i8*] }*
  %_tomato5531 = alloca i8*
  %_orating5534 = alloca i8*
  store i64 %argc, i64* %_func_uid5525
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid5527
  %_str_ptr5530 = getelementptr [7 x i8], [7 x i8]* @_string_hoist5529, i32 0, i32 0
  store i8* %_str_ptr5530, i8** %_tomato5531
  %_str_ptr5533 = getelementptr [8 x i8], [8 x i8]* @_string_hoist5532, i32 0, i32 0
  store i8* %_str_ptr5533, i8** %_orating5534
  %_load_ref5535 = load i8*, i8** %_tomato5531
  %_load_ref5536 = load i8*, i8** %_orating5534
  %_call5537 = call i8* @lcs(i64 5, i64 6, i8* %_load_ref5535, i8* %_load_ref5536)
  call void @print_string(i8* %_call5537)
  ret i64 0
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
