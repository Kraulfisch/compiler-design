; generated from: oatprograms/count_sort.oat
target triple = "x86_64-unknown-linux"
@_string_hoist4399 = global [2 x i8] c"
\00"

define i64 @min({ i64, [0 x i64] }* %arr, i64 %len) {
  %_func_uid4538 = alloca { i64, [0 x i64] }*
  %_func_uid4540 = alloca i64
  %_min4545 = alloca i64
  %_i4546 = alloca i64
  store { i64, [0 x i64] }* %arr, { i64, [0 x i64] }** %_func_uid4538
  store i64 %len, i64* %_func_uid4540
  %_load_ref4542 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4538
  %_index_ptr4543 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4542, i32 0, i32 1, i32 0
  %_index_load4544 = load i64, i64* %_index_ptr4543
  store i64 %_index_load4544, i64* %_min4545
  store i64 0, i64* %_i4546
  br label %_lpre4567
_lpre4567:
  %_load_val4550 = load i64, i64* %_i4546
  %_load_val4551 = load i64, i64* %_func_uid4540
  %_binop4552 = icmp slt i64 %_load_val4550, %_load_val4551
  br i1 %_binop4552, label %_lbody4568, label %_lpost4569
_lbody4568:
  %_load_ref4553 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4538
  %_load_val4554 = load i64, i64* %_i4546
  %_index_ptr4555 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4553, i32 0, i32 1, i64 %_load_val4554
  %_index_load4556 = load i64, i64* %_index_ptr4555
  %_load_val4557 = load i64, i64* %_min4545
  %_binop4558 = icmp slt i64 %_index_load4556, %_load_val4557
  br i1 %_binop4558, label %_lthen4564, label %_lelse4565
_lthen4564:
  %_load_ref4559 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4538
  %_load_val4560 = load i64, i64* %_i4546
  %_index_ptr4561 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4559, i32 0, i32 1, i64 %_load_val4560
  %_index_load4562 = load i64, i64* %_index_ptr4561
  store i64 %_index_load4562, i64* %_min4545
  br label %_lafter4566
_lelse4565:
  br label %_lafter4566
_lafter4566:
  %_load_val4547 = load i64, i64* %_i4546
  %_binop4548 = add i64 %_load_val4547, 1
  store i64 %_binop4548, i64* %_i4546
  br label %_lpre4567
_lpost4569:
  %_load_val4570 = load i64, i64* %_min4545
  ret i64 %_load_val4570
}

define i64 @max({ i64, [0 x i64] }* %arr, i64 %len) {
  %_func_uid4505 = alloca { i64, [0 x i64] }*
  %_func_uid4507 = alloca i64
  %_max4512 = alloca i64
  %_i4513 = alloca i64
  store { i64, [0 x i64] }* %arr, { i64, [0 x i64] }** %_func_uid4505
  store i64 %len, i64* %_func_uid4507
  %_load_ref4509 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4505
  %_index_ptr4510 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4509, i32 0, i32 1, i32 0
  %_index_load4511 = load i64, i64* %_index_ptr4510
  store i64 %_index_load4511, i64* %_max4512
  store i64 0, i64* %_i4513
  br label %_lpre4534
_lpre4534:
  %_load_val4517 = load i64, i64* %_i4513
  %_load_val4518 = load i64, i64* %_func_uid4507
  %_binop4519 = icmp slt i64 %_load_val4517, %_load_val4518
  br i1 %_binop4519, label %_lbody4535, label %_lpost4536
_lbody4535:
  %_load_ref4520 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4505
  %_load_val4521 = load i64, i64* %_i4513
  %_index_ptr4522 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4520, i32 0, i32 1, i64 %_load_val4521
  %_index_load4523 = load i64, i64* %_index_ptr4522
  %_load_val4524 = load i64, i64* %_max4512
  %_binop4525 = icmp sgt i64 %_index_load4523, %_load_val4524
  br i1 %_binop4525, label %_lthen4531, label %_lelse4532
_lthen4531:
  %_load_ref4526 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4505
  %_load_val4527 = load i64, i64* %_i4513
  %_index_ptr4528 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4526, i32 0, i32 1, i64 %_load_val4527
  %_index_load4529 = load i64, i64* %_index_ptr4528
  store i64 %_index_load4529, i64* %_max4512
  br label %_lafter4533
_lelse4532:
  br label %_lafter4533
_lafter4533:
  %_load_val4514 = load i64, i64* %_i4513
  %_binop4515 = add i64 %_load_val4514, 1
  store i64 %_binop4515, i64* %_i4513
  br label %_lpre4534
_lpost4536:
  %_load_val4537 = load i64, i64* %_max4512
  ret i64 %_load_val4537
}

define { i64, [0 x i64] }* @count_sort({ i64, [0 x i64] }* %arr, i64 %len) {
  %_func_uid4409 = alloca { i64, [0 x i64] }*
  %_func_uid4411 = alloca i64
  %_min4416 = alloca i64
  %_max4420 = alloca i64
  %_counts4427 = alloca { i64, [0 x i64] }*
  %_i4428 = alloca i64
  %_i4458 = alloca i64
  %_j4459 = alloca i64
  %_out4463 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %arr, { i64, [0 x i64] }** %_func_uid4409
  store i64 %len, i64* %_func_uid4411
  %_load_ref4413 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4409
  %_load_val4414 = load i64, i64* %_func_uid4411
  %_call4415 = call i64 @min({ i64, [0 x i64] }* %_load_ref4413, i64 %_load_val4414)
  store i64 %_call4415, i64* %_min4416
  %_load_ref4417 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4409
  %_load_val4418 = load i64, i64* %_func_uid4411
  %_call4419 = call i64 @max({ i64, [0 x i64] }* %_load_ref4417, i64 %_load_val4418)
  store i64 %_call4419, i64* %_max4420
  %_load_val4421 = load i64, i64* %_max4420
  %_load_val4422 = load i64, i64* %_min4416
  %_binop4423 = sub i64 %_load_val4421, %_load_val4422
  %_binop4424 = add i64 %_binop4423, 1
  %_raw_array4425 = call i64* @oat_alloc_array(i64 %_binop4424)
  %_array4426 = bitcast i64* %_raw_array4425 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array4426, { i64, [0 x i64] }** %_counts4427
  store i64 0, i64* %_i4428
  br label %_lpre4454
_lpre4454:
  %_load_val4432 = load i64, i64* %_i4428
  %_load_val4433 = load i64, i64* %_func_uid4411
  %_binop4434 = icmp slt i64 %_load_val4432, %_load_val4433
  br i1 %_binop4434, label %_lbody4455, label %_lpost4456
_lbody4455:
  %_load_ref4435 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts4427
  %_load_ref4436 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4409
  %_load_val4437 = load i64, i64* %_i4428
  %_index_ptr4438 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4436, i32 0, i32 1, i64 %_load_val4437
  %_index_load4439 = load i64, i64* %_index_ptr4438
  %_load_val4440 = load i64, i64* %_min4416
  %_binop4441 = sub i64 %_index_load4439, %_load_val4440
  %_load_ref4442 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts4427
  %_load_ref4443 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4409
  %_load_val4444 = load i64, i64* %_i4428
  %_index_ptr4445 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4443, i32 0, i32 1, i64 %_load_val4444
  %_index_load4446 = load i64, i64* %_index_ptr4445
  %_load_val4447 = load i64, i64* %_min4416
  %_binop4448 = sub i64 %_index_load4446, %_load_val4447
  %_index_ptr4449 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4442, i32 0, i32 1, i64 %_binop4448
  %_index_load4450 = load i64, i64* %_index_ptr4449
  %_binop4451 = add i64 %_index_load4450, 1
  %_assign_ptr4452 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4435, i32 0, i32 1, i64 %_binop4441
  store i64 %_binop4451, i64* %_assign_ptr4452
  %_load_val4429 = load i64, i64* %_i4428
  %_binop4430 = add i64 %_load_val4429, 1
  store i64 %_binop4430, i64* %_i4428
  br label %_lpre4454
_lpost4456:
  %_load_val4457 = load i64, i64* %_min4416
  store i64 %_load_val4457, i64* %_i4458
  store i64 0, i64* %_j4459
  %_load_val4460 = load i64, i64* %_func_uid4411
  %_raw_array4461 = call i64* @oat_alloc_array(i64 %_load_val4460)
  %_array4462 = bitcast i64* %_raw_array4461 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array4462, { i64, [0 x i64] }** %_out4463
  br label %_lpre4501
_lpre4501:
  %_load_val4464 = load i64, i64* %_i4458
  %_load_val4465 = load i64, i64* %_max4420
  %_binop4466 = icmp sle i64 %_load_val4464, %_load_val4465
  br i1 %_binop4466, label %_lbody4502, label %_lpost4503
_lbody4502:
  %_load_ref4467 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts4427
  %_load_val4468 = load i64, i64* %_i4458
  %_load_val4469 = load i64, i64* %_min4416
  %_binop4470 = sub i64 %_load_val4468, %_load_val4469
  %_index_ptr4471 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4467, i32 0, i32 1, i64 %_binop4470
  %_index_load4472 = load i64, i64* %_index_ptr4471
  %_binop4473 = icmp sgt i64 %_index_load4472, 0
  br i1 %_binop4473, label %_lthen4498, label %_lelse4499
_lthen4498:
  %_load_ref4474 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out4463
  %_load_val4475 = load i64, i64* %_j4459
  %_load_val4476 = load i64, i64* %_i4458
  %_assign_ptr4477 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4474, i32 0, i32 1, i64 %_load_val4475
  store i64 %_load_val4476, i64* %_assign_ptr4477
  %_load_ref4479 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts4427
  %_load_val4480 = load i64, i64* %_i4458
  %_load_val4481 = load i64, i64* %_min4416
  %_binop4482 = sub i64 %_load_val4480, %_load_val4481
  %_load_ref4483 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts4427
  %_load_val4484 = load i64, i64* %_i4458
  %_load_val4485 = load i64, i64* %_min4416
  %_binop4486 = sub i64 %_load_val4484, %_load_val4485
  %_index_ptr4487 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4483, i32 0, i32 1, i64 %_binop4486
  %_index_load4488 = load i64, i64* %_index_ptr4487
  %_binop4489 = sub i64 %_index_load4488, 1
  %_assign_ptr4490 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4479, i32 0, i32 1, i64 %_binop4482
  store i64 %_binop4489, i64* %_assign_ptr4490
  %_load_val4492 = load i64, i64* %_j4459
  %_binop4493 = add i64 %_load_val4492, 1
  store i64 %_binop4493, i64* %_j4459
  br label %_lafter4500
_lelse4499:
  %_load_val4495 = load i64, i64* %_i4458
  %_binop4496 = add i64 %_load_val4495, 1
  store i64 %_binop4496, i64* %_i4458
  br label %_lafter4500
_lafter4500:
  br label %_lpre4501
_lpost4503:
  %_load_ref4504 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out4463
  ret { i64, [0 x i64] }* %_load_ref4504
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid4370 = alloca i64
  %_func_uid4372 = alloca { i64, [0 x i8*] }*
  %_arr4394 = alloca { i64, [0 x i64] }*
  %_len4395 = alloca i64
  %_sorted4405 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid4370
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid4372
  %_raw_array4374 = call i64* @oat_alloc_array(i64 9)
  %_array4375 = bitcast i64* %_raw_array4374 to { i64, [0 x i64] }*
  %_arr_init_ptr4376 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4375, i32 0, i32 1, i32 0
  store i64 65, i64* %_arr_init_ptr4376
  %_arr_init_ptr4378 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4375, i32 0, i32 1, i32 1
  store i64 70, i64* %_arr_init_ptr4378
  %_arr_init_ptr4380 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4375, i32 0, i32 1, i32 2
  store i64 72, i64* %_arr_init_ptr4380
  %_arr_init_ptr4382 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4375, i32 0, i32 1, i32 3
  store i64 90, i64* %_arr_init_ptr4382
  %_arr_init_ptr4384 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4375, i32 0, i32 1, i32 4
  store i64 65, i64* %_arr_init_ptr4384
  %_arr_init_ptr4386 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4375, i32 0, i32 1, i32 5
  store i64 65, i64* %_arr_init_ptr4386
  %_arr_init_ptr4388 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4375, i32 0, i32 1, i32 6
  store i64 69, i64* %_arr_init_ptr4388
  %_arr_init_ptr4390 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4375, i32 0, i32 1, i32 7
  store i64 89, i64* %_arr_init_ptr4390
  %_arr_init_ptr4392 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4375, i32 0, i32 1, i32 8
  store i64 67, i64* %_arr_init_ptr4392
  store { i64, [0 x i64] }* %_array4375, { i64, [0 x i64] }** %_arr4394
  store i64 9, i64* %_len4395
  %_load_ref4396 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4394
  %_call4397 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref4396)
  call void @print_string(i8* %_call4397)
  %_str_ptr4400 = getelementptr [2 x i8], [2 x i8]* @_string_hoist4399, i32 0, i32 0
  call void @print_string(i8* %_str_ptr4400)
  %_load_ref4402 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4394
  %_load_val4403 = load i64, i64* %_len4395
  %_call4404 = call { i64, [0 x i64] }* @count_sort({ i64, [0 x i64] }* %_load_ref4402, i64 %_load_val4403)
  store { i64, [0 x i64] }* %_call4404, { i64, [0 x i64] }** %_sorted4405
  %_load_ref4406 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_sorted4405
  %_call4407 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref4406)
  call void @print_string(i8* %_call4407)
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
