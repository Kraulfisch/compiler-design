; generated from: oatprograms/run7.oat
target triple = "x86_64-unknown-linux"
@arr = global { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }* null

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1174 = alloca i64
  %_func_uid1176 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid1174
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1176
  %_raw_array1178 = call i64* @oat_alloc_array(i64 3)
  %_array1179 = bitcast i64* %_raw_array1178 to { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }*
  %_raw_array1180 = call i64* @oat_alloc_array(i64 2)
  %_array1181 = bitcast i64* %_raw_array1180 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1182 = call i64* @oat_alloc_array(i64 2)
  %_array1183 = bitcast i64* %_raw_array1182 to { i64, [0 x i64] }*
  %_arr_init_ptr1184 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1183, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr1184
  %_arr_init_ptr1186 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1183, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr1186
  %_arr_init_ptr1188 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1181, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1183, { i64, [0 x i64] }** %_arr_init_ptr1188
  %_raw_array1190 = call i64* @oat_alloc_array(i64 2)
  %_array1191 = bitcast i64* %_raw_array1190 to { i64, [0 x i64] }*
  %_arr_init_ptr1192 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1191, i32 0, i32 1, i32 0
  store i64 3, i64* %_arr_init_ptr1192
  %_arr_init_ptr1194 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1191, i32 0, i32 1, i32 1
  store i64 4, i64* %_arr_init_ptr1194
  %_arr_init_ptr1196 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1181, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1191, { i64, [0 x i64] }** %_arr_init_ptr1196
  %_arr_init_ptr1198 = getelementptr { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }, { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }* %_array1179, i32 0, i32 1, i32 0
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1181, { i64, [0 x { i64, [0 x i64] }*] }** %_arr_init_ptr1198
  %_raw_array1200 = call i64* @oat_alloc_array(i64 1)
  %_array1201 = bitcast i64* %_raw_array1200 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1202 = call i64* @oat_alloc_array(i64 1)
  %_array1203 = bitcast i64* %_raw_array1202 to { i64, [0 x i64] }*
  %_arr_init_ptr1204 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1203, i32 0, i32 1, i32 0
  store i64 5, i64* %_arr_init_ptr1204
  %_arr_init_ptr1206 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1201, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1203, { i64, [0 x i64] }** %_arr_init_ptr1206
  %_arr_init_ptr1208 = getelementptr { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }, { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }* %_array1179, i32 0, i32 1, i32 1
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1201, { i64, [0 x { i64, [0 x i64] }*] }** %_arr_init_ptr1208
  %_raw_array1210 = call i64* @oat_alloc_array(i64 2)
  %_array1211 = bitcast i64* %_raw_array1210 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1212 = call i64* @oat_alloc_array(i64 2)
  %_array1213 = bitcast i64* %_raw_array1212 to { i64, [0 x i64] }*
  %_arr_init_ptr1214 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1213, i32 0, i32 1, i32 0
  store i64 10, i64* %_arr_init_ptr1214
  %_arr_init_ptr1216 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1213, i32 0, i32 1, i32 1
  store i64 20, i64* %_arr_init_ptr1216
  %_arr_init_ptr1218 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1211, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1213, { i64, [0 x i64] }** %_arr_init_ptr1218
  %_raw_array1220 = call i64* @oat_alloc_array(i64 2)
  %_array1221 = bitcast i64* %_raw_array1220 to { i64, [0 x i64] }*
  %_arr_init_ptr1222 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1221, i32 0, i32 1, i32 0
  store i64 30, i64* %_arr_init_ptr1222
  %_arr_init_ptr1224 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1221, i32 0, i32 1, i32 1
  store i64 40, i64* %_arr_init_ptr1224
  %_arr_init_ptr1226 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1211, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1221, { i64, [0 x i64] }** %_arr_init_ptr1226
  %_arr_init_ptr1228 = getelementptr { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }, { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }* %_array1179, i32 0, i32 1, i32 2
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1211, { i64, [0 x { i64, [0 x i64] }*] }** %_arr_init_ptr1228
  store { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }* %_array1179, { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }** @arr
  %_load_ref1231 = load { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }*, { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }** @arr
  %_index_ptr1232 = getelementptr { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }, { i64, [0 x { i64, [0 x { i64, [0 x i64] }*] }*] }* %_load_ref1231, i32 0, i32 1, i32 2
  %_index_load1233 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_index_ptr1232
  %_index_ptr1234 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_index_load1233, i32 0, i32 1, i32 0
  %_index_load1235 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1234
  %_index_ptr1236 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load1235, i32 0, i32 1, i32 1
  %_index_load1237 = load i64, i64* %_index_ptr1236
  ret i64 %_index_load1237
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
