; generated from: oatprograms/matrixmult.oat
target triple = "x86_64-unknown-linux"
@_string_hoist3792 = global [2 x i8] c" \00"
@_string_hoist3798 = global [2 x i8] c"	\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid3940 = alloca i64
  %_func_uid3942 = alloca { i64, [0 x i8*] }*
  %_a3966 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_b4005 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_c4032 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %argc, i64* %_func_uid3940
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid3942
  %_raw_array3944 = call i64* @oat_alloc_array(i64 2)
  %_array3945 = bitcast i64* %_raw_array3944 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array3946 = call i64* @oat_alloc_array(i64 3)
  %_array3947 = bitcast i64* %_raw_array3946 to { i64, [0 x i64] }*
  %_arr_init_ptr3948 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3947, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr3948
  %_arr_init_ptr3950 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3947, i32 0, i32 1, i32 1
  store i64 3, i64* %_arr_init_ptr3950
  %_arr_init_ptr3952 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3947, i32 0, i32 1, i32 2
  store i64 4, i64* %_arr_init_ptr3952
  %_arr_init_ptr3954 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array3945, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array3947, { i64, [0 x i64] }** %_arr_init_ptr3954
  %_raw_array3956 = call i64* @oat_alloc_array(i64 3)
  %_array3957 = bitcast i64* %_raw_array3956 to { i64, [0 x i64] }*
  %_arr_init_ptr3958 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3957, i32 0, i32 1, i32 0
  store i64 2, i64* %_arr_init_ptr3958
  %_arr_init_ptr3960 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3957, i32 0, i32 1, i32 1
  store i64 0, i64* %_arr_init_ptr3960
  %_arr_init_ptr3962 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3957, i32 0, i32 1, i32 2
  store i64 1, i64* %_arr_init_ptr3962
  %_arr_init_ptr3964 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array3945, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array3957, { i64, [0 x i64] }** %_arr_init_ptr3964
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array3945, { i64, [0 x { i64, [0 x i64] }*] }** %_a3966
  %_raw_array3967 = call i64* @oat_alloc_array(i64 3)
  %_array3968 = bitcast i64* %_raw_array3967 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array3969 = call i64* @oat_alloc_array(i64 4)
  %_array3970 = bitcast i64* %_raw_array3969 to { i64, [0 x i64] }*
  %_arr_init_ptr3971 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3970, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr3971
  %_arr_init_ptr3973 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3970, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr3973
  %_arr_init_ptr3975 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3970, i32 0, i32 1, i32 2
  store i64 3, i64* %_arr_init_ptr3975
  %_arr_init_ptr3977 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3970, i32 0, i32 1, i32 3
  store i64 1, i64* %_arr_init_ptr3977
  %_arr_init_ptr3979 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array3968, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array3970, { i64, [0 x i64] }** %_arr_init_ptr3979
  %_raw_array3981 = call i64* @oat_alloc_array(i64 4)
  %_array3982 = bitcast i64* %_raw_array3981 to { i64, [0 x i64] }*
  %_arr_init_ptr3983 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3982, i32 0, i32 1, i32 0
  store i64 2, i64* %_arr_init_ptr3983
  %_arr_init_ptr3985 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3982, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr3985
  %_arr_init_ptr3987 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3982, i32 0, i32 1, i32 2
  store i64 2, i64* %_arr_init_ptr3987
  %_arr_init_ptr3989 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3982, i32 0, i32 1, i32 3
  store i64 2, i64* %_arr_init_ptr3989
  %_arr_init_ptr3991 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array3968, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array3982, { i64, [0 x i64] }** %_arr_init_ptr3991
  %_raw_array3993 = call i64* @oat_alloc_array(i64 4)
  %_array3994 = bitcast i64* %_raw_array3993 to { i64, [0 x i64] }*
  %_arr_init_ptr3995 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3994, i32 0, i32 1, i32 0
  store i64 3, i64* %_arr_init_ptr3995
  %_arr_init_ptr3997 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3994, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr3997
  %_arr_init_ptr3999 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3994, i32 0, i32 1, i32 2
  store i64 1, i64* %_arr_init_ptr3999
  %_arr_init_ptr4001 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3994, i32 0, i32 1, i32 3
  store i64 4, i64* %_arr_init_ptr4001
  %_arr_init_ptr4003 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array3968, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array3994, { i64, [0 x i64] }** %_arr_init_ptr4003
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array3968, { i64, [0 x { i64, [0 x i64] }*] }** %_b4005
  %_raw_array4006 = call i64* @oat_alloc_array(i64 2)
  %_array4007 = bitcast i64* %_raw_array4006 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array4008 = call i64* @oat_alloc_array(i64 4)
  %_array4009 = bitcast i64* %_raw_array4008 to { i64, [0 x i64] }*
  %_arr_init_ptr4010 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4009, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr4010
  %_arr_init_ptr4012 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4009, i32 0, i32 1, i32 1
  store i64 0, i64* %_arr_init_ptr4012
  %_arr_init_ptr4014 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4009, i32 0, i32 1, i32 2
  store i64 0, i64* %_arr_init_ptr4014
  %_arr_init_ptr4016 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4009, i32 0, i32 1, i32 3
  store i64 0, i64* %_arr_init_ptr4016
  %_arr_init_ptr4018 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4007, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array4009, { i64, [0 x i64] }** %_arr_init_ptr4018
  %_raw_array4020 = call i64* @oat_alloc_array(i64 4)
  %_array4021 = bitcast i64* %_raw_array4020 to { i64, [0 x i64] }*
  %_arr_init_ptr4022 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4021, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr4022
  %_arr_init_ptr4024 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4021, i32 0, i32 1, i32 1
  store i64 0, i64* %_arr_init_ptr4024
  %_arr_init_ptr4026 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4021, i32 0, i32 1, i32 2
  store i64 0, i64* %_arr_init_ptr4026
  %_arr_init_ptr4028 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4021, i32 0, i32 1, i32 3
  store i64 0, i64* %_arr_init_ptr4028
  %_arr_init_ptr4030 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4007, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array4021, { i64, [0 x i64] }** %_arr_init_ptr4030
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4007, { i64, [0 x { i64, [0 x i64] }*] }** %_c4032
  %_load_ref4033 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a3966
  %_load_ref4034 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b4005
  %_load_ref4035 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_c4032
  call void @matrix_Mult({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref4033, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref4034, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref4035)
  %_load_ref4037 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_c4032
  call void @prnNx4({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref4037, i64 2)
  %_load_ref4039 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a3966
  %_load_ref4040 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b4005
  %_load_ref4041 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_c4032
  call void @matrix_MultAlt({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref4039, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref4040, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref4041)
  %_load_ref4043 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_c4032
  call void @prnNx4({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref4043, i64 2)
  ret i64 0
}

define void @matrix_Mult({ i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }* %a2, { i64, [0 x { i64, [0 x i64] }*] }* %a3) {
  %_func_uid3877 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_func_uid3879 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_func_uid3881 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i3883 = alloca i64
  %_j3889 = alloca i64
  %_k3895 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3877
  store { i64, [0 x { i64, [0 x i64] }*] }* %a2, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3879
  store { i64, [0 x { i64, [0 x i64] }*] }* %a3, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3881
  store i64 0, i64* %_i3883
  br label %_lpre3937
_lpre3937:
  %_load_val3887 = load i64, i64* %_i3883
  %_binop3888 = icmp slt i64 %_load_val3887, 2
  br i1 %_binop3888, label %_lbody3938, label %_lpost3939
_lbody3938:
  store i64 0, i64* %_j3889
  br label %_lpre3934
_lpre3934:
  %_load_val3893 = load i64, i64* %_j3889
  %_binop3894 = icmp slt i64 %_load_val3893, 4
  br i1 %_binop3894, label %_lbody3935, label %_lpost3936
_lbody3935:
  store i64 0, i64* %_k3895
  br label %_lpre3931
_lpre3931:
  %_load_val3899 = load i64, i64* %_k3895
  %_binop3900 = icmp slt i64 %_load_val3899, 3
  br i1 %_binop3900, label %_lbody3932, label %_lpost3933
_lbody3932:
  %_load_ref3901 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3881
  %_load_val3902 = load i64, i64* %_i3883
  %_index_ptr3903 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref3901, i32 0, i32 1, i64 %_load_val3902
  %_index_load3904 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3903
  %_load_val3905 = load i64, i64* %_j3889
  %_load_ref3906 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3881
  %_load_val3907 = load i64, i64* %_i3883
  %_index_ptr3908 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref3906, i32 0, i32 1, i64 %_load_val3907
  %_index_load3909 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3908
  %_load_val3910 = load i64, i64* %_j3889
  %_index_ptr3911 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load3909, i32 0, i32 1, i64 %_load_val3910
  %_index_load3912 = load i64, i64* %_index_ptr3911
  %_load_ref3913 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3877
  %_load_val3914 = load i64, i64* %_i3883
  %_index_ptr3915 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref3913, i32 0, i32 1, i64 %_load_val3914
  %_index_load3916 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3915
  %_load_val3917 = load i64, i64* %_k3895
  %_index_ptr3918 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load3916, i32 0, i32 1, i64 %_load_val3917
  %_index_load3919 = load i64, i64* %_index_ptr3918
  %_load_ref3920 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3879
  %_load_val3921 = load i64, i64* %_k3895
  %_index_ptr3922 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref3920, i32 0, i32 1, i64 %_load_val3921
  %_index_load3923 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3922
  %_load_val3924 = load i64, i64* %_j3889
  %_index_ptr3925 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load3923, i32 0, i32 1, i64 %_load_val3924
  %_index_load3926 = load i64, i64* %_index_ptr3925
  %_binop3927 = mul i64 %_index_load3919, %_index_load3926
  %_binop3928 = add i64 %_index_load3912, %_binop3927
  %_assign_ptr3929 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load3904, i32 0, i32 1, i64 %_load_val3905
  store i64 %_binop3928, i64* %_assign_ptr3929
  %_load_val3896 = load i64, i64* %_k3895
  %_binop3897 = add i64 %_load_val3896, 1
  store i64 %_binop3897, i64* %_k3895
  br label %_lpre3931
_lpost3933:
  %_load_val3890 = load i64, i64* %_j3889
  %_binop3891 = add i64 %_load_val3890, 1
  store i64 %_binop3891, i64* %_j3889
  br label %_lpre3934
_lpost3936:
  %_load_val3884 = load i64, i64* %_i3883
  %_binop3885 = add i64 %_load_val3884, 1
  store i64 %_binop3885, i64* %_i3883
  br label %_lpre3937
_lpost3939:
  ret void
}

define void @matrix_MultAlt({ i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }* %a2, { i64, [0 x { i64, [0 x i64] }*] }* %a3) {
  %_func_uid3841 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_func_uid3843 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_func_uid3845 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i3847 = alloca i64
  %_j3853 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3841
  store { i64, [0 x { i64, [0 x i64] }*] }* %a2, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3843
  store { i64, [0 x { i64, [0 x i64] }*] }* %a3, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3845
  store i64 0, i64* %_i3847
  br label %_lpre3874
_lpre3874:
  %_load_val3851 = load i64, i64* %_i3847
  %_binop3852 = icmp slt i64 %_load_val3851, 2
  br i1 %_binop3852, label %_lbody3875, label %_lpost3876
_lbody3875:
  store i64 0, i64* %_j3853
  br label %_lpre3871
_lpre3871:
  %_load_val3857 = load i64, i64* %_j3853
  %_binop3858 = icmp slt i64 %_load_val3857, 4
  br i1 %_binop3858, label %_lbody3872, label %_lpost3873
_lbody3872:
  %_load_ref3859 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3845
  %_load_val3860 = load i64, i64* %_i3847
  %_index_ptr3861 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref3859, i32 0, i32 1, i64 %_load_val3860
  %_index_load3862 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3861
  %_load_val3863 = load i64, i64* %_j3853
  %_load_ref3864 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3841
  %_load_ref3865 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3843
  %_load_val3866 = load i64, i64* %_i3847
  %_load_val3867 = load i64, i64* %_j3853
  %_call3868 = call i64 @dot3({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref3864, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref3865, i64 %_load_val3866, i64 %_load_val3867)
  %_assign_ptr3869 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load3862, i32 0, i32 1, i64 %_load_val3863
  store i64 %_call3868, i64* %_assign_ptr3869
  %_load_val3854 = load i64, i64* %_j3853
  %_binop3855 = add i64 %_load_val3854, 1
  store i64 %_binop3855, i64* %_j3853
  br label %_lpre3871
_lpost3873:
  %_load_val3848 = load i64, i64* %_i3847
  %_binop3849 = add i64 %_load_val3848, 1
  store i64 %_binop3849, i64* %_i3847
  br label %_lpre3874
_lpost3876:
  ret void
}

define i64 @dot3({ i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }* %a2, i64 %row, i64 %col) {
  %_func_uid3804 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_func_uid3806 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_func_uid3808 = alloca i64
  %_func_uid3810 = alloca i64
  %_sum3812 = alloca i64
  %_k3813 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3804
  store { i64, [0 x { i64, [0 x i64] }*] }* %a2, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3806
  store i64 %row, i64* %_func_uid3808
  store i64 %col, i64* %_func_uid3810
  store i64 0, i64* %_sum3812
  store i64 0, i64* %_k3813
  br label %_lpre3837
_lpre3837:
  %_load_val3817 = load i64, i64* %_k3813
  %_binop3818 = icmp slt i64 %_load_val3817, 3
  br i1 %_binop3818, label %_lbody3838, label %_lpost3839
_lbody3838:
  %_load_val3819 = load i64, i64* %_sum3812
  %_load_ref3820 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3804
  %_load_val3821 = load i64, i64* %_func_uid3808
  %_index_ptr3822 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref3820, i32 0, i32 1, i64 %_load_val3821
  %_index_load3823 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3822
  %_load_val3824 = load i64, i64* %_k3813
  %_index_ptr3825 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load3823, i32 0, i32 1, i64 %_load_val3824
  %_index_load3826 = load i64, i64* %_index_ptr3825
  %_load_ref3827 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3806
  %_load_val3828 = load i64, i64* %_k3813
  %_index_ptr3829 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref3827, i32 0, i32 1, i64 %_load_val3828
  %_index_load3830 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3829
  %_load_val3831 = load i64, i64* %_func_uid3810
  %_index_ptr3832 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load3830, i32 0, i32 1, i64 %_load_val3831
  %_index_load3833 = load i64, i64* %_index_ptr3832
  %_binop3834 = mul i64 %_index_load3826, %_index_load3833
  %_binop3835 = add i64 %_load_val3819, %_binop3834
  store i64 %_binop3835, i64* %_sum3812
  %_load_val3814 = load i64, i64* %_k3813
  %_binop3815 = add i64 %_load_val3814, 1
  store i64 %_binop3815, i64* %_k3813
  br label %_lpre3837
_lpost3839:
  %_load_val3840 = load i64, i64* %_sum3812
  ret i64 %_load_val3840
}

define void @prnNx4({ i64, [0 x { i64, [0 x i64] }*] }* %ar, i64 %n) {
  %_func_uid3767 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_func_uid3769 = alloca i64
  %_i3771 = alloca i64
  %_j3778 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %ar, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3767
  store i64 %n, i64* %_func_uid3769
  store i64 0, i64* %_i3771
  br label %_lpre3801
_lpre3801:
  %_load_val3775 = load i64, i64* %_i3771
  %_load_val3776 = load i64, i64* %_func_uid3769
  %_binop3777 = icmp slt i64 %_load_val3775, %_load_val3776
  br i1 %_binop3777, label %_lbody3802, label %_lpost3803
_lbody3802:
  store i64 0, i64* %_j3778
  br label %_lpre3795
_lpre3795:
  %_load_val3782 = load i64, i64* %_j3778
  %_binop3783 = icmp slt i64 %_load_val3782, 4
  br i1 %_binop3783, label %_lbody3796, label %_lpost3797
_lbody3796:
  %_load_ref3784 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid3767
  %_load_val3785 = load i64, i64* %_i3771
  %_index_ptr3786 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref3784, i32 0, i32 1, i64 %_load_val3785
  %_index_load3787 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr3786
  %_load_val3788 = load i64, i64* %_j3778
  %_index_ptr3789 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load3787, i32 0, i32 1, i64 %_load_val3788
  %_index_load3790 = load i64, i64* %_index_ptr3789
  call void @print_int(i64 %_index_load3790)
  %_str_ptr3793 = getelementptr [2 x i8], [2 x i8]* @_string_hoist3792, i32 0, i32 0
  call void @print_string(i8* %_str_ptr3793)
  %_load_val3779 = load i64, i64* %_j3778
  %_binop3780 = add i64 %_load_val3779, 1
  store i64 %_binop3780, i64* %_j3778
  br label %_lpre3795
_lpost3797:
  %_str_ptr3799 = getelementptr [2 x i8], [2 x i8]* @_string_hoist3798, i32 0, i32 0
  call void @print_string(i8* %_str_ptr3799)
  %_load_val3772 = load i64, i64* %_i3771
  %_binop3773 = add i64 %_load_val3772, 1
  store i64 %_binop3773, i64* %_i3771
  br label %_lpre3801
_lpost3803:
  ret void
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
