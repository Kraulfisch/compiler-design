; generated from: oatprograms/fibo.oat
target triple = "x86_64-unknown-linux"
define i64 @fibR(i64 %n) {
  %_func_uid4622 = alloca i64
  store i64 %n, i64* %_func_uid4622
  %_load_val4624 = load i64, i64* %_func_uid4622
  %_binop4625 = icmp eq i64 %_load_val4624, 0
  br i1 %_binop4625, label %_lthen4626, label %_lelse4627
_lthen4626:
  ret i64 0
_lelse4627:
  br label %_lafter4628
_lafter4628:
  %_load_val4629 = load i64, i64* %_func_uid4622
  %_binop4630 = icmp eq i64 %_load_val4629, 1
  br i1 %_binop4630, label %_lthen4631, label %_lelse4632
_lthen4631:
  ret i64 1
_lelse4632:
  br label %_lafter4633
_lafter4633:
  %_load_val4634 = load i64, i64* %_func_uid4622
  %_binop4635 = sub i64 %_load_val4634, 1
  %_call4636 = call i64 @fibR(i64 %_binop4635)
  %_load_val4637 = load i64, i64* %_func_uid4622
  %_binop4638 = sub i64 %_load_val4637, 2
  %_call4639 = call i64 @fibR(i64 %_binop4638)
  %_binop4640 = add i64 %_call4636, %_call4639
  ret i64 %_binop4640
}

define i64 @fibI(i64 %n) {
  %_func_uid4586 = alloca i64
  %_a4588 = alloca i64
  %_b4589 = alloca i64
  %_old4606 = alloca i64
  store i64 %n, i64* %_func_uid4586
  store i64 0, i64* %_a4588
  store i64 1, i64* %_b4589
  %_load_val4590 = load i64, i64* %_func_uid4586
  %_binop4591 = icmp eq i64 %_load_val4590, 0
  br i1 %_binop4591, label %_lthen4593, label %_lelse4594
_lthen4593:
  %_load_val4592 = load i64, i64* %_a4588
  ret i64 %_load_val4592
_lelse4594:
  br label %_lafter4595
_lafter4595:
  %_load_val4596 = load i64, i64* %_func_uid4586
  %_binop4597 = icmp eq i64 %_load_val4596, 1
  br i1 %_binop4597, label %_lthen4599, label %_lelse4600
_lthen4599:
  %_load_val4598 = load i64, i64* %_b4589
  ret i64 %_load_val4598
_lelse4600:
  br label %_lafter4601
_lafter4601:
  br label %_lpre4616
_lpre4616:
  %_load_val4602 = load i64, i64* %_func_uid4586
  %_binop4603 = sub i64 %_load_val4602, 2
  %_binop4604 = icmp sgt i64 %_binop4603, 0
  br i1 %_binop4604, label %_lbody4617, label %_lpost4618
_lbody4617:
  %_load_val4605 = load i64, i64* %_b4589
  store i64 %_load_val4605, i64* %_old4606
  %_load_val4607 = load i64, i64* %_b4589
  %_load_val4608 = load i64, i64* %_a4588
  %_binop4609 = add i64 %_load_val4607, %_load_val4608
  store i64 %_binop4609, i64* %_b4589
  %_load_val4611 = load i64, i64* %_old4606
  store i64 %_load_val4611, i64* %_a4588
  %_load_val4613 = load i64, i64* %_func_uid4586
  %_binop4614 = sub i64 %_load_val4613, 1
  store i64 %_binop4614, i64* %_func_uid4586
  br label %_lpre4616
_lpost4618:
  %_load_val4619 = load i64, i64* %_a4588
  %_load_val4620 = load i64, i64* %_b4589
  %_binop4621 = add i64 %_load_val4619, %_load_val4620
  ret i64 %_binop4621
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid4571 = alloca i64
  %_func_uid4573 = alloca { i64, [0 x i8*] }*
  %_val4575 = alloca i64
  store i64 %argc, i64* %_func_uid4571
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid4573
  store i64 1, i64* %_val4575
  %_call4576 = call i64 @fibR(i64 12)
  %_binop4577 = icmp eq i64 %_call4576, 144
  %_call4578 = call i64 @fibI(i64 12)
  %_binop4579 = icmp eq i64 %_call4578, 144
  %_binop4580 = and i1 %_binop4577, %_binop4579
  br i1 %_binop4580, label %_lthen4582, label %_lelse4583
_lthen4582:
  store i64 0, i64* %_val4575
  br label %_lafter4584
_lelse4583:
  br label %_lafter4584
_lafter4584:
  %_load_val4585 = load i64, i64* %_val4575
  ret i64 %_load_val4585
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
