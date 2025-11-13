; generated from: oatprograms/run22.oat
target triple = "x86_64-unknown-linux"
@_string_hoist1885 = global [4 x i8] c"abc\00"
@_string_hoist1889 = global [4 x i8] c"def\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1879 = alloca i64
  %_func_uid1881 = alloca { i64, [0 x i8*] }*
  %_strs1893 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid1879
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1881
  %_raw_array1883 = call i64* @oat_alloc_array(i64 2)
  %_array1884 = bitcast i64* %_raw_array1883 to { i64, [0 x i8*] }*
  %_str_ptr1886 = getelementptr [4 x i8], [4 x i8]* @_string_hoist1885, i32 0, i32 0
  %_arr_init_ptr1887 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_array1884, i32 0, i32 1, i32 0
  store i8* %_str_ptr1886, i8** %_arr_init_ptr1887
  %_str_ptr1890 = getelementptr [4 x i8], [4 x i8]* @_string_hoist1889, i32 0, i32 0
  %_arr_init_ptr1891 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_array1884, i32 0, i32 1, i32 1
  store i8* %_str_ptr1890, i8** %_arr_init_ptr1891
  store { i64, [0 x i8*] }* %_array1884, { i64, [0 x i8*] }** %_strs1893
  %_load_ref1894 = load { i64, [0 x i8*] }*, { i64, [0 x i8*] }** %_strs1893
  %_index_ptr1895 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_load_ref1894, i32 0, i32 1, i32 0
  %_index_load1896 = load i8*, i8** %_index_ptr1895
  call void @print_string(i8* %_index_load1896)
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
