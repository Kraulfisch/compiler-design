; generated from: oatprograms/insertion_sort.oat
target triple = "x86_64-unknown-linux"
define { i64, [0 x i64] }* @insert({ i64, [0 x i64] }* %partial, i64 %len, i64 %insertee) {
  %_func_uid5688 = alloca { i64, [0 x i64] }*
  %_func_uid5690 = alloca i64
  %_func_uid5692 = alloca i64
  %_inserted5698 = alloca { i64, [0 x i64] }*
  %_i5699 = alloca i64
  %_not_yet_inserted5715 = alloca i1
  %_i5729 = alloca i64
  store { i64, [0 x i64] }* %partial, { i64, [0 x i64] }** %_func_uid5688
  store i64 %len, i64* %_func_uid5690
  store i64 %insertee, i64* %_func_uid5692
  %_load_val5694 = load i64, i64* %_func_uid5690
  %_binop5695 = add i64 %_load_val5694, 1
  %_raw_array5696 = call i64* @oat_alloc_array(i64 %_binop5695)
  %_array5697 = bitcast i64* %_raw_array5696 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array5697, { i64, [0 x i64] }** %_inserted5698
  store i64 0, i64* %_i5699
  br label %_lpre5712
_lpre5712:
  %_load_val5703 = load i64, i64* %_i5699
  %_load_val5704 = load i64, i64* %_func_uid5690
  %_binop5705 = add i64 %_load_val5704, 1
  %_binop5706 = icmp slt i64 %_load_val5703, %_binop5705
  br i1 %_binop5706, label %_lbody5713, label %_lpost5714
_lbody5713:
  %_load_ref5707 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5698
  %_load_val5708 = load i64, i64* %_i5699
  %_uop5709 = sub i64 0, 1
  %_assign_ptr5710 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5707, i32 0, i32 1, i64 %_load_val5708
  store i64 %_uop5709, i64* %_assign_ptr5710
  %_load_val5700 = load i64, i64* %_i5699
  %_binop5701 = add i64 %_load_val5700, 1
  store i64 %_binop5701, i64* %_i5699
  br label %_lpre5712
_lpost5714:
  store i1 1, i1* %_not_yet_inserted5715
  %_load_val5716 = load i64, i64* %_func_uid5692
  %_load_ref5717 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5688
  %_index_ptr5718 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5717, i32 0, i32 1, i32 0
  %_index_load5719 = load i64, i64* %_index_ptr5718
  %_binop5720 = icmp slt i64 %_load_val5716, %_index_load5719
  br i1 %_binop5720, label %_lthen5726, label %_lelse5727
_lthen5726:
  store i1 0, i1* %_not_yet_inserted5715
  %_load_ref5722 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5698
  %_load_val5723 = load i64, i64* %_func_uid5692
  %_assign_ptr5724 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5722, i32 0, i32 1, i32 0
  store i64 %_load_val5723, i64* %_assign_ptr5724
  br label %_lafter5728
_lelse5727:
  br label %_lafter5728
_lafter5728:
  store i64 0, i64* %_i5729
  br label %_lpre5781
_lpre5781:
  %_load_val5733 = load i64, i64* %_i5729
  %_load_val5734 = load i64, i64* %_func_uid5690
  %_binop5735 = icmp slt i64 %_load_val5733, %_load_val5734
  br i1 %_binop5735, label %_lbody5782, label %_lpost5783
_lbody5782:
  %_load_val5736 = load i1, i1* %_not_yet_inserted5715
  br i1 %_load_val5736, label %_lthen5778, label %_lelse5779
_lthen5778:
  %_load_val5737 = load i64, i64* %_func_uid5692
  %_load_ref5738 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5688
  %_load_val5739 = load i64, i64* %_i5729
  %_index_ptr5740 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5738, i32 0, i32 1, i64 %_load_val5739
  %_index_load5741 = load i64, i64* %_index_ptr5740
  %_binop5742 = icmp sgt i64 %_load_val5737, %_index_load5741
  br i1 %_binop5742, label %_lthen5766, label %_lelse5767
_lthen5766:
  store i1 0, i1* %_not_yet_inserted5715
  %_load_ref5744 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5698
  %_load_val5745 = load i64, i64* %_i5729
  %_binop5746 = add i64 %_load_val5745, 1
  %_load_val5747 = load i64, i64* %_func_uid5692
  %_assign_ptr5748 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5744, i32 0, i32 1, i64 %_binop5746
  store i64 %_load_val5747, i64* %_assign_ptr5748
  %_load_ref5750 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5698
  %_load_val5751 = load i64, i64* %_i5729
  %_load_ref5752 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5688
  %_load_val5753 = load i64, i64* %_i5729
  %_index_ptr5754 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5752, i32 0, i32 1, i64 %_load_val5753
  %_index_load5755 = load i64, i64* %_index_ptr5754
  %_assign_ptr5756 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5750, i32 0, i32 1, i64 %_load_val5751
  store i64 %_index_load5755, i64* %_assign_ptr5756
  br label %_lafter5768
_lelse5767:
  %_load_ref5758 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5698
  %_load_val5759 = load i64, i64* %_i5729
  %_load_ref5760 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5688
  %_load_val5761 = load i64, i64* %_i5729
  %_index_ptr5762 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5760, i32 0, i32 1, i64 %_load_val5761
  %_index_load5763 = load i64, i64* %_index_ptr5762
  %_assign_ptr5764 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5758, i32 0, i32 1, i64 %_load_val5759
  store i64 %_index_load5763, i64* %_assign_ptr5764
  br label %_lafter5768
_lafter5768:
  br label %_lafter5780
_lelse5779:
  %_load_ref5769 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5698
  %_load_val5770 = load i64, i64* %_i5729
  %_binop5771 = add i64 %_load_val5770, 1
  %_load_ref5772 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5688
  %_load_val5773 = load i64, i64* %_i5729
  %_index_ptr5774 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5772, i32 0, i32 1, i64 %_load_val5773
  %_index_load5775 = load i64, i64* %_index_ptr5774
  %_assign_ptr5776 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5769, i32 0, i32 1, i64 %_binop5771
  store i64 %_index_load5775, i64* %_assign_ptr5776
  br label %_lafter5780
_lafter5780:
  %_load_val5730 = load i64, i64* %_i5729
  %_binop5731 = add i64 %_load_val5730, 1
  store i64 %_binop5731, i64* %_i5729
  br label %_lpre5781
_lpost5783:
  %_load_ref5784 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted5698
  ret { i64, [0 x i64] }* %_load_ref5784
}

define { i64, [0 x i64] }* @insort({ i64, [0 x i64] }* %unsorted, i64 %len) {
  %_func_uid5654 = alloca { i64, [0 x i64] }*
  %_func_uid5656 = alloca i64
  %_out5662 = alloca { i64, [0 x i64] }*
  %_i5669 = alloca i64
  store { i64, [0 x i64] }* %unsorted, { i64, [0 x i64] }** %_func_uid5654
  store i64 %len, i64* %_func_uid5656
  %_raw_array5658 = call i64* @oat_alloc_array(i64 1)
  %_array5659 = bitcast i64* %_raw_array5658 to { i64, [0 x i64] }*
  %_arr_init_ptr5660 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5659, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr5660
  store { i64, [0 x i64] }* %_array5659, { i64, [0 x i64] }** %_out5662
  %_load_ref5663 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out5662
  %_load_ref5664 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5654
  %_index_ptr5665 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5664, i32 0, i32 1, i32 0
  %_index_load5666 = load i64, i64* %_index_ptr5665
  %_assign_ptr5667 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5663, i32 0, i32 1, i32 0
  store i64 %_index_load5666, i64* %_assign_ptr5667
  store i64 1, i64* %_i5669
  br label %_lpre5684
_lpre5684:
  %_load_val5673 = load i64, i64* %_i5669
  %_load_val5674 = load i64, i64* %_func_uid5656
  %_binop5675 = icmp slt i64 %_load_val5673, %_load_val5674
  br i1 %_binop5675, label %_lbody5685, label %_lpost5686
_lbody5685:
  %_load_ref5676 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out5662
  %_load_val5677 = load i64, i64* %_i5669
  %_load_ref5678 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5654
  %_load_val5679 = load i64, i64* %_i5669
  %_index_ptr5680 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5678, i32 0, i32 1, i64 %_load_val5679
  %_index_load5681 = load i64, i64* %_index_ptr5680
  %_call5682 = call { i64, [0 x i64] }* @insert({ i64, [0 x i64] }* %_load_ref5676, i64 %_load_val5677, i64 %_index_load5681)
  store { i64, [0 x i64] }* %_call5682, { i64, [0 x i64] }** %_out5662
  %_load_val5670 = load i64, i64* %_i5669
  %_binop5671 = add i64 %_load_val5670, 1
  store i64 %_binop5671, i64* %_i5669
  br label %_lpre5684
_lpost5686:
  %_load_ref5687 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out5662
  ret { i64, [0 x i64] }* %_load_ref5687
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid5629 = alloca i64
  %_func_uid5631 = alloca { i64, [0 x i8*] }*
  %_array5647 = alloca { i64, [0 x i64] }*
  %_result5650 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid5629
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid5631
  %_raw_array5633 = call i64* @oat_alloc_array(i64 6)
  %_array5634 = bitcast i64* %_raw_array5633 to { i64, [0 x i64] }*
  %_arr_init_ptr5635 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5634, i32 0, i32 1, i32 0
  store i64 13, i64* %_arr_init_ptr5635
  %_arr_init_ptr5637 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5634, i32 0, i32 1, i32 1
  store i64 42, i64* %_arr_init_ptr5637
  %_arr_init_ptr5639 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5634, i32 0, i32 1, i32 2
  store i64 32, i64* %_arr_init_ptr5639
  %_arr_init_ptr5641 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5634, i32 0, i32 1, i32 3
  store i64 3, i64* %_arr_init_ptr5641
  %_arr_init_ptr5643 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5634, i32 0, i32 1, i32 4
  store i64 2, i64* %_arr_init_ptr5643
  %_arr_init_ptr5645 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5634, i32 0, i32 1, i32 5
  store i64 6, i64* %_arr_init_ptr5645
  store { i64, [0 x i64] }* %_array5634, { i64, [0 x i64] }** %_array5647
  %_load_ref5648 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5647
  %_call5649 = call { i64, [0 x i64] }* @insort({ i64, [0 x i64] }* %_load_ref5648, i64 6)
  store { i64, [0 x i64] }* %_call5649, { i64, [0 x i64] }** %_result5650
  %_load_ref5651 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_result5650
  %_index_ptr5652 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5651, i32 0, i32 1, i32 5
  %_index_load5653 = load i64, i64* %_index_ptr5652
  ret i64 %_index_load5653
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
