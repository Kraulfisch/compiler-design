; generated from: oatprograms/arrayargs1.oat
target triple = "x86_64-unknown-linux"
@x = global { i64, [0 x i64] }* bitcast ({ i64, [3 x i64] }* @_garr_data355 to { i64, [0 x i64] }*)
@_garr_data355 = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 1, i64 2, i64 3 ] }
@y = global { i64, [0 x i64] }* bitcast ({ i64, [3 x i64] }* @_garr_data354 to { i64, [0 x i64] }*)
@_garr_data354 = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 4, i64 5, i64 6 ] }

define { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %x, { i64, [0 x i64] }* %y, i1 %b) {
  %_func_uid356 = alloca { i64, [0 x i64] }*
  %_func_uid358 = alloca { i64, [0 x i64] }*
  %_func_uid360 = alloca i1
  store { i64, [0 x i64] }* %x, { i64, [0 x i64] }** %_func_uid356
  store { i64, [0 x i64] }* %y, { i64, [0 x i64] }** %_func_uid358
  store i1 %b, i1* %_func_uid360
  %_load_val362 = load i1, i1* %_func_uid360
  br i1 %_load_val362, label %_lthen365, label %_lelse366
_lthen365:
  %_load_ref363 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid356
  ret { i64, [0 x i64] }* %_load_ref363
_lelse366:
  %_load_ref364 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid358
  ret { i64, [0 x i64] }* %_load_ref364
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid342 = alloca i64
  %_func_uid344 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid342
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid344
  %_load_ref346 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @x
  %_load_ref347 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @y
  %_call348 = call { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %_load_ref346, { i64, [0 x i64] }* %_load_ref347, i1 1)
  %_assign_ptr349 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_call348, i32 0, i32 1, i32 0
  store i64 17, i64* %_assign_ptr349
  %_load_ref351 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @x
  %_index_ptr352 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref351, i32 0, i32 1, i32 0
  %_index_load353 = load i64, i64* %_index_ptr352
  ret i64 %_index_load353
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
