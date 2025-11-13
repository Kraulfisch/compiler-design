; generated from: oatprograms/run8.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1238 = alloca i64
  %_func_uid1240 = alloca { i64, [0 x i8*] }*
  %_arr1248 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid1238
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1240
  %_raw_array1242 = call i64* @oat_alloc_array(i64 2)
  %_array1243 = bitcast i64* %_raw_array1242 to { i64, [0 x i64] }*
  %_arr_init_ptr1244 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1243, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr1244
  %_arr_init_ptr1246 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1243, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr1246
  store { i64, [0 x i64] }* %_array1243, { i64, [0 x i64] }** %_arr1248
  %_load_ref1249 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1248
  %_index_ptr1250 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1249, i32 0, i32 1, i32 1
  %_index_load1251 = load i64, i64* %_index_ptr1250
  ret i64 %_index_load1251
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
