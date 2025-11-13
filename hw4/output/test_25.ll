; generated from: oatprograms/arrayargs.oat
target triple = "x86_64-unknown-linux"
define { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %x, { i64, [0 x i64] }* %y, i1 %b) {
  %_func_uid330 = alloca { i64, [0 x i64] }*
  %_func_uid332 = alloca { i64, [0 x i64] }*
  %_func_uid334 = alloca i1
  store { i64, [0 x i64] }* %x, { i64, [0 x i64] }** %_func_uid330
  store { i64, [0 x i64] }* %y, { i64, [0 x i64] }** %_func_uid332
  store i1 %b, i1* %_func_uid334
  %_load_val336 = load i1, i1* %_func_uid334
  br i1 %_load_val336, label %_lthen339, label %_lelse340
_lthen339:
  %_load_ref337 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid330
  ret { i64, [0 x i64] }* %_load_ref337
_lelse340:
  %_load_ref338 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid332
  ret { i64, [0 x i64] }* %_load_ref338
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid283 = alloca i64
  %_func_uid285 = alloca { i64, [0 x i8*] }*
  %_x289 = alloca { i64, [0 x i64] }*
  %_i290 = alloca i64
  %_y306 = alloca { i64, [0 x i64] }*
  %_i307 = alloca i64
  store i64 %argc, i64* %_func_uid283
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid285
  %_raw_array287 = call i64* @oat_alloc_array(i64 3)
  %_array288 = bitcast i64* %_raw_array287 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array288, { i64, [0 x i64] }** %_x289
  store i64 0, i64* %_i290
  br label %_lpre301
_lpre301:
  %_load_val294 = load i64, i64* %_i290
  %_binop295 = icmp slt i64 %_load_val294, 3
  br i1 %_binop295, label %_lbody302, label %_lpost303
_lbody302:
  %_load_ref296 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x289
  %_load_val297 = load i64, i64* %_i290
  %_load_val298 = load i64, i64* %_i290
  %_assign_ptr299 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref296, i32 0, i32 1, i64 %_load_val297
  store i64 %_load_val298, i64* %_assign_ptr299
  %_load_val291 = load i64, i64* %_i290
  %_binop292 = add i64 %_load_val291, 1
  store i64 %_binop292, i64* %_i290
  br label %_lpre301
_lpost303:
  %_raw_array304 = call i64* @oat_alloc_array(i64 3)
  %_array305 = bitcast i64* %_raw_array304 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array305, { i64, [0 x i64] }** %_y306
  store i64 0, i64* %_i307
  br label %_lpre319
_lpre319:
  %_load_val311 = load i64, i64* %_i307
  %_binop312 = icmp slt i64 %_load_val311, 3
  br i1 %_binop312, label %_lbody320, label %_lpost321
_lbody320:
  %_load_ref313 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_y306
  %_load_val314 = load i64, i64* %_i307
  %_load_val315 = load i64, i64* %_i307
  %_binop316 = add i64 %_load_val315, 3
  %_assign_ptr317 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref313, i32 0, i32 1, i64 %_load_val314
  store i64 %_binop316, i64* %_assign_ptr317
  %_load_val308 = load i64, i64* %_i307
  %_binop309 = add i64 %_load_val308, 1
  store i64 %_binop309, i64* %_i307
  br label %_lpre319
_lpost321:
  %_load_ref322 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x289
  %_load_ref323 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_y306
  %_call324 = call { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %_load_ref322, { i64, [0 x i64] }* %_load_ref323, i1 1)
  %_assign_ptr325 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_call324, i32 0, i32 1, i32 0
  store i64 17, i64* %_assign_ptr325
  %_load_ref327 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x289
  %_index_ptr328 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref327, i32 0, i32 1, i32 0
  %_index_load329 = load i64, i64* %_index_ptr328
  ret i64 %_index_load329
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
