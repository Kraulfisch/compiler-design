; generated from: oatprograms/maxsubsequence.oat
target triple = "x86_64-unknown-linux"
define i64 @maxsum({ i64, [0 x i64] }* %arr, i64 %size) {
  %_func_uid5810 = alloca { i64, [0 x i64] }*
  %_func_uid5812 = alloca i64
  %_maxarr5817 = alloca { i64, [0 x i64] }*
  %_maxs5818 = alloca i64
  %_i5825 = alloca i64
  %_j5832 = alloca i64
  store { i64, [0 x i64] }* %arr, { i64, [0 x i64] }** %_func_uid5810
  store i64 %size, i64* %_func_uid5812
  %_load_val5814 = load i64, i64* %_func_uid5812
  %_raw_array5815 = call i64* @oat_alloc_array(i64 %_load_val5814)
  %_array5816 = bitcast i64* %_raw_array5815 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array5816, { i64, [0 x i64] }** %_maxarr5817
  store i64 0, i64* %_maxs5818
  %_load_ref5819 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5817
  %_load_ref5820 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5810
  %_index_ptr5821 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5820, i32 0, i32 1, i32 0
  %_index_load5822 = load i64, i64* %_index_ptr5821
  %_assign_ptr5823 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5819, i32 0, i32 1, i32 0
  store i64 %_index_load5822, i64* %_assign_ptr5823
  store i64 0, i64* %_i5825
  br label %_lpre5896
_lpre5896:
  %_load_val5829 = load i64, i64* %_i5825
  %_load_val5830 = load i64, i64* %_func_uid5812
  %_binop5831 = icmp slt i64 %_load_val5829, %_load_val5830
  br i1 %_binop5831, label %_lbody5897, label %_lpost5898
_lbody5897:
  store i64 0, i64* %_j5832
  br label %_lpre5879
_lpre5879:
  %_load_val5836 = load i64, i64* %_j5832
  %_load_val5837 = load i64, i64* %_i5825
  %_binop5838 = icmp slt i64 %_load_val5836, %_load_val5837
  br i1 %_binop5838, label %_lbody5880, label %_lpost5881
_lbody5880:
  %_load_ref5839 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5810
  %_load_val5840 = load i64, i64* %_i5825
  %_index_ptr5841 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5839, i32 0, i32 1, i64 %_load_val5840
  %_index_load5842 = load i64, i64* %_index_ptr5841
  %_load_ref5843 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5810
  %_load_val5844 = load i64, i64* %_j5832
  %_index_ptr5845 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5843, i32 0, i32 1, i64 %_load_val5844
  %_index_load5846 = load i64, i64* %_index_ptr5845
  %_binop5847 = icmp sgt i64 %_index_load5842, %_index_load5846
  %_load_ref5848 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5817
  %_load_val5849 = load i64, i64* %_i5825
  %_index_ptr5850 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5848, i32 0, i32 1, i64 %_load_val5849
  %_index_load5851 = load i64, i64* %_index_ptr5850
  %_load_ref5852 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5817
  %_load_val5853 = load i64, i64* %_j5832
  %_index_ptr5854 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5852, i32 0, i32 1, i64 %_load_val5853
  %_index_load5855 = load i64, i64* %_index_ptr5854
  %_load_ref5856 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5810
  %_load_val5857 = load i64, i64* %_i5825
  %_index_ptr5858 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5856, i32 0, i32 1, i64 %_load_val5857
  %_index_load5859 = load i64, i64* %_index_ptr5858
  %_binop5860 = add i64 %_index_load5855, %_index_load5859
  %_binop5861 = icmp slt i64 %_index_load5851, %_binop5860
  %_binop5862 = and i1 %_binop5847, %_binop5861
  br i1 %_binop5862, label %_lthen5876, label %_lelse5877
_lthen5876:
  %_load_ref5863 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5817
  %_load_val5864 = load i64, i64* %_i5825
  %_load_ref5865 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5817
  %_load_val5866 = load i64, i64* %_j5832
  %_index_ptr5867 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5865, i32 0, i32 1, i64 %_load_val5866
  %_index_load5868 = load i64, i64* %_index_ptr5867
  %_load_ref5869 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5810
  %_load_val5870 = load i64, i64* %_i5825
  %_index_ptr5871 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5869, i32 0, i32 1, i64 %_load_val5870
  %_index_load5872 = load i64, i64* %_index_ptr5871
  %_binop5873 = add i64 %_index_load5868, %_index_load5872
  %_assign_ptr5874 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5863, i32 0, i32 1, i64 %_load_val5864
  store i64 %_binop5873, i64* %_assign_ptr5874
  br label %_lafter5878
_lelse5877:
  br label %_lafter5878
_lafter5878:
  %_load_val5833 = load i64, i64* %_j5832
  %_binop5834 = add i64 %_load_val5833, 1
  store i64 %_binop5834, i64* %_j5832
  br label %_lpre5879
_lpost5881:
  %_load_val5882 = load i64, i64* %_maxs5818
  %_load_ref5883 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5817
  %_load_val5884 = load i64, i64* %_i5825
  %_index_ptr5885 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5883, i32 0, i32 1, i64 %_load_val5884
  %_index_load5886 = load i64, i64* %_index_ptr5885
  %_binop5887 = icmp slt i64 %_load_val5882, %_index_load5886
  br i1 %_binop5887, label %_lthen5893, label %_lelse5894
_lthen5893:
  %_load_ref5888 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr5817
  %_load_val5889 = load i64, i64* %_i5825
  %_index_ptr5890 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5888, i32 0, i32 1, i64 %_load_val5889
  %_index_load5891 = load i64, i64* %_index_ptr5890
  store i64 %_index_load5891, i64* %_maxs5818
  br label %_lafter5895
_lelse5894:
  br label %_lafter5895
_lafter5895:
  %_load_val5826 = load i64, i64* %_i5825
  %_binop5827 = add i64 %_load_val5826, 1
  store i64 %_binop5827, i64* %_i5825
  br label %_lpre5896
_lpost5898:
  %_load_val5899 = load i64, i64* %_maxs5818
  ret i64 %_load_val5899
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid5785 = alloca i64
  %_func_uid5787 = alloca { i64, [0 x i8*] }*
  %_array5805 = alloca { i64, [0 x i64] }*
  %_max_ans5808 = alloca i64
  store i64 %argc, i64* %_func_uid5785
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid5787
  %_raw_array5789 = call i64* @oat_alloc_array(i64 7)
  %_array5790 = bitcast i64* %_raw_array5789 to { i64, [0 x i64] }*
  %_arr_init_ptr5791 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5790, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr5791
  %_arr_init_ptr5793 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5790, i32 0, i32 1, i32 1
  store i64 101, i64* %_arr_init_ptr5793
  %_arr_init_ptr5795 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5790, i32 0, i32 1, i32 2
  store i64 2, i64* %_arr_init_ptr5795
  %_arr_init_ptr5797 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5790, i32 0, i32 1, i32 3
  store i64 3, i64* %_arr_init_ptr5797
  %_arr_init_ptr5799 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5790, i32 0, i32 1, i32 4
  store i64 101, i64* %_arr_init_ptr5799
  %_arr_init_ptr5801 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5790, i32 0, i32 1, i32 5
  store i64 4, i64* %_arr_init_ptr5801
  %_arr_init_ptr5803 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5790, i32 0, i32 1, i32 6
  store i64 5, i64* %_arr_init_ptr5803
  store { i64, [0 x i64] }* %_array5790, { i64, [0 x i64] }** %_array5805
  %_load_ref5806 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5805
  %_call5807 = call i64 @maxsum({ i64, [0 x i64] }* %_load_ref5806, i64 7)
  store i64 %_call5807, i64* %_max_ans5808
  %_load_val5809 = load i64, i64* %_max_ans5808
  ret i64 %_load_val5809
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
