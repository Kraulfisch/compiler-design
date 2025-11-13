; generated from: oatprograms/run9.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1252 = alloca i64
  %_func_uid1254 = alloca { i64, [0 x i8*] }*
  %_arr1274 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %argc, i64* %_func_uid1252
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1254
  %_raw_array1256 = call i64* @oat_alloc_array(i64 2)
  %_array1257 = bitcast i64* %_raw_array1256 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1258 = call i64* @oat_alloc_array(i64 2)
  %_array1259 = bitcast i64* %_raw_array1258 to { i64, [0 x i64] }*
  %_arr_init_ptr1260 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1259, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr1260
  %_arr_init_ptr1262 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1259, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr1262
  %_arr_init_ptr1264 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1257, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1259, { i64, [0 x i64] }** %_arr_init_ptr1264
  %_raw_array1266 = call i64* @oat_alloc_array(i64 2)
  %_array1267 = bitcast i64* %_raw_array1266 to { i64, [0 x i64] }*
  %_arr_init_ptr1268 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1267, i32 0, i32 1, i32 0
  store i64 3, i64* %_arr_init_ptr1268
  %_arr_init_ptr1270 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1267, i32 0, i32 1, i32 1
  store i64 4, i64* %_arr_init_ptr1270
  %_arr_init_ptr1272 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1257, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1267, { i64, [0 x i64] }** %_arr_init_ptr1272
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1257, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1274
  %_load_ref1275 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1274
  %_index_ptr1276 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1275, i32 0, i32 1, i32 1
  %_index_load1277 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1276
  %_index_ptr1278 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load1277, i32 0, i32 1, i32 1
  %_index_load1279 = load i64, i64* %_index_ptr1278
  ret i64 %_index_load1279
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
