; generated from: oatprograms/arrayargs3.oat
target triple = "x86_64-unknown-linux"
@x = global { i64, [0 x i64] }* bitcast ({ i64, [3 x i64] }* @_garr_data421 to { i64, [0 x i64] }*)
@_garr_data421 = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 1, i64 2, i64 3 ] }
@y = global { i64, [0 x i64] }* bitcast ({ i64, [3 x i64] }* @_garr_data420 to { i64, [0 x i64] }*)
@_garr_data420 = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 4, i64 5, i64 6 ] }

define { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %x, { i64, [0 x i64] }* %y, i1 %b) {
  %_func_uid422 = alloca { i64, [0 x i64] }*
  %_func_uid424 = alloca { i64, [0 x i64] }*
  %_func_uid426 = alloca i1
  store { i64, [0 x i64] }* %x, { i64, [0 x i64] }** %_func_uid422
  store { i64, [0 x i64] }* %y, { i64, [0 x i64] }** %_func_uid424
  store i1 %b, i1* %_func_uid426
  %_load_val428 = load i1, i1* %_func_uid426
  br i1 %_load_val428, label %_lthen431, label %_lelse432
_lthen431:
  %_load_ref429 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid422
  ret { i64, [0 x i64] }* %_load_ref429
_lelse432:
  %_load_ref430 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid424
  ret { i64, [0 x i64] }* %_load_ref430
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid398 = alloca i64
  %_func_uid400 = alloca { i64, [0 x i8*] }*
  %_z418 = alloca i64
  store i64 %argc, i64* %_func_uid398
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid400
  %_load_ref402 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @x
  %_load_ref403 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @y
  %_call404 = call { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %_load_ref402, { i64, [0 x i64] }* %_load_ref403, i1 1)
  %_assign_ptr405 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_call404, i32 0, i32 1, i32 0
  store i64 17, i64* %_assign_ptr405
  %_load_ref407 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @x
  %_load_ref408 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @y
  %_call409 = call { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %_load_ref407, { i64, [0 x i64] }* %_load_ref408, i1 1)
  %_index_ptr410 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_call409, i32 0, i32 1, i32 0
  %_index_load411 = load i64, i64* %_index_ptr410
  %_load_ref412 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @y
  %_load_ref413 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @x
  %_call414 = call { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %_load_ref412, { i64, [0 x i64] }* %_load_ref413, i1 0)
  %_index_ptr415 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_call414, i32 0, i32 1, i32 0
  %_index_load416 = load i64, i64* %_index_ptr415
  %_binop417 = add i64 %_index_load411, %_index_load416
  store i64 %_binop417, i64* %_z418
  %_load_val419 = load i64, i64* %_z418
  ret i64 %_load_val419
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
