; generated from: oatprograms/run6.oat
target triple = "x86_64-unknown-linux"
@arr = global { i64, [0 x { i64, [0 x i64] }*] }* null

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1146 = alloca i64
  %_func_uid1148 = alloca { i64, [0 x i8*] }*
  %_arr1168 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %argc, i64* %_func_uid1146
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1148
  %_raw_array1150 = call i64* @oat_alloc_array(i64 2)
  %_array1151 = bitcast i64* %_raw_array1150 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1152 = call i64* @oat_alloc_array(i64 2)
  %_array1153 = bitcast i64* %_raw_array1152 to { i64, [0 x i64] }*
  %_arr_init_ptr1154 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1153, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr1154
  %_arr_init_ptr1156 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1153, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr1156
  %_arr_init_ptr1158 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1151, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1153, { i64, [0 x i64] }** %_arr_init_ptr1158
  %_raw_array1160 = call i64* @oat_alloc_array(i64 2)
  %_array1161 = bitcast i64* %_raw_array1160 to { i64, [0 x i64] }*
  %_arr_init_ptr1162 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1161, i32 0, i32 1, i32 0
  store i64 3, i64* %_arr_init_ptr1162
  %_arr_init_ptr1164 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1161, i32 0, i32 1, i32 1
  store i64 4, i64* %_arr_init_ptr1164
  %_arr_init_ptr1166 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1151, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1161, { i64, [0 x i64] }** %_arr_init_ptr1166
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1151, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1168
  %_load_ref1169 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1168
  %_index_ptr1170 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1169, i32 0, i32 1, i32 0
  %_index_load1171 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1170
  %_index_ptr1172 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load1171, i32 0, i32 1, i32 0
  %_index_load1173 = load i64, i64* %_index_ptr1172
  ret i64 %_index_load1173
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
