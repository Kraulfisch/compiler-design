; generated from: oatprograms/run18.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1830 = alloca i64
  %_func_uid1832 = alloca { i64, [0 x i8*] }*
  %_a1842 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid1830
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1832
  %_raw_array1834 = call i64* @oat_alloc_array(i64 3)
  %_array1835 = bitcast i64* %_raw_array1834 to { i64, [0 x i64] }*
  %_arr_init_ptr1836 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1835, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr1836
  %_arr_init_ptr1838 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1835, i32 0, i32 1, i32 1
  store i64 100, i64* %_arr_init_ptr1838
  %_arr_init_ptr1840 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1835, i32 0, i32 1, i32 2
  store i64 999, i64* %_arr_init_ptr1840
  store { i64, [0 x i64] }* %_array1835, { i64, [0 x i64] }** %_a1842
  %_load_ref1843 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a1842
  %_index_ptr1844 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1843, i32 0, i32 1, i32 2
  %_index_load1845 = load i64, i64* %_index_ptr1844
  ret i64 %_index_load1845
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
