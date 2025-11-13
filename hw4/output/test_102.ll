; generated from: oatprograms/heap.oat
target triple = "x86_64-unknown-linux"
define void @min_heapify({ i64, [0 x i64] }* %array, i64 %i, i64 %len) {
  %_func_uid4739 = alloca { i64, [0 x i64] }*
  %_func_uid4741 = alloca i64
  %_func_uid4743 = alloca i64
  %_l4747 = alloca i64
  %_r4750 = alloca i64
  %_tmp4751 = alloca i64
  %_m4753 = alloca i64
  store { i64, [0 x i64] }* %array, { i64, [0 x i64] }** %_func_uid4739
  store i64 %i, i64* %_func_uid4741
  store i64 %len, i64* %_func_uid4743
  %_load_val4745 = load i64, i64* %_func_uid4741
  %_binop4746 = mul i64 %_load_val4745, 2
  store i64 %_binop4746, i64* %_l4747
  %_load_val4748 = load i64, i64* %_func_uid4741
  %_binop4749 = add i64 %_load_val4748, 1
  store i64 %_binop4749, i64* %_r4750
  store i64 0, i64* %_tmp4751
  %_load_val4752 = load i64, i64* %_func_uid4741
  store i64 %_load_val4752, i64* %_m4753
  %_load_val4754 = load i64, i64* %_l4747
  %_load_val4755 = load i64, i64* %_func_uid4743
  %_binop4756 = icmp slt i64 %_load_val4754, %_load_val4755
  br i1 %_binop4756, label %_lthen4771, label %_lelse4772
_lthen4771:
  %_load_ref4757 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4739
  %_load_val4758 = load i64, i64* %_l4747
  %_index_ptr4759 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4757, i32 0, i32 1, i64 %_load_val4758
  %_index_load4760 = load i64, i64* %_index_ptr4759
  %_load_ref4761 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4739
  %_load_val4762 = load i64, i64* %_m4753
  %_index_ptr4763 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4761, i32 0, i32 1, i64 %_load_val4762
  %_index_load4764 = load i64, i64* %_index_ptr4763
  %_binop4765 = icmp sgt i64 %_index_load4760, %_index_load4764
  br i1 %_binop4765, label %_lthen4768, label %_lelse4769
_lthen4768:
  %_load_val4766 = load i64, i64* %_l4747
  store i64 %_load_val4766, i64* %_m4753
  br label %_lafter4770
_lelse4769:
  br label %_lafter4770
_lafter4770:
  br label %_lafter4773
_lelse4772:
  br label %_lafter4773
_lafter4773:
  %_load_val4774 = load i64, i64* %_r4750
  %_load_val4775 = load i64, i64* %_func_uid4743
  %_binop4776 = icmp slt i64 %_load_val4774, %_load_val4775
  br i1 %_binop4776, label %_lthen4791, label %_lelse4792
_lthen4791:
  %_load_ref4777 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4739
  %_load_val4778 = load i64, i64* %_r4750
  %_index_ptr4779 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4777, i32 0, i32 1, i64 %_load_val4778
  %_index_load4780 = load i64, i64* %_index_ptr4779
  %_load_ref4781 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4739
  %_load_val4782 = load i64, i64* %_m4753
  %_index_ptr4783 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4781, i32 0, i32 1, i64 %_load_val4782
  %_index_load4784 = load i64, i64* %_index_ptr4783
  %_binop4785 = icmp sgt i64 %_index_load4780, %_index_load4784
  br i1 %_binop4785, label %_lthen4788, label %_lelse4789
_lthen4788:
  %_load_val4786 = load i64, i64* %_r4750
  store i64 %_load_val4786, i64* %_m4753
  br label %_lafter4790
_lelse4789:
  br label %_lafter4790
_lafter4790:
  br label %_lafter4793
_lelse4792:
  br label %_lafter4793
_lafter4793:
  %_load_val4794 = load i64, i64* %_m4753
  %_load_val4795 = load i64, i64* %_func_uid4741
  %_binop4796 = icmp ne i64 %_load_val4794, %_load_val4795
  br i1 %_binop4796, label %_lthen4819, label %_lelse4820
_lthen4819:
  %_load_ref4797 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4739
  %_load_val4798 = load i64, i64* %_func_uid4741
  %_index_ptr4799 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4797, i32 0, i32 1, i64 %_load_val4798
  %_index_load4800 = load i64, i64* %_index_ptr4799
  store i64 %_index_load4800, i64* %_tmp4751
  %_load_ref4802 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4739
  %_load_val4803 = load i64, i64* %_func_uid4741
  %_load_ref4804 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4739
  %_load_val4805 = load i64, i64* %_m4753
  %_index_ptr4806 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4804, i32 0, i32 1, i64 %_load_val4805
  %_index_load4807 = load i64, i64* %_index_ptr4806
  %_assign_ptr4808 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4802, i32 0, i32 1, i64 %_load_val4803
  store i64 %_index_load4807, i64* %_assign_ptr4808
  %_load_ref4810 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4739
  %_load_val4811 = load i64, i64* %_m4753
  %_load_val4812 = load i64, i64* %_tmp4751
  %_assign_ptr4813 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4810, i32 0, i32 1, i64 %_load_val4811
  store i64 %_load_val4812, i64* %_assign_ptr4813
  %_load_ref4815 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4739
  %_load_val4816 = load i64, i64* %_m4753
  %_load_val4817 = load i64, i64* %_func_uid4743
  call void @min_heapify({ i64, [0 x i64] }* %_load_ref4815, i64 %_load_val4816, i64 %_load_val4817)
  br label %_lafter4821
_lelse4820:
  br label %_lafter4821
_lafter4821:
  ret void
}

define void @make_min_heap({ i64, [0 x i64] }* %array, i64 %len) {
  %_func_uid4721 = alloca { i64, [0 x i64] }*
  %_func_uid4723 = alloca i64
  %_i4726 = alloca i64
  store { i64, [0 x i64] }* %array, { i64, [0 x i64] }** %_func_uid4721
  store i64 %len, i64* %_func_uid4723
  %_load_val4725 = load i64, i64* %_func_uid4723
  store i64 %_load_val4725, i64* %_i4726
  br label %_lpre4736
_lpre4736:
  %_load_val4730 = load i64, i64* %_i4726
  %_binop4731 = icmp sge i64 %_load_val4730, 1
  br i1 %_binop4731, label %_lbody4737, label %_lpost4738
_lbody4737:
  %_load_ref4732 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4721
  %_load_val4733 = load i64, i64* %_i4726
  %_load_val4734 = load i64, i64* %_func_uid4723
  call void @min_heapify({ i64, [0 x i64] }* %_load_ref4732, i64 %_load_val4733, i64 %_load_val4734)
  %_load_val4727 = load i64, i64* %_i4726
  %_binop4728 = sub i64 %_load_val4727, 1
  store i64 %_binop4728, i64* %_i4726
  br label %_lpre4736
_lpost4738:
  ret void
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid4641 = alloca i64
  %_func_uid4643 = alloca { i64, [0 x i8*] }*
  %_array4669 = alloca { i64, [0 x i64] }*
  %_end_result4694 = alloca { i64, [0 x i64] }*
  %_same4697 = alloca i64
  %_i4698 = alloca i64
  store i64 %argc, i64* %_func_uid4641
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid4643
  %_raw_array4645 = call i64* @oat_alloc_array(i64 11)
  %_array4646 = bitcast i64* %_raw_array4645 to { i64, [0 x i64] }*
  %_arr_init_ptr4647 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4646, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr4647
  %_arr_init_ptr4649 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4646, i32 0, i32 1, i32 1
  store i64 9, i64* %_arr_init_ptr4649
  %_arr_init_ptr4651 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4646, i32 0, i32 1, i32 2
  store i64 1, i64* %_arr_init_ptr4651
  %_arr_init_ptr4653 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4646, i32 0, i32 1, i32 3
  store i64 2, i64* %_arr_init_ptr4653
  %_arr_init_ptr4655 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4646, i32 0, i32 1, i32 4
  store i64 8, i64* %_arr_init_ptr4655
  %_arr_init_ptr4657 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4646, i32 0, i32 1, i32 5
  store i64 10, i64* %_arr_init_ptr4657
  %_arr_init_ptr4659 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4646, i32 0, i32 1, i32 6
  store i64 7, i64* %_arr_init_ptr4659
  %_arr_init_ptr4661 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4646, i32 0, i32 1, i32 7
  store i64 3, i64* %_arr_init_ptr4661
  %_arr_init_ptr4663 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4646, i32 0, i32 1, i32 8
  store i64 6, i64* %_arr_init_ptr4663
  %_arr_init_ptr4665 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4646, i32 0, i32 1, i32 9
  store i64 4, i64* %_arr_init_ptr4665
  %_arr_init_ptr4667 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4646, i32 0, i32 1, i32 10
  store i64 5, i64* %_arr_init_ptr4667
  store { i64, [0 x i64] }* %_array4646, { i64, [0 x i64] }** %_array4669
  %_raw_array4670 = call i64* @oat_alloc_array(i64 11)
  %_array4671 = bitcast i64* %_raw_array4670 to { i64, [0 x i64] }*
  %_arr_init_ptr4672 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4671, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr4672
  %_arr_init_ptr4674 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4671, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr4674
  %_arr_init_ptr4676 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4671, i32 0, i32 1, i32 2
  store i64 4, i64* %_arr_init_ptr4676
  %_arr_init_ptr4678 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4671, i32 0, i32 1, i32 3
  store i64 2, i64* %_arr_init_ptr4678
  %_arr_init_ptr4680 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4671, i32 0, i32 1, i32 4
  store i64 8, i64* %_arr_init_ptr4680
  %_arr_init_ptr4682 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4671, i32 0, i32 1, i32 5
  store i64 5, i64* %_arr_init_ptr4682
  %_arr_init_ptr4684 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4671, i32 0, i32 1, i32 6
  store i64 7, i64* %_arr_init_ptr4684
  %_arr_init_ptr4686 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4671, i32 0, i32 1, i32 7
  store i64 3, i64* %_arr_init_ptr4686
  %_arr_init_ptr4688 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4671, i32 0, i32 1, i32 8
  store i64 6, i64* %_arr_init_ptr4688
  %_arr_init_ptr4690 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4671, i32 0, i32 1, i32 9
  store i64 9, i64* %_arr_init_ptr4690
  %_arr_init_ptr4692 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4671, i32 0, i32 1, i32 10
  store i64 10, i64* %_arr_init_ptr4692
  store { i64, [0 x i64] }* %_array4671, { i64, [0 x i64] }** %_end_result4694
  %_load_ref4695 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array4669
  call void @make_min_heap({ i64, [0 x i64] }* %_load_ref4695, i64 10)
  store i64 0, i64* %_same4697
  store i64 0, i64* %_i4698
  br label %_lpre4717
_lpre4717:
  %_load_val4702 = load i64, i64* %_i4698
  %_binop4703 = icmp slt i64 %_load_val4702, 11
  br i1 %_binop4703, label %_lbody4718, label %_lpost4719
_lbody4718:
  %_load_ref4704 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array4669
  %_load_val4705 = load i64, i64* %_i4698
  %_index_ptr4706 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4704, i32 0, i32 1, i64 %_load_val4705
  %_index_load4707 = load i64, i64* %_index_ptr4706
  %_load_ref4708 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_end_result4694
  %_load_val4709 = load i64, i64* %_i4698
  %_index_ptr4710 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4708, i32 0, i32 1, i64 %_load_val4709
  %_index_load4711 = load i64, i64* %_index_ptr4710
  %_binop4712 = icmp ne i64 %_index_load4707, %_index_load4711
  br i1 %_binop4712, label %_lthen4714, label %_lelse4715
_lthen4714:
  store i64 1, i64* %_same4697
  br label %_lafter4716
_lelse4715:
  br label %_lafter4716
_lafter4716:
  %_load_val4699 = load i64, i64* %_i4698
  %_binop4700 = add i64 %_load_val4699, 1
  store i64 %_binop4700, i64* %_i4698
  br label %_lpre4717
_lpost4719:
  %_load_val4720 = load i64, i64* %_same4697
  ret i64 %_load_val4720
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
