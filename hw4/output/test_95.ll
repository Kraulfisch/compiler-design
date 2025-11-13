; generated from: oatprograms/selectionsort.oat
target triple = "x86_64-unknown-linux"
define i64 @getminindex({ i64, [0 x i64] }* %a, i64 %s, i64 %b) {
  %_func_uid3726 = alloca { i64, [0 x i64] }*
  %_func_uid3728 = alloca i64
  %_func_uid3730 = alloca i64
  %_i3733 = alloca i64
  %_min3738 = alloca i64
  %_mi3740 = alloca i64
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_func_uid3726
  store i64 %s, i64* %_func_uid3728
  store i64 %b, i64* %_func_uid3730
  %_load_val3732 = load i64, i64* %_func_uid3728
  store i64 %_load_val3732, i64* %_i3733
  %_load_ref3734 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3726
  %_load_val3735 = load i64, i64* %_func_uid3728
  %_index_ptr3736 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3734, i32 0, i32 1, i64 %_load_val3735
  %_index_load3737 = load i64, i64* %_index_ptr3736
  store i64 %_index_load3737, i64* %_min3738
  %_load_val3739 = load i64, i64* %_func_uid3728
  store i64 %_load_val3739, i64* %_mi3740
  br label %_lpre3763
_lpre3763:
  %_load_val3744 = load i64, i64* %_i3733
  %_load_val3745 = load i64, i64* %_func_uid3730
  %_binop3746 = icmp slt i64 %_load_val3744, %_load_val3745
  br i1 %_binop3746, label %_lbody3764, label %_lpost3765
_lbody3764:
  %_load_ref3747 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3726
  %_load_val3748 = load i64, i64* %_i3733
  %_index_ptr3749 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3747, i32 0, i32 1, i64 %_load_val3748
  %_index_load3750 = load i64, i64* %_index_ptr3749
  %_load_val3751 = load i64, i64* %_min3738
  %_binop3752 = icmp slt i64 %_index_load3750, %_load_val3751
  br i1 %_binop3752, label %_lthen3760, label %_lelse3761
_lthen3760:
  %_load_ref3753 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3726
  %_load_val3754 = load i64, i64* %_i3733
  %_index_ptr3755 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3753, i32 0, i32 1, i64 %_load_val3754
  %_index_load3756 = load i64, i64* %_index_ptr3755
  store i64 %_index_load3756, i64* %_min3738
  %_load_val3758 = load i64, i64* %_i3733
  store i64 %_load_val3758, i64* %_mi3740
  br label %_lafter3762
_lelse3761:
  br label %_lafter3762
_lafter3762:
  %_load_val3741 = load i64, i64* %_i3733
  %_binop3742 = add i64 %_load_val3741, 1
  store i64 %_binop3742, i64* %_i3733
  br label %_lpre3763
_lpost3765:
  %_load_val3766 = load i64, i64* %_mi3740
  ret i64 %_load_val3766
}

define void @selectionsort({ i64, [0 x i64] }* %a, i64 %s) {
  %_func_uid3687 = alloca { i64, [0 x i64] }*
  %_func_uid3689 = alloca i64
  %_t3691 = alloca i64
  %_mi3692 = alloca i64
  %_i3693 = alloca i64
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_func_uid3687
  store i64 %s, i64* %_func_uid3689
  store i64 0, i64* %_t3691
  store i64 0, i64* %_mi3692
  store i64 0, i64* %_i3693
  br label %_lpre3723
_lpre3723:
  %_load_val3697 = load i64, i64* %_i3693
  %_load_val3698 = load i64, i64* %_func_uid3689
  %_binop3699 = icmp slt i64 %_load_val3697, %_load_val3698
  br i1 %_binop3699, label %_lbody3724, label %_lpost3725
_lbody3724:
  %_load_ref3700 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3687
  %_load_val3701 = load i64, i64* %_i3693
  %_load_val3702 = load i64, i64* %_func_uid3689
  %_call3703 = call i64 @getminindex({ i64, [0 x i64] }* %_load_ref3700, i64 %_load_val3701, i64 %_load_val3702)
  store i64 %_call3703, i64* %_mi3692
  %_load_ref3705 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3687
  %_load_val3706 = load i64, i64* %_i3693
  %_index_ptr3707 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3705, i32 0, i32 1, i64 %_load_val3706
  %_index_load3708 = load i64, i64* %_index_ptr3707
  store i64 %_index_load3708, i64* %_t3691
  %_load_ref3710 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3687
  %_load_val3711 = load i64, i64* %_i3693
  %_load_ref3712 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3687
  %_load_val3713 = load i64, i64* %_mi3692
  %_index_ptr3714 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3712, i32 0, i32 1, i64 %_load_val3713
  %_index_load3715 = load i64, i64* %_index_ptr3714
  %_assign_ptr3716 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3710, i32 0, i32 1, i64 %_load_val3711
  store i64 %_index_load3715, i64* %_assign_ptr3716
  %_load_ref3718 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3687
  %_load_val3719 = load i64, i64* %_mi3692
  %_load_val3720 = load i64, i64* %_t3691
  %_assign_ptr3721 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3718, i32 0, i32 1, i64 %_load_val3719
  store i64 %_load_val3720, i64* %_assign_ptr3721
  %_load_val3694 = load i64, i64* %_i3693
  %_binop3695 = add i64 %_load_val3694, 1
  store i64 %_binop3695, i64* %_i3693
  br label %_lpre3723
_lpost3725:
  ret void
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid3648 = alloca i64
  %_func_uid3650 = alloca { i64, [0 x i8*] }*
  %_ar3670 = alloca { i64, [0 x i64] }*
  %_i3673 = alloca i64
  store i64 %argc, i64* %_func_uid3648
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid3650
  %_raw_array3652 = call i64* @oat_alloc_array(i64 8)
  %_array3653 = bitcast i64* %_raw_array3652 to { i64, [0 x i64] }*
  %_arr_init_ptr3654 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3653, i32 0, i32 1, i32 0
  store i64 5, i64* %_arr_init_ptr3654
  %_arr_init_ptr3656 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3653, i32 0, i32 1, i32 1
  store i64 200, i64* %_arr_init_ptr3656
  %_arr_init_ptr3658 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3653, i32 0, i32 1, i32 2
  store i64 1, i64* %_arr_init_ptr3658
  %_arr_init_ptr3660 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3653, i32 0, i32 1, i32 3
  store i64 65, i64* %_arr_init_ptr3660
  %_arr_init_ptr3662 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3653, i32 0, i32 1, i32 4
  store i64 30, i64* %_arr_init_ptr3662
  %_arr_init_ptr3664 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3653, i32 0, i32 1, i32 5
  store i64 99, i64* %_arr_init_ptr3664
  %_arr_init_ptr3666 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3653, i32 0, i32 1, i32 6
  store i64 2, i64* %_arr_init_ptr3666
  %_arr_init_ptr3668 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3653, i32 0, i32 1, i32 7
  store i64 0, i64* %_arr_init_ptr3668
  store { i64, [0 x i64] }* %_array3653, { i64, [0 x i64] }** %_ar3670
  %_load_ref3671 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ar3670
  call void @selectionsort({ i64, [0 x i64] }* %_load_ref3671, i64 8)
  store i64 0, i64* %_i3673
  br label %_lpre3684
_lpre3684:
  %_load_val3677 = load i64, i64* %_i3673
  %_binop3678 = icmp slt i64 %_load_val3677, 8
  br i1 %_binop3678, label %_lbody3685, label %_lpost3686
_lbody3685:
  %_load_ref3679 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ar3670
  %_load_val3680 = load i64, i64* %_i3673
  %_index_ptr3681 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3679, i32 0, i32 1, i64 %_load_val3680
  %_index_load3682 = load i64, i64* %_index_ptr3681
  call void @print_int(i64 %_index_load3682)
  %_load_val3674 = load i64, i64* %_i3673
  %_binop3675 = add i64 %_load_val3674, 1
  store i64 %_binop3675, i64* %_i3673
  br label %_lpre3684
_lpost3686:
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
