; generated from: oatprograms/run19.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1846 = alloca i64
  %_func_uid1848 = alloca { i64, [0 x i8*] }*
  %_i1850 = alloca i64
  %_a1859 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid1846
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1848
  store i64 999, i64* %_i1850
  %_raw_array1851 = call i64* @oat_alloc_array(i64 3)
  %_array1852 = bitcast i64* %_raw_array1851 to { i64, [0 x i64] }*
  %_arr_init_ptr1853 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1852, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr1853
  %_arr_init_ptr1855 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1852, i32 0, i32 1, i32 1
  store i64 100, i64* %_arr_init_ptr1855
  %_arr_init_ptr1857 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1852, i32 0, i32 1, i32 2
  store i64 999, i64* %_arr_init_ptr1857
  store { i64, [0 x i64] }* %_array1852, { i64, [0 x i64] }** %_a1859
  %_load_ref1860 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a1859
  %_index_ptr1861 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1860, i32 0, i32 1, i32 2
  %_index_load1862 = load i64, i64* %_index_ptr1861
  ret i64 %_index_load1862
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
