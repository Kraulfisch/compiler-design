; generated from: oatprograms/arrayargs2.oat
target triple = "x86_64-unknown-linux"
define { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %x, { i64, [0 x i64] }* %y, i1 %b) {
  %_func_uid386 = alloca { i64, [0 x i64] }*
  %_func_uid388 = alloca { i64, [0 x i64] }*
  %_func_uid390 = alloca i1
  store { i64, [0 x i64] }* %x, { i64, [0 x i64] }** %_func_uid386
  store { i64, [0 x i64] }* %y, { i64, [0 x i64] }** %_func_uid388
  store i1 %b, i1* %_func_uid390
  %_load_val392 = load i1, i1* %_func_uid390
  br i1 %_load_val392, label %_lthen395, label %_lelse396
_lthen395:
  %_load_ref393 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid386
  ret { i64, [0 x i64] }* %_load_ref393
_lelse396:
  %_load_ref394 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid388
  ret { i64, [0 x i64] }* %_load_ref394
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid368 = alloca i64
  %_func_uid370 = alloca { i64, [0 x i8*] }*
  %_x374 = alloca { i64, [0 x i64] }*
  %_y377 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid368
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid370
  %_raw_array372 = call i64* @oat_alloc_array(i64 3)
  %_array373 = bitcast i64* %_raw_array372 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array373, { i64, [0 x i64] }** %_x374
  %_raw_array375 = call i64* @oat_alloc_array(i64 3)
  %_array376 = bitcast i64* %_raw_array375 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array376, { i64, [0 x i64] }** %_y377
  %_load_ref378 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x374
  %_load_ref379 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_y377
  %_call380 = call { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %_load_ref378, { i64, [0 x i64] }* %_load_ref379, i1 1)
  %_assign_ptr381 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_call380, i32 0, i32 1, i32 0
  store i64 17, i64* %_assign_ptr381
  %_load_ref383 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x374
  %_index_ptr384 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref383, i32 0, i32 1, i32 0
  %_index_load385 = load i64, i64* %_index_ptr384
  ret i64 %_index_load385
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
