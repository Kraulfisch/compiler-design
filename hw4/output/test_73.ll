; generated from: oatprograms/run25.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1942 = alloca i64
  %_func_uid1944 = alloca { i64, [0 x i8*] }*
  %_a1954 = alloca { i64, [0 x i64] }*
  %_str1957 = alloca i8*
  store i64 %argc, i64* %_func_uid1942
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1944
  %_raw_array1946 = call i64* @oat_alloc_array(i64 3)
  %_array1947 = bitcast i64* %_raw_array1946 to { i64, [0 x i64] }*
  %_arr_init_ptr1948 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1947, i32 0, i32 1, i32 0
  store i64 110, i64* %_arr_init_ptr1948
  %_arr_init_ptr1950 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1947, i32 0, i32 1, i32 1
  store i64 110, i64* %_arr_init_ptr1950
  %_arr_init_ptr1952 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1947, i32 0, i32 1, i32 2
  store i64 110, i64* %_arr_init_ptr1952
  store { i64, [0 x i64] }* %_array1947, { i64, [0 x i64] }** %_a1954
  %_load_ref1955 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a1954
  %_call1956 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref1955)
  store i8* %_call1956, i8** %_str1957
  %_load_ref1958 = load i8*, i8** %_str1957
  call void @print_string(i8* %_load_ref1958)
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
