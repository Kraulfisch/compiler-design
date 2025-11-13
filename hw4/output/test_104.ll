; generated from: oatprograms/lfsr.oat
target triple = "x86_64-unknown-linux"
@lfsr_iterations = global i64 5
@lfsr_length = global i64 4
@lfsr_init_values = global { i64, [0 x i1] }* bitcast ({ i64, [4 x i1] }* @_garr_data5030 to { i64, [0 x i1] }*)
@_garr_data5030 = global { i64, [4 x i1] } { i64 4, [4 x i1] [ i1 1, i1 0, i1 1, i1 0 ] }
@_string_hoist5010 = global [2 x i8] c"T\00"
@_string_hoist5012 = global [2 x i8] c"F\00"
@_string_hoist4981 = global [2 x i8] c" \00"

define i1 @xor(i1 %x, i1 %y) {
  %_func_uid5017 = alloca i1
  %_func_uid5019 = alloca i1
  store i1 %x, i1* %_func_uid5017
  store i1 %y, i1* %_func_uid5019
  %_load_val5021 = load i1, i1* %_func_uid5017
  %_load_val5022 = load i1, i1* %_func_uid5019
  %_uop5023 = icmp eq i1 %_load_val5022, 0
  %_binop5024 = and i1 %_load_val5021, %_uop5023
  %_load_val5025 = load i1, i1* %_func_uid5017
  %_uop5026 = icmp eq i1 %_load_val5025, 0
  %_load_val5027 = load i1, i1* %_func_uid5019
  %_binop5028 = and i1 %_uop5026, %_load_val5027
  %_binop5029 = or i1 %_binop5024, %_binop5028
  ret i1 %_binop5029
}

define i8* @string_of_bool(i1 %b) {
  %_func_uid5007 = alloca i1
  store i1 %b, i1* %_func_uid5007
  %_load_val5009 = load i1, i1* %_func_uid5007
  br i1 %_load_val5009, label %_lthen5014, label %_lelse5015
_lthen5014:
  %_str_ptr5011 = getelementptr [2 x i8], [2 x i8]* @_string_hoist5010, i32 0, i32 0
  ret i8* %_str_ptr5011
_lelse5015:
  %_str_ptr5013 = getelementptr [2 x i8], [2 x i8]* @_string_hoist5012, i32 0, i32 0
  ret i8* %_str_ptr5013
}

define void @print_lfsr({ i64, [0 x i1] }* %lfsr_register, i64 %len) {
  %_func_uid4987 = alloca { i64, [0 x i1] }*
  %_func_uid4989 = alloca i64
  %_i4991 = alloca i64
  store { i64, [0 x i1] }* %lfsr_register, { i64, [0 x i1] }** %_func_uid4987
  store i64 %len, i64* %_func_uid4989
  store i64 0, i64* %_i4991
  br label %_lpre5004
_lpre5004:
  %_load_val4995 = load i64, i64* %_i4991
  %_load_val4996 = load i64, i64* %_func_uid4989
  %_binop4997 = icmp slt i64 %_load_val4995, %_load_val4996
  br i1 %_binop4997, label %_lbody5005, label %_lpost5006
_lbody5005:
  %_load_ref4998 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_func_uid4987
  %_load_val4999 = load i64, i64* %_i4991
  %_index_ptr5000 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4998, i32 0, i32 1, i64 %_load_val4999
  %_index_load5001 = load i1, i1* %_index_ptr5000
  %_call5002 = call i8* @string_of_bool(i1 %_index_load5001)
  call void @print_string(i8* %_call5002)
  %_load_val4992 = load i64, i64* %_i4991
  %_binop4993 = add i64 %_load_val4992, 1
  store i64 %_binop4993, i64* %_i4991
  br label %_lpre5004
_lpost5006:
  ret void
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid4906 = alloca i64
  %_func_uid4908 = alloca { i64, [0 x i8*] }*
  %_lfsr_register4913 = alloca { i64, [0 x i1] }*
  %_i4914 = alloca i64
  %_i4932 = alloca i64
  %_new_first4950 = alloca i1
  %_j4953 = alloca i64
  store i64 %argc, i64* %_func_uid4906
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid4908
  %_load_val4910 = load i64, i64* @lfsr_length
  %_raw_array4911 = call i64* @oat_alloc_array(i64 %_load_val4910)
  %_array4912 = bitcast i64* %_raw_array4911 to { i64, [0 x i1] }*
  store { i64, [0 x i1] }* %_array4912, { i64, [0 x i1] }** %_lfsr_register4913
  store i64 0, i64* %_i4914
  br label %_lpre4929
_lpre4929:
  %_load_val4918 = load i64, i64* %_i4914
  %_load_val4919 = load i64, i64* @lfsr_length
  %_binop4920 = icmp slt i64 %_load_val4918, %_load_val4919
  br i1 %_binop4920, label %_lbody4930, label %_lpost4931
_lbody4930:
  %_load_ref4921 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4913
  %_load_val4922 = load i64, i64* %_i4914
  %_load_ref4923 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** @lfsr_init_values
  %_load_val4924 = load i64, i64* %_i4914
  %_index_ptr4925 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4923, i32 0, i32 1, i64 %_load_val4924
  %_index_load4926 = load i1, i1* %_index_ptr4925
  %_assign_ptr4927 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4921, i32 0, i32 1, i64 %_load_val4922
  store i1 %_index_load4926, i1* %_assign_ptr4927
  %_load_val4915 = load i64, i64* %_i4914
  %_binop4916 = add i64 %_load_val4915, 1
  store i64 %_binop4916, i64* %_i4914
  br label %_lpre4929
_lpost4931:
  store i64 0, i64* %_i4932
  br label %_lpre4975
_lpre4975:
  %_load_val4936 = load i64, i64* %_i4932
  %_load_val4937 = load i64, i64* @lfsr_iterations
  %_binop4938 = icmp slt i64 %_load_val4936, %_load_val4937
  br i1 %_binop4938, label %_lbody4976, label %_lpost4977
_lbody4976:
  %_load_ref4939 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4913
  %_load_val4940 = load i64, i64* @lfsr_length
  %_binop4941 = sub i64 %_load_val4940, 1
  %_index_ptr4942 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4939, i32 0, i32 1, i64 %_binop4941
  %_index_load4943 = load i1, i1* %_index_ptr4942
  %_load_ref4944 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4913
  %_load_val4945 = load i64, i64* @lfsr_length
  %_binop4946 = sub i64 %_load_val4945, 2
  %_index_ptr4947 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4944, i32 0, i32 1, i64 %_binop4946
  %_index_load4948 = load i1, i1* %_index_ptr4947
  %_call4949 = call i1 @xor(i1 %_index_load4943, i1 %_index_load4948)
  store i1 %_call4949, i1* %_new_first4950
  %_load_val4951 = load i64, i64* @lfsr_length
  %_binop4952 = sub i64 %_load_val4951, 1
  store i64 %_binop4952, i64* %_j4953
  br label %_lpre4968
_lpre4968:
  %_load_val4957 = load i64, i64* %_j4953
  %_binop4958 = icmp sgt i64 %_load_val4957, 0
  br i1 %_binop4958, label %_lbody4969, label %_lpost4970
_lbody4969:
  %_load_ref4959 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4913
  %_load_val4960 = load i64, i64* %_j4953
  %_load_ref4961 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4913
  %_load_val4962 = load i64, i64* %_j4953
  %_binop4963 = sub i64 %_load_val4962, 1
  %_index_ptr4964 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4961, i32 0, i32 1, i64 %_binop4963
  %_index_load4965 = load i1, i1* %_index_ptr4964
  %_assign_ptr4966 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4959, i32 0, i32 1, i64 %_load_val4960
  store i1 %_index_load4965, i1* %_assign_ptr4966
  %_load_val4954 = load i64, i64* %_j4953
  %_binop4955 = sub i64 %_load_val4954, 1
  store i64 %_binop4955, i64* %_j4953
  br label %_lpre4968
_lpost4970:
  %_load_ref4971 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4913
  %_load_val4972 = load i1, i1* %_new_first4950
  %_assign_ptr4973 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4971, i32 0, i32 1, i32 0
  store i1 %_load_val4972, i1* %_assign_ptr4973
  %_load_val4933 = load i64, i64* %_i4932
  %_binop4934 = add i64 %_load_val4933, 1
  store i64 %_binop4934, i64* %_i4932
  br label %_lpre4975
_lpost4977:
  %_load_ref4978 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** @lfsr_init_values
  %_load_val4979 = load i64, i64* @lfsr_length
  call void @print_lfsr({ i64, [0 x i1] }* %_load_ref4978, i64 %_load_val4979)
  %_str_ptr4982 = getelementptr [2 x i8], [2 x i8]* @_string_hoist4981, i32 0, i32 0
  call void @print_string(i8* %_str_ptr4982)
  %_load_ref4984 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register4913
  %_load_val4985 = load i64, i64* @lfsr_length
  call void @print_lfsr({ i64, [0 x i1] }* %_load_ref4984, i64 %_load_val4985)
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
