; generated from: oatprograms/run14.oat
target triple = "x86_64-unknown-linux"
define i64 @f({ i64, [0 x i64] }* %a) {
  %_func_uid1523 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_func_uid1523
  %_load_ref1525 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid1523
  %_index_ptr1526 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1525, i32 0, i32 1, i32 1
  %_index_load1527 = load i64, i64* %_index_ptr1526
  ret i64 %_index_load1527
}

define i64 @g(i64 %x) {
  %_func_uid1501 = alloca i64
  %_arr1505 = alloca { i64, [0 x i64] }*
  %_i1506 = alloca i64
  store i64 %x, i64* %_func_uid1501
  %_raw_array1503 = call i64* @oat_alloc_array(i64 3)
  %_array1504 = bitcast i64* %_raw_array1503 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array1504, { i64, [0 x i64] }** %_arr1505
  store i64 0, i64* %_i1506
  br label %_lpre1517
_lpre1517:
  %_load_val1510 = load i64, i64* %_i1506
  %_binop1511 = icmp slt i64 %_load_val1510, 3
  br i1 %_binop1511, label %_lbody1518, label %_lpost1519
_lbody1518:
  %_load_ref1512 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1505
  %_load_val1513 = load i64, i64* %_i1506
  %_load_val1514 = load i64, i64* %_func_uid1501
  %_assign_ptr1515 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1512, i32 0, i32 1, i64 %_load_val1513
  store i64 %_load_val1514, i64* %_assign_ptr1515
  %_load_val1507 = load i64, i64* %_i1506
  %_binop1508 = add i64 %_load_val1507, 1
  store i64 %_binop1508, i64* %_i1506
  br label %_lpre1517
_lpost1519:
  %_load_ref1520 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1505
  %_index_ptr1521 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1520, i32 0, i32 1, i32 1
  %_index_load1522 = load i64, i64* %_index_ptr1521
  ret i64 %_index_load1522
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1431 = alloca i64
  %_func_uid1433 = alloca { i64, [0 x i8*] }*
  %_a1437 = alloca { i64, [0 x i64] }*
  %_i1438 = alloca i64
  %_arr1454 = alloca { i64, [0 x i64] }*
  %_i1455 = alloca i64
  %_arr01473 = alloca { i64, [0 x i64] }*
  %_i1474 = alloca i64
  store i64 %argc, i64* %_func_uid1431
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1433
  %_raw_array1435 = call i64* @oat_alloc_array(i64 3)
  %_array1436 = bitcast i64* %_raw_array1435 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array1436, { i64, [0 x i64] }** %_a1437
  store i64 0, i64* %_i1438
  br label %_lpre1449
_lpre1449:
  %_load_val1442 = load i64, i64* %_i1438
  %_binop1443 = icmp slt i64 %_load_val1442, 3
  br i1 %_binop1443, label %_lbody1450, label %_lpost1451
_lbody1450:
  %_load_ref1444 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a1437
  %_load_val1445 = load i64, i64* %_i1438
  %_load_val1446 = load i64, i64* %_i1438
  %_assign_ptr1447 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1444, i32 0, i32 1, i64 %_load_val1445
  store i64 %_load_val1446, i64* %_assign_ptr1447
  %_load_val1439 = load i64, i64* %_i1438
  %_binop1440 = add i64 %_load_val1439, 1
  store i64 %_binop1440, i64* %_i1438
  br label %_lpre1449
_lpost1451:
  %_raw_array1452 = call i64* @oat_alloc_array(i64 4)
  %_array1453 = bitcast i64* %_raw_array1452 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array1453, { i64, [0 x i64] }** %_arr1454
  store i64 0, i64* %_i1455
  br label %_lpre1468
_lpre1468:
  %_load_val1459 = load i64, i64* %_i1455
  %_binop1460 = icmp slt i64 %_load_val1459, 4
  br i1 %_binop1460, label %_lbody1469, label %_lpost1470
_lbody1469:
  %_load_ref1461 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1454
  %_load_val1462 = load i64, i64* %_i1455
  %_load_val1463 = load i64, i64* %_i1455
  %_load_val1464 = load i64, i64* %_i1455
  %_binop1465 = mul i64 %_load_val1463, %_load_val1464
  %_assign_ptr1466 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1461, i32 0, i32 1, i64 %_load_val1462
  store i64 %_binop1465, i64* %_assign_ptr1466
  %_load_val1456 = load i64, i64* %_i1455
  %_binop1457 = add i64 %_load_val1456, 1
  store i64 %_binop1457, i64* %_i1455
  br label %_lpre1468
_lpost1470:
  %_raw_array1471 = call i64* @oat_alloc_array(i64 3)
  %_array1472 = bitcast i64* %_raw_array1471 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array1472, { i64, [0 x i64] }** %_arr01473
  store i64 0, i64* %_i1474
  br label %_lpre1486
_lpre1486:
  %_load_val1478 = load i64, i64* %_i1474
  %_binop1479 = icmp slt i64 %_load_val1478, 3
  br i1 %_binop1479, label %_lbody1487, label %_lpost1488
_lbody1487:
  %_load_ref1480 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr01473
  %_load_val1481 = load i64, i64* %_i1474
  %_load_val1482 = load i64, i64* %_i1474
  %_binop1483 = mul i64 2, %_load_val1482
  %_assign_ptr1484 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1480, i32 0, i32 1, i64 %_load_val1481
  store i64 %_binop1483, i64* %_assign_ptr1484
  %_load_val1475 = load i64, i64* %_i1474
  %_binop1476 = add i64 %_load_val1475, 1
  store i64 %_binop1476, i64* %_i1474
  br label %_lpre1486
_lpost1488:
  %_load_ref1489 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1454
  %_index_ptr1490 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1489, i32 0, i32 1, i32 3
  %_index_load1491 = load i64, i64* %_index_ptr1490
  %_load_ref1492 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a1437
  %_index_ptr1493 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1492, i32 0, i32 1, i32 1
  %_index_load1494 = load i64, i64* %_index_ptr1493
  %_binop1495 = add i64 %_index_load1491, %_index_load1494
  %_load_ref1496 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr01473
  %_call1497 = call i64 @f({ i64, [0 x i64] }* %_load_ref1496)
  %_binop1498 = add i64 %_binop1495, %_call1497
  %_call1499 = call i64 @g(i64 4)
  %_binop1500 = add i64 %_binop1498, %_call1499
  ret i64 %_binop1500
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
