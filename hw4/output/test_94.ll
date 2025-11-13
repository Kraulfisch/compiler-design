; generated from: oatprograms/msort2.oat
target triple = "x86_64-unknown-linux"
@_string_hoist3638 = global [2 x i8] c" \00"
@_string_hoist3644 = global [2 x i8] c" \00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid3605 = alloca i64
  %_func_uid3607 = alloca { i64, [0 x i8*] }*
  %_a3631 = alloca { i64, [0 x i64] }*
  %_i3632 = alloca i64
  store i64 %argc, i64* %_func_uid3605
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid3607
  %_raw_array3609 = call i64* @oat_alloc_array(i64 10)
  %_array3610 = bitcast i64* %_raw_array3609 to { i64, [0 x i64] }*
  %_arr_init_ptr3611 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3610, i32 0, i32 1, i32 0
  store i64 126, i64* %_arr_init_ptr3611
  %_arr_init_ptr3613 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3610, i32 0, i32 1, i32 1
  store i64 125, i64* %_arr_init_ptr3613
  %_arr_init_ptr3615 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3610, i32 0, i32 1, i32 2
  store i64 124, i64* %_arr_init_ptr3615
  %_arr_init_ptr3617 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3610, i32 0, i32 1, i32 3
  store i64 123, i64* %_arr_init_ptr3617
  %_arr_init_ptr3619 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3610, i32 0, i32 1, i32 4
  store i64 122, i64* %_arr_init_ptr3619
  %_arr_init_ptr3621 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3610, i32 0, i32 1, i32 5
  store i64 121, i64* %_arr_init_ptr3621
  %_arr_init_ptr3623 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3610, i32 0, i32 1, i32 6
  store i64 120, i64* %_arr_init_ptr3623
  %_arr_init_ptr3625 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3610, i32 0, i32 1, i32 7
  store i64 119, i64* %_arr_init_ptr3625
  %_arr_init_ptr3627 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3610, i32 0, i32 1, i32 8
  store i64 118, i64* %_arr_init_ptr3627
  %_arr_init_ptr3629 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3610, i32 0, i32 1, i32 9
  store i64 117, i64* %_arr_init_ptr3629
  store { i64, [0 x i64] }* %_array3610, { i64, [0 x i64] }** %_a3631
  store i64 0, i64* %_i3632
  %_load_ref3633 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3631
  %_call3634 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref3633)
  call void @print_string(i8* %_call3634)
  %_load_ref3636 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3631
  call void @oat_mergesort({ i64, [0 x i64] }* %_load_ref3636, i64 0, i64 9)
  %_str_ptr3639 = getelementptr [2 x i8], [2 x i8]* @_string_hoist3638, i32 0, i32 0
  call void @print_string(i8* %_str_ptr3639)
  %_load_ref3641 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3631
  %_call3642 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref3641)
  call void @print_string(i8* %_call3642)
  %_str_ptr3645 = getelementptr [2 x i8], [2 x i8]* @_string_hoist3644, i32 0, i32 0
  call void @print_string(i8* %_str_ptr3645)
  %_load_val3647 = load i64, i64* %_i3632
  ret i64 %_load_val3647
}

define void @oat_mergesort({ i64, [0 x i64] }* %a, i64 %low, i64 %high) {
  %_func_uid3573 = alloca { i64, [0 x i64] }*
  %_func_uid3575 = alloca i64
  %_func_uid3577 = alloca i64
  %_mid3579 = alloca i64
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_func_uid3573
  store i64 %low, i64* %_func_uid3575
  store i64 %high, i64* %_func_uid3577
  store i64 0, i64* %_mid3579
  %_load_val3580 = load i64, i64* %_func_uid3575
  %_load_val3581 = load i64, i64* %_func_uid3577
  %_binop3582 = icmp slt i64 %_load_val3580, %_load_val3581
  br i1 %_binop3582, label %_lthen3602, label %_lelse3603
_lthen3602:
  %_load_val3583 = load i64, i64* %_func_uid3575
  %_load_val3584 = load i64, i64* %_func_uid3577
  %_binop3585 = add i64 %_load_val3583, %_load_val3584
  %_binop3586 = lshr i64 %_binop3585, 1
  store i64 %_binop3586, i64* %_mid3579
  %_load_ref3588 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3573
  %_load_val3589 = load i64, i64* %_func_uid3575
  %_load_val3590 = load i64, i64* %_mid3579
  call void @oat_mergesort({ i64, [0 x i64] }* %_load_ref3588, i64 %_load_val3589, i64 %_load_val3590)
  %_load_ref3592 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3573
  %_load_val3593 = load i64, i64* %_mid3579
  %_binop3594 = add i64 %_load_val3593, 1
  %_load_val3595 = load i64, i64* %_func_uid3577
  call void @oat_mergesort({ i64, [0 x i64] }* %_load_ref3592, i64 %_binop3594, i64 %_load_val3595)
  %_load_ref3597 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3573
  %_load_val3598 = load i64, i64* %_func_uid3575
  %_load_val3599 = load i64, i64* %_func_uid3577
  %_load_val3600 = load i64, i64* %_mid3579
  call void @merge({ i64, [0 x i64] }* %_load_ref3597, i64 %_load_val3598, i64 %_load_val3599, i64 %_load_val3600)
  br label %_lafter3604
_lelse3603:
  br label %_lafter3604
_lafter3604:
  ret void
}

define void @merge({ i64, [0 x i64] }* %a, i64 %low, i64 %high, i64 %mid) {
  %_func_uid3443 = alloca { i64, [0 x i64] }*
  %_func_uid3445 = alloca i64
  %_func_uid3447 = alloca i64
  %_func_uid3449 = alloca i64
  %_i3451 = alloca i64
  %_j3452 = alloca i64
  %_k3453 = alloca i64
  %_c3456 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_func_uid3443
  store i64 %low, i64* %_func_uid3445
  store i64 %high, i64* %_func_uid3447
  store i64 %mid, i64* %_func_uid3449
  store i64 0, i64* %_i3451
  store i64 0, i64* %_j3452
  store i64 0, i64* %_k3453
  %_raw_array3454 = call i64* @oat_alloc_array(i64 50)
  %_array3455 = bitcast i64* %_raw_array3454 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array3455, { i64, [0 x i64] }** %_c3456
  %_load_val3457 = load i64, i64* %_func_uid3445
  store i64 %_load_val3457, i64* %_i3451
  %_load_val3459 = load i64, i64* %_func_uid3449
  %_binop3460 = add i64 %_load_val3459, 1
  store i64 %_binop3460, i64* %_j3452
  %_load_val3462 = load i64, i64* %_func_uid3445
  store i64 %_load_val3462, i64* %_k3453
  br label %_lpre3511
_lpre3511:
  %_load_val3464 = load i64, i64* %_i3451
  %_load_val3465 = load i64, i64* %_func_uid3449
  %_binop3466 = icmp sle i64 %_load_val3464, %_load_val3465
  %_load_val3467 = load i64, i64* %_j3452
  %_load_val3468 = load i64, i64* %_func_uid3447
  %_binop3469 = icmp sle i64 %_load_val3467, %_load_val3468
  %_binop3470 = and i1 %_binop3466, %_binop3469
  br i1 %_binop3470, label %_lbody3512, label %_lpost3513
_lbody3512:
  %_load_ref3471 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3443
  %_load_val3472 = load i64, i64* %_i3451
  %_index_ptr3473 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3471, i32 0, i32 1, i64 %_load_val3472
  %_index_load3474 = load i64, i64* %_index_ptr3473
  %_load_ref3475 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3443
  %_load_val3476 = load i64, i64* %_j3452
  %_index_ptr3477 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3475, i32 0, i32 1, i64 %_load_val3476
  %_index_load3478 = load i64, i64* %_index_ptr3477
  %_binop3479 = icmp slt i64 %_index_load3474, %_index_load3478
  br i1 %_binop3479, label %_lthen3508, label %_lelse3509
_lthen3508:
  %_load_ref3480 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3456
  %_load_val3481 = load i64, i64* %_k3453
  %_load_ref3482 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3443
  %_load_val3483 = load i64, i64* %_i3451
  %_index_ptr3484 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3482, i32 0, i32 1, i64 %_load_val3483
  %_index_load3485 = load i64, i64* %_index_ptr3484
  %_assign_ptr3486 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3480, i32 0, i32 1, i64 %_load_val3481
  store i64 %_index_load3485, i64* %_assign_ptr3486
  %_load_val3488 = load i64, i64* %_k3453
  %_binop3489 = add i64 %_load_val3488, 1
  store i64 %_binop3489, i64* %_k3453
  %_load_val3491 = load i64, i64* %_i3451
  %_binop3492 = add i64 %_load_val3491, 1
  store i64 %_binop3492, i64* %_i3451
  br label %_lafter3510
_lelse3509:
  %_load_ref3494 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3456
  %_load_val3495 = load i64, i64* %_k3453
  %_load_ref3496 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3443
  %_load_val3497 = load i64, i64* %_j3452
  %_index_ptr3498 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3496, i32 0, i32 1, i64 %_load_val3497
  %_index_load3499 = load i64, i64* %_index_ptr3498
  %_assign_ptr3500 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3494, i32 0, i32 1, i64 %_load_val3495
  store i64 %_index_load3499, i64* %_assign_ptr3500
  %_load_val3502 = load i64, i64* %_k3453
  %_binop3503 = add i64 %_load_val3502, 1
  store i64 %_binop3503, i64* %_k3453
  %_load_val3505 = load i64, i64* %_j3452
  %_binop3506 = add i64 %_load_val3505, 1
  store i64 %_binop3506, i64* %_j3452
  br label %_lafter3510
_lafter3510:
  br label %_lpre3511
_lpost3513:
  br label %_lpre3531
_lpre3531:
  %_load_val3514 = load i64, i64* %_i3451
  %_load_val3515 = load i64, i64* %_func_uid3449
  %_binop3516 = icmp sle i64 %_load_val3514, %_load_val3515
  br i1 %_binop3516, label %_lbody3532, label %_lpost3533
_lbody3532:
  %_load_ref3517 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3456
  %_load_val3518 = load i64, i64* %_k3453
  %_load_ref3519 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3443
  %_load_val3520 = load i64, i64* %_i3451
  %_index_ptr3521 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3519, i32 0, i32 1, i64 %_load_val3520
  %_index_load3522 = load i64, i64* %_index_ptr3521
  %_assign_ptr3523 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3517, i32 0, i32 1, i64 %_load_val3518
  store i64 %_index_load3522, i64* %_assign_ptr3523
  %_load_val3525 = load i64, i64* %_k3453
  %_binop3526 = add i64 %_load_val3525, 1
  store i64 %_binop3526, i64* %_k3453
  %_load_val3528 = load i64, i64* %_i3451
  %_binop3529 = add i64 %_load_val3528, 1
  store i64 %_binop3529, i64* %_i3451
  br label %_lpre3531
_lpost3533:
  br label %_lpre3551
_lpre3551:
  %_load_val3534 = load i64, i64* %_j3452
  %_load_val3535 = load i64, i64* %_func_uid3447
  %_binop3536 = icmp sle i64 %_load_val3534, %_load_val3535
  br i1 %_binop3536, label %_lbody3552, label %_lpost3553
_lbody3552:
  %_load_ref3537 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3456
  %_load_val3538 = load i64, i64* %_k3453
  %_load_ref3539 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3443
  %_load_val3540 = load i64, i64* %_j3452
  %_index_ptr3541 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3539, i32 0, i32 1, i64 %_load_val3540
  %_index_load3542 = load i64, i64* %_index_ptr3541
  %_assign_ptr3543 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3537, i32 0, i32 1, i64 %_load_val3538
  store i64 %_index_load3542, i64* %_assign_ptr3543
  %_load_val3545 = load i64, i64* %_k3453
  %_binop3546 = add i64 %_load_val3545, 1
  store i64 %_binop3546, i64* %_k3453
  %_load_val3548 = load i64, i64* %_j3452
  %_binop3549 = add i64 %_load_val3548, 1
  store i64 %_binop3549, i64* %_j3452
  br label %_lpre3551
_lpost3553:
  %_load_val3554 = load i64, i64* %_func_uid3445
  store i64 %_load_val3554, i64* %_i3451
  br label %_lpre3570
_lpre3570:
  %_load_val3559 = load i64, i64* %_i3451
  %_load_val3560 = load i64, i64* %_k3453
  %_binop3561 = icmp slt i64 %_load_val3559, %_load_val3560
  br i1 %_binop3561, label %_lbody3571, label %_lpost3572
_lbody3571:
  %_load_ref3562 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3443
  %_load_val3563 = load i64, i64* %_i3451
  %_load_ref3564 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3456
  %_load_val3565 = load i64, i64* %_i3451
  %_index_ptr3566 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3564, i32 0, i32 1, i64 %_load_val3565
  %_index_load3567 = load i64, i64* %_index_ptr3566
  %_assign_ptr3568 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3562, i32 0, i32 1, i64 %_load_val3563
  store i64 %_index_load3567, i64* %_assign_ptr3568
  %_load_val3556 = load i64, i64* %_i3451
  %_binop3557 = add i64 %_load_val3556, 1
  store i64 %_binop3557, i64* %_i3451
  br label %_lpre3570
_lpost3572:
  ret void
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
