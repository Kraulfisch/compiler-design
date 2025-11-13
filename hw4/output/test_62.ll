; generated from: oatprograms/run10.oat
target triple = "x86_64-unknown-linux"
define { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %arr) {
  %_func_uid1315 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %arr, { i64, [0 x i64] }** %_func_uid1315
  %_load_ref1317 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid1315
  ret { i64, [0 x i64] }* %_load_ref1317
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1280 = alloca i64
  %_func_uid1282 = alloca { i64, [0 x i8*] }*
  %_garr1306 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_arr1311 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid1280
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1282
  %_raw_array1284 = call i64* @oat_alloc_array(i64 2)
  %_array1285 = bitcast i64* %_raw_array1284 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1286 = call i64* @oat_alloc_array(i64 3)
  %_array1287 = bitcast i64* %_raw_array1286 to { i64, [0 x i64] }*
  %_arr_init_ptr1288 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1287, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr1288
  %_arr_init_ptr1290 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1287, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr1290
  %_arr_init_ptr1292 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1287, i32 0, i32 1, i32 2
  store i64 3, i64* %_arr_init_ptr1292
  %_arr_init_ptr1294 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1285, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1287, { i64, [0 x i64] }** %_arr_init_ptr1294
  %_raw_array1296 = call i64* @oat_alloc_array(i64 3)
  %_array1297 = bitcast i64* %_raw_array1296 to { i64, [0 x i64] }*
  %_arr_init_ptr1298 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1297, i32 0, i32 1, i32 0
  store i64 4, i64* %_arr_init_ptr1298
  %_arr_init_ptr1300 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1297, i32 0, i32 1, i32 1
  store i64 5, i64* %_arr_init_ptr1300
  %_arr_init_ptr1302 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1297, i32 0, i32 1, i32 2
  store i64 6, i64* %_arr_init_ptr1302
  %_arr_init_ptr1304 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1285, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1297, { i64, [0 x i64] }** %_arr_init_ptr1304
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1285, { i64, [0 x { i64, [0 x i64] }*] }** %_garr1306
  %_load_ref1307 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_garr1306
  %_index_ptr1308 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1307, i32 0, i32 1, i32 1
  %_index_load1309 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1308
  %_call1310 = call { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %_index_load1309)
  store { i64, [0 x i64] }* %_call1310, { i64, [0 x i64] }** %_arr1311
  %_load_ref1312 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1311
  %_index_ptr1313 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1312, i32 0, i32 1, i32 1
  %_index_load1314 = load i64, i64* %_index_ptr1313
  ret i64 %_index_load1314
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
