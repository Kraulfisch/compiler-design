; generated from: oatprograms/run23.oat
target triple = "x86_64-unknown-linux"
@_string_hoist1906 = global [4 x i8] c"abc\00"
@_string_hoist1910 = global [4 x i8] c"def\00"
@_string_hoist1918 = global [4 x i8] c"789\00"
@_string_hoist1922 = global [4 x i8] c"123\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1898 = alloca i64
  %_func_uid1900 = alloca { i64, [0 x i8*] }*
  %_strs1928 = alloca { i64, [0 x { i64, [0 x i8*] }*] }*
  store i64 %argc, i64* %_func_uid1898
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1900
  %_raw_array1902 = call i64* @oat_alloc_array(i64 2)
  %_array1903 = bitcast i64* %_raw_array1902 to { i64, [0 x { i64, [0 x i8*] }*] }*
  %_raw_array1904 = call i64* @oat_alloc_array(i64 2)
  %_array1905 = bitcast i64* %_raw_array1904 to { i64, [0 x i8*] }*
  %_str_ptr1907 = getelementptr [4 x i8], [4 x i8]* @_string_hoist1906, i32 0, i32 0
  %_arr_init_ptr1908 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_array1905, i32 0, i32 1, i32 0
  store i8* %_str_ptr1907, i8** %_arr_init_ptr1908
  %_str_ptr1911 = getelementptr [4 x i8], [4 x i8]* @_string_hoist1910, i32 0, i32 0
  %_arr_init_ptr1912 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_array1905, i32 0, i32 1, i32 1
  store i8* %_str_ptr1911, i8** %_arr_init_ptr1912
  %_arr_init_ptr1914 = getelementptr { i64, [0 x { i64, [0 x i8*] }*] }, { i64, [0 x { i64, [0 x i8*] }*] }* %_array1903, i32 0, i32 1, i32 0
  store { i64, [0 x i8*] }* %_array1905, { i64, [0 x i8*] }** %_arr_init_ptr1914
  %_raw_array1916 = call i64* @oat_alloc_array(i64 2)
  %_array1917 = bitcast i64* %_raw_array1916 to { i64, [0 x i8*] }*
  %_str_ptr1919 = getelementptr [4 x i8], [4 x i8]* @_string_hoist1918, i32 0, i32 0
  %_arr_init_ptr1920 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_array1917, i32 0, i32 1, i32 0
  store i8* %_str_ptr1919, i8** %_arr_init_ptr1920
  %_str_ptr1923 = getelementptr [4 x i8], [4 x i8]* @_string_hoist1922, i32 0, i32 0
  %_arr_init_ptr1924 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_array1917, i32 0, i32 1, i32 1
  store i8* %_str_ptr1923, i8** %_arr_init_ptr1924
  %_arr_init_ptr1926 = getelementptr { i64, [0 x { i64, [0 x i8*] }*] }, { i64, [0 x { i64, [0 x i8*] }*] }* %_array1903, i32 0, i32 1, i32 1
  store { i64, [0 x i8*] }* %_array1917, { i64, [0 x i8*] }** %_arr_init_ptr1926
  store { i64, [0 x { i64, [0 x i8*] }*] }* %_array1903, { i64, [0 x { i64, [0 x i8*] }*] }** %_strs1928
  %_load_ref1929 = load { i64, [0 x { i64, [0 x i8*] }*] }*, { i64, [0 x { i64, [0 x i8*] }*] }** %_strs1928
  %_index_ptr1930 = getelementptr { i64, [0 x { i64, [0 x i8*] }*] }, { i64, [0 x { i64, [0 x i8*] }*] }* %_load_ref1929, i32 0, i32 1, i32 1
  %_index_load1931 = load { i64, [0 x i8*] }*, { i64, [0 x i8*] }** %_index_ptr1930
  %_index_ptr1932 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_index_load1931, i32 0, i32 1, i32 1
  %_index_load1933 = load i8*, i8** %_index_ptr1932
  call void @print_string(i8* %_index_load1933)
  ret i64 0
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
