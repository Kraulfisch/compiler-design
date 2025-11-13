; generated from: oatprograms/run1.oat
target triple = "x86_64-unknown-linux"
@i = global i64 42

define i64 @f(i64 %x) {
  %_func_uid1055 = alloca i64
  store i64 %x, i64* %_func_uid1055
  %_load_val1057 = load i64, i64* %_func_uid1055
  ret i64 %_load_val1057
}

define i64 @g({ i64, [0 x i64] }* %y) {
  %_func_uid1050 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %y, { i64, [0 x i64] }** %_func_uid1050
  %_load_ref1052 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid1050
  %_index_ptr1053 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1052, i32 0, i32 1, i32 2
  %_index_load1054 = load i64, i64* %_index_ptr1053
  ret i64 %_index_load1054
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid983 = alloca i64
  %_func_uid985 = alloca { i64, [0 x i8*] }*
  %_garr1005 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_arr1016 = alloca { i64, [0 x i64] }*
  %_p1017 = alloca i64
  %_j1018 = alloca i64
  store i64 %argc, i64* %_func_uid983
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid985
  %_raw_array987 = call i64* @oat_alloc_array(i64 2)
  %_array988 = bitcast i64* %_raw_array987 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array989 = call i64* @oat_alloc_array(i64 2)
  %_array990 = bitcast i64* %_raw_array989 to { i64, [0 x i64] }*
  %_arr_init_ptr991 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array990, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr991
  %_arr_init_ptr993 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array990, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr993
  %_arr_init_ptr995 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array988, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array990, { i64, [0 x i64] }** %_arr_init_ptr995
  %_raw_array997 = call i64* @oat_alloc_array(i64 2)
  %_array998 = bitcast i64* %_raw_array997 to { i64, [0 x i64] }*
  %_arr_init_ptr999 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array998, i32 0, i32 1, i32 0
  store i64 3, i64* %_arr_init_ptr999
  %_arr_init_ptr1001 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array998, i32 0, i32 1, i32 1
  store i64 4, i64* %_arr_init_ptr1001
  %_arr_init_ptr1003 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array988, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array998, { i64, [0 x i64] }** %_arr_init_ptr1003
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array988, { i64, [0 x { i64, [0 x i64] }*] }** %_garr1005
  %_raw_array1006 = call i64* @oat_alloc_array(i64 4)
  %_array1007 = bitcast i64* %_raw_array1006 to { i64, [0 x i64] }*
  %_arr_init_ptr1008 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1007, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr1008
  %_arr_init_ptr1010 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1007, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr1010
  %_arr_init_ptr1012 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1007, i32 0, i32 1, i32 2
  store i64 3, i64* %_arr_init_ptr1012
  %_arr_init_ptr1014 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1007, i32 0, i32 1, i32 3
  store i64 4, i64* %_arr_init_ptr1014
  store { i64, [0 x i64] }* %_array1007, { i64, [0 x i64] }** %_arr1016
  store i64 0, i64* %_p1017
  store i64 0, i64* %_j1018
  br label %_lpre1027
_lpre1027:
  %_load_val1022 = load i64, i64* %_j1018
  %_binop1023 = icmp slt i64 %_load_val1022, 100
  br i1 %_binop1023, label %_lbody1028, label %_lpost1029
_lbody1028:
  %_load_val1024 = load i64, i64* %_p1017
  %_binop1025 = add i64 %_load_val1024, 1
  store i64 %_binop1025, i64* %_p1017
  %_load_val1019 = load i64, i64* %_j1018
  %_binop1020 = add i64 %_load_val1019, 1
  store i64 %_binop1020, i64* %_j1018
  br label %_lpre1027
_lpost1029:
  %_load_ref1030 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1016
  %_call1031 = call i64 @g({ i64, [0 x i64] }* %_load_ref1030)
  %_load_val1032 = load i64, i64* @i
  %_call1033 = call i64 @f(i64 %_load_val1032)
  %_binop1034 = add i64 %_call1031, %_call1033
  %_load_ref1035 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1016
  %_index_ptr1036 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1035, i32 0, i32 1, i32 3
  %_index_load1037 = load i64, i64* %_index_ptr1036
  %_call1038 = call i64 @f(i64 %_index_load1037)
  %_binop1039 = add i64 %_binop1034, %_call1038
  %_load_ref1040 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_garr1005
  %_index_ptr1041 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1040, i32 0, i32 1, i32 1
  %_index_load1042 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1041
  %_index_ptr1043 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load1042, i32 0, i32 1, i32 1
  %_index_load1044 = load i64, i64* %_index_ptr1043
  %_call1045 = call i64 @f(i64 %_index_load1044)
  %_binop1046 = add i64 %_binop1039, %_call1045
  %_load_val1047 = load i64, i64* %_p1017
  %_call1048 = call i64 @f(i64 %_load_val1047)
  %_binop1049 = add i64 %_binop1046, %_call1048
  ret i64 %_binop1049
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
