; generated from: oatprograms/run4.oat
target triple = "x86_64-unknown-linux"
@arr = global { i64, [0 x i64] }* null

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1104 = alloca i64
  %_func_uid1106 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid1104
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1106
  %_raw_array1108 = call i64* @oat_alloc_array(i64 2)
  %_array1109 = bitcast i64* %_raw_array1108 to { i64, [0 x i64] }*
  %_arr_init_ptr1110 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1109, i32 0, i32 1, i32 0
  store i64 17, i64* %_arr_init_ptr1110
  %_arr_init_ptr1112 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1109, i32 0, i32 1, i32 1
  store i64 42, i64* %_arr_init_ptr1112
  store { i64, [0 x i64] }* %_array1109, { i64, [0 x i64] }** @arr
  %_load_ref1115 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @arr
  %_index_ptr1116 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1115, i32 0, i32 1, i32 1
  %_index_load1117 = load i64, i64* %_index_ptr1116
  ret i64 %_index_load1117
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
