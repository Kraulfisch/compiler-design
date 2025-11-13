; generated from: oatprograms/sieve.oat
target triple = "x86_64-unknown-linux"
define i64 @sieve(i64 %n) {
  %_func_uid4288 = alloca i64
  %_arr4293 = alloca { i64, [0 x i1] }*
  %_i4294 = alloca i64
  %_i4314 = alloca i64
  %_j4327 = alloca i64
  %_count4348 = alloca i64
  %_i4349 = alloca i64
  store i64 %n, i64* %_func_uid4288
  %_load_val4290 = load i64, i64* %_func_uid4288
  %_raw_array4291 = call i64* @oat_alloc_array(i64 %_load_val4290)
  %_array4292 = bitcast i64* %_raw_array4291 to { i64, [0 x i1] }*
  store { i64, [0 x i1] }* %_array4292, { i64, [0 x i1] }** %_arr4293
  store i64 0, i64* %_i4294
  br label %_lpre4305
_lpre4305:
  %_load_val4298 = load i64, i64* %_i4294
  %_load_val4299 = load i64, i64* %_func_uid4288
  %_binop4300 = icmp slt i64 %_load_val4298, %_load_val4299
  br i1 %_binop4300, label %_lbody4306, label %_lpost4307
_lbody4306:
  %_load_ref4301 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr4293
  %_load_val4302 = load i64, i64* %_i4294
  %_assign_ptr4303 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4301, i32 0, i32 1, i64 %_load_val4302
  store i1 1, i1* %_assign_ptr4303
  %_load_val4295 = load i64, i64* %_i4294
  %_binop4296 = add i64 %_load_val4295, 1
  store i64 %_binop4296, i64* %_i4294
  br label %_lpre4305
_lpost4307:
  %_load_ref4308 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr4293
  %_assign_ptr4309 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4308, i32 0, i32 1, i32 0
  store i1 0, i1* %_assign_ptr4309
  %_load_ref4311 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr4293
  %_assign_ptr4312 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4311, i32 0, i32 1, i32 1
  store i1 0, i1* %_assign_ptr4312
  store i64 0, i64* %_i4314
  br label %_lpre4345
_lpre4345:
  %_load_val4318 = load i64, i64* %_i4314
  %_load_val4319 = load i64, i64* %_func_uid4288
  %_binop4320 = icmp slt i64 %_load_val4318, %_load_val4319
  br i1 %_binop4320, label %_lbody4346, label %_lpost4347
_lbody4346:
  %_load_ref4321 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr4293
  %_load_val4322 = load i64, i64* %_i4314
  %_index_ptr4323 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4321, i32 0, i32 1, i64 %_load_val4322
  %_index_load4324 = load i1, i1* %_index_ptr4323
  br i1 %_index_load4324, label %_lthen4342, label %_lelse4343
_lthen4342:
  %_load_val4325 = load i64, i64* %_i4314
  %_binop4326 = mul i64 %_load_val4325, 2
  store i64 %_binop4326, i64* %_j4327
  br label %_lpre4339
_lpre4339:
  %_load_val4332 = load i64, i64* %_j4327
  %_load_val4333 = load i64, i64* %_func_uid4288
  %_binop4334 = icmp slt i64 %_load_val4332, %_load_val4333
  br i1 %_binop4334, label %_lbody4340, label %_lpost4341
_lbody4340:
  %_load_ref4335 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr4293
  %_load_val4336 = load i64, i64* %_j4327
  %_assign_ptr4337 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4335, i32 0, i32 1, i64 %_load_val4336
  store i1 0, i1* %_assign_ptr4337
  %_load_val4328 = load i64, i64* %_j4327
  %_load_val4329 = load i64, i64* %_i4314
  %_binop4330 = add i64 %_load_val4328, %_load_val4329
  store i64 %_binop4330, i64* %_j4327
  br label %_lpre4339
_lpost4341:
  br label %_lafter4344
_lelse4343:
  br label %_lafter4344
_lafter4344:
  %_load_val4315 = load i64, i64* %_i4314
  %_binop4316 = add i64 %_load_val4315, 1
  store i64 %_binop4316, i64* %_i4314
  br label %_lpre4345
_lpost4347:
  store i64 0, i64* %_count4348
  store i64 0, i64* %_i4349
  br label %_lpre4366
_lpre4366:
  %_load_val4353 = load i64, i64* %_i4349
  %_load_val4354 = load i64, i64* %_func_uid4288
  %_binop4355 = icmp slt i64 %_load_val4353, %_load_val4354
  br i1 %_binop4355, label %_lbody4367, label %_lpost4368
_lbody4367:
  %_load_ref4356 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_arr4293
  %_load_val4357 = load i64, i64* %_i4349
  %_index_ptr4358 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_load_ref4356, i32 0, i32 1, i64 %_load_val4357
  %_index_load4359 = load i1, i1* %_index_ptr4358
  br i1 %_index_load4359, label %_lthen4363, label %_lelse4364
_lthen4363:
  %_load_val4360 = load i64, i64* %_count4348
  %_binop4361 = add i64 %_load_val4360, 1
  store i64 %_binop4361, i64* %_count4348
  br label %_lafter4365
_lelse4364:
  br label %_lafter4365
_lafter4365:
  %_load_val4350 = load i64, i64* %_i4349
  %_binop4351 = add i64 %_load_val4350, 1
  store i64 %_binop4351, i64* %_i4349
  br label %_lpre4366
_lpost4368:
  %_load_val4369 = load i64, i64* %_count4348
  ret i64 %_load_val4369
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid4281 = alloca i64
  %_func_uid4283 = alloca { i64, [0 x i8*] }*
  %_n4285 = alloca i64
  store i64 %argc, i64* %_func_uid4281
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid4283
  store i64 100, i64* %_n4285
  %_load_val4286 = load i64, i64* %_n4285
  %_call4287 = call i64 @sieve(i64 %_load_val4286)
  ret i64 %_call4287
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
