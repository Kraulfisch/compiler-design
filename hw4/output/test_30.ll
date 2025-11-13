; generated from: oatprograms/run21.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid444 = alloca i64
  %_func_uid446 = alloca { i64, [0 x i8*] }*
  %_i454 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid444
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid446
  %_raw_array448 = call i64* @oat_alloc_array(i64 2)
  %_array449 = bitcast i64* %_raw_array448 to { i64, [0 x i64] }*
  %_arr_init_ptr450 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array449, i32 0, i32 1, i32 0
  store i64 99, i64* %_arr_init_ptr450
  %_arr_init_ptr452 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array449, i32 0, i32 1, i32 1
  store i64 0, i64* %_arr_init_ptr452
  store { i64, [0 x i64] }* %_array449, { i64, [0 x i64] }** %_i454
  %_load_ref455 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_i454
  %_index_ptr456 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref455, i32 0, i32 1, i32 0
  %_index_load457 = load i64, i64* %_index_ptr456
  ret i64 %_index_load457
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
