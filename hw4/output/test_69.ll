; generated from: oatprograms/run20.oat
target triple = "x86_64-unknown-linux"
define i64 @f() {
  ret i64 19
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1863 = alloca i64
  %_func_uid1865 = alloca { i64, [0 x i8*] }*
  %_a1875 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid1863
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1865
  %_raw_array1867 = call i64* @oat_alloc_array(i64 3)
  %_array1868 = bitcast i64* %_raw_array1867 to { i64, [0 x i64] }*
  %_arr_init_ptr1869 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1868, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr1869
  %_arr_init_ptr1871 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1868, i32 0, i32 1, i32 1
  store i64 100, i64* %_arr_init_ptr1871
  %_arr_init_ptr1873 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1868, i32 0, i32 1, i32 2
  store i64 19, i64* %_arr_init_ptr1873
  store { i64, [0 x i64] }* %_array1868, { i64, [0 x i64] }** %_a1875
  %_load_ref1876 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a1875
  %_index_ptr1877 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1876, i32 0, i32 1, i32 2
  %_index_load1878 = load i64, i64* %_index_ptr1877
  ret i64 %_index_load1878
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
