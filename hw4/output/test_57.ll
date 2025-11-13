; generated from: oatprograms/run5.oat
target triple = "x86_64-unknown-linux"
@arr = global { i64, [0 x { i64, [0 x i64] }*] }* null

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1118 = alloca i64
  %_func_uid1120 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid1118
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1120
  %_raw_array1122 = call i64* @oat_alloc_array(i64 2)
  %_array1123 = bitcast i64* %_raw_array1122 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1124 = call i64* @oat_alloc_array(i64 2)
  %_array1125 = bitcast i64* %_raw_array1124 to { i64, [0 x i64] }*
  %_arr_init_ptr1126 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1125, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr1126
  %_arr_init_ptr1128 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1125, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr1128
  %_arr_init_ptr1130 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1123, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1125, { i64, [0 x i64] }** %_arr_init_ptr1130
  %_raw_array1132 = call i64* @oat_alloc_array(i64 2)
  %_array1133 = bitcast i64* %_raw_array1132 to { i64, [0 x i64] }*
  %_arr_init_ptr1134 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1133, i32 0, i32 1, i32 0
  store i64 3, i64* %_arr_init_ptr1134
  %_arr_init_ptr1136 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1133, i32 0, i32 1, i32 1
  store i64 4, i64* %_arr_init_ptr1136
  %_arr_init_ptr1138 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1123, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1133, { i64, [0 x i64] }** %_arr_init_ptr1138
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1123, { i64, [0 x { i64, [0 x i64] }*] }** @arr
  %_load_ref1141 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** @arr
  %_index_ptr1142 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1141, i32 0, i32 1, i32 1
  %_index_load1143 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1142
  %_index_ptr1144 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load1143, i32 0, i32 1, i32 1
  %_index_load1145 = load i64, i64* %_index_ptr1144
  ret i64 %_index_load1145
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
