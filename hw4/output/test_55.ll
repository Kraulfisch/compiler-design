; generated from: oatprograms/run3.oat
target triple = "x86_64-unknown-linux"
@arr = global { i64, [0 x i64] }* null

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1090 = alloca i64
  %_func_uid1092 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid1090
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1092
  %_raw_array1094 = call i64* @oat_alloc_array(i64 2)
  %_array1095 = bitcast i64* %_raw_array1094 to { i64, [0 x i64] }*
  %_arr_init_ptr1096 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1095, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr1096
  %_arr_init_ptr1098 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1095, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr1098
  store { i64, [0 x i64] }* %_array1095, { i64, [0 x i64] }** @arr
  %_load_ref1101 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @arr
  %_index_ptr1102 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1101, i32 0, i32 1, i32 1
  %_index_load1103 = load i64, i64* %_index_ptr1102
  ret i64 %_index_load1103
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
