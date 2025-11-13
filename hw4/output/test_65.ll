; generated from: oatprograms/run15.oat
target triple = "x86_64-unknown-linux"
define i64 @f({ i64, [0 x { i64, [0 x i64] }*] }* %a) {
  %_func_uid1751 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x { i64, [0 x i64] }*] }* %a, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid1751
  %_load_ref1753 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid1751
  %_index_ptr1754 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1753, i32 0, i32 1, i32 1
  %_index_load1755 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1754
  %_index_ptr1756 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load1755, i32 0, i32 1, i32 1
  %_index_load1757 = load i64, i64* %_index_ptr1756
  ret i64 %_index_load1757
}

define i64 @g(i64 %x) {
  %_func_uid1702 = alloca i64
  %_arr1745 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %x, i64* %_func_uid1702
  %_raw_array1704 = call i64* @oat_alloc_array(i64 3)
  %_array1705 = bitcast i64* %_raw_array1704 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1706 = call i64* @oat_alloc_array(i64 3)
  %_array1707 = bitcast i64* %_raw_array1706 to { i64, [0 x i64] }*
  %_load_val1708 = load i64, i64* %_func_uid1702
  %_arr_init_ptr1709 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1707, i32 0, i32 1, i32 0
  store i64 %_load_val1708, i64* %_arr_init_ptr1709
  %_load_val1711 = load i64, i64* %_func_uid1702
  %_arr_init_ptr1712 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1707, i32 0, i32 1, i32 1
  store i64 %_load_val1711, i64* %_arr_init_ptr1712
  %_load_val1714 = load i64, i64* %_func_uid1702
  %_arr_init_ptr1715 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1707, i32 0, i32 1, i32 2
  store i64 %_load_val1714, i64* %_arr_init_ptr1715
  %_arr_init_ptr1717 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1705, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1707, { i64, [0 x i64] }** %_arr_init_ptr1717
  %_raw_array1719 = call i64* @oat_alloc_array(i64 3)
  %_array1720 = bitcast i64* %_raw_array1719 to { i64, [0 x i64] }*
  %_load_val1721 = load i64, i64* %_func_uid1702
  %_arr_init_ptr1722 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1720, i32 0, i32 1, i32 0
  store i64 %_load_val1721, i64* %_arr_init_ptr1722
  %_load_val1724 = load i64, i64* %_func_uid1702
  %_arr_init_ptr1725 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1720, i32 0, i32 1, i32 1
  store i64 %_load_val1724, i64* %_arr_init_ptr1725
  %_load_val1727 = load i64, i64* %_func_uid1702
  %_arr_init_ptr1728 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1720, i32 0, i32 1, i32 2
  store i64 %_load_val1727, i64* %_arr_init_ptr1728
  %_arr_init_ptr1730 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1705, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1720, { i64, [0 x i64] }** %_arr_init_ptr1730
  %_raw_array1732 = call i64* @oat_alloc_array(i64 3)
  %_array1733 = bitcast i64* %_raw_array1732 to { i64, [0 x i64] }*
  %_load_val1734 = load i64, i64* %_func_uid1702
  %_arr_init_ptr1735 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1733, i32 0, i32 1, i32 0
  store i64 %_load_val1734, i64* %_arr_init_ptr1735
  %_load_val1737 = load i64, i64* %_func_uid1702
  %_arr_init_ptr1738 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1733, i32 0, i32 1, i32 1
  store i64 %_load_val1737, i64* %_arr_init_ptr1738
  %_load_val1740 = load i64, i64* %_func_uid1702
  %_arr_init_ptr1741 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1733, i32 0, i32 1, i32 2
  store i64 %_load_val1740, i64* %_arr_init_ptr1741
  %_arr_init_ptr1743 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1705, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array1733, { i64, [0 x i64] }** %_arr_init_ptr1743
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1705, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1745
  %_load_ref1746 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1745
  %_index_ptr1747 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1746, i32 0, i32 1, i32 1
  %_index_load1748 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1747
  %_index_ptr1749 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load1748, i32 0, i32 1, i32 1
  %_index_load1750 = load i64, i64* %_index_ptr1749
  ret i64 %_index_load1750
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1528 = alloca i64
  %_func_uid1530 = alloca { i64, [0 x i8*] }*
  %_a1564 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_arr1643 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_arr01685 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %argc, i64* %_func_uid1528
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1530
  %_raw_array1532 = call i64* @oat_alloc_array(i64 3)
  %_array1533 = bitcast i64* %_raw_array1532 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1534 = call i64* @oat_alloc_array(i64 3)
  %_array1535 = bitcast i64* %_raw_array1534 to { i64, [0 x i64] }*
  %_arr_init_ptr1536 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1535, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr1536
  %_arr_init_ptr1538 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1535, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr1538
  %_arr_init_ptr1540 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1535, i32 0, i32 1, i32 2
  store i64 2, i64* %_arr_init_ptr1540
  %_arr_init_ptr1542 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1533, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1535, { i64, [0 x i64] }** %_arr_init_ptr1542
  %_raw_array1544 = call i64* @oat_alloc_array(i64 3)
  %_array1545 = bitcast i64* %_raw_array1544 to { i64, [0 x i64] }*
  %_arr_init_ptr1546 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1545, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr1546
  %_arr_init_ptr1548 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1545, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr1548
  %_arr_init_ptr1550 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1545, i32 0, i32 1, i32 2
  store i64 2, i64* %_arr_init_ptr1550
  %_arr_init_ptr1552 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1533, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1545, { i64, [0 x i64] }** %_arr_init_ptr1552
  %_raw_array1554 = call i64* @oat_alloc_array(i64 3)
  %_array1555 = bitcast i64* %_raw_array1554 to { i64, [0 x i64] }*
  %_arr_init_ptr1556 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1555, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr1556
  %_arr_init_ptr1558 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1555, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr1558
  %_arr_init_ptr1560 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1555, i32 0, i32 1, i32 2
  store i64 2, i64* %_arr_init_ptr1560
  %_arr_init_ptr1562 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1533, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array1555, { i64, [0 x i64] }** %_arr_init_ptr1562
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1533, { i64, [0 x { i64, [0 x i64] }*] }** %_a1564
  %_raw_array1565 = call i64* @oat_alloc_array(i64 4)
  %_array1566 = bitcast i64* %_raw_array1565 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1567 = call i64* @oat_alloc_array(i64 5)
  %_array1568 = bitcast i64* %_raw_array1567 to { i64, [0 x i64] }*
  %_binop1569 = mul i64 0, 0
  %_arr_init_ptr1570 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1568, i32 0, i32 1, i32 0
  store i64 %_binop1569, i64* %_arr_init_ptr1570
  %_binop1572 = mul i64 0, 1
  %_arr_init_ptr1573 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1568, i32 0, i32 1, i32 1
  store i64 %_binop1572, i64* %_arr_init_ptr1573
  %_binop1575 = mul i64 0, 2
  %_arr_init_ptr1576 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1568, i32 0, i32 1, i32 2
  store i64 %_binop1575, i64* %_arr_init_ptr1576
  %_binop1578 = mul i64 0, 3
  %_arr_init_ptr1579 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1568, i32 0, i32 1, i32 3
  store i64 %_binop1578, i64* %_arr_init_ptr1579
  %_binop1581 = mul i64 0, 4
  %_arr_init_ptr1582 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1568, i32 0, i32 1, i32 4
  store i64 %_binop1581, i64* %_arr_init_ptr1582
  %_arr_init_ptr1584 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1566, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1568, { i64, [0 x i64] }** %_arr_init_ptr1584
  %_raw_array1586 = call i64* @oat_alloc_array(i64 5)
  %_array1587 = bitcast i64* %_raw_array1586 to { i64, [0 x i64] }*
  %_binop1588 = mul i64 1, 0
  %_arr_init_ptr1589 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1587, i32 0, i32 1, i32 0
  store i64 %_binop1588, i64* %_arr_init_ptr1589
  %_binop1591 = mul i64 1, 1
  %_arr_init_ptr1592 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1587, i32 0, i32 1, i32 1
  store i64 %_binop1591, i64* %_arr_init_ptr1592
  %_binop1594 = mul i64 1, 2
  %_arr_init_ptr1595 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1587, i32 0, i32 1, i32 2
  store i64 %_binop1594, i64* %_arr_init_ptr1595
  %_binop1597 = mul i64 1, 3
  %_arr_init_ptr1598 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1587, i32 0, i32 1, i32 3
  store i64 %_binop1597, i64* %_arr_init_ptr1598
  %_binop1600 = mul i64 1, 4
  %_arr_init_ptr1601 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1587, i32 0, i32 1, i32 4
  store i64 %_binop1600, i64* %_arr_init_ptr1601
  %_arr_init_ptr1603 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1566, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1587, { i64, [0 x i64] }** %_arr_init_ptr1603
  %_raw_array1605 = call i64* @oat_alloc_array(i64 5)
  %_array1606 = bitcast i64* %_raw_array1605 to { i64, [0 x i64] }*
  %_binop1607 = mul i64 2, 0
  %_arr_init_ptr1608 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1606, i32 0, i32 1, i32 0
  store i64 %_binop1607, i64* %_arr_init_ptr1608
  %_binop1610 = mul i64 2, 1
  %_arr_init_ptr1611 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1606, i32 0, i32 1, i32 1
  store i64 %_binop1610, i64* %_arr_init_ptr1611
  %_binop1613 = mul i64 2, 2
  %_arr_init_ptr1614 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1606, i32 0, i32 1, i32 2
  store i64 %_binop1613, i64* %_arr_init_ptr1614
  %_binop1616 = mul i64 2, 3
  %_arr_init_ptr1617 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1606, i32 0, i32 1, i32 3
  store i64 %_binop1616, i64* %_arr_init_ptr1617
  %_binop1619 = mul i64 2, 4
  %_arr_init_ptr1620 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1606, i32 0, i32 1, i32 4
  store i64 %_binop1619, i64* %_arr_init_ptr1620
  %_arr_init_ptr1622 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1566, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array1606, { i64, [0 x i64] }** %_arr_init_ptr1622
  %_raw_array1624 = call i64* @oat_alloc_array(i64 5)
  %_array1625 = bitcast i64* %_raw_array1624 to { i64, [0 x i64] }*
  %_binop1626 = mul i64 3, 0
  %_arr_init_ptr1627 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1625, i32 0, i32 1, i32 0
  store i64 %_binop1626, i64* %_arr_init_ptr1627
  %_binop1629 = mul i64 3, 1
  %_arr_init_ptr1630 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1625, i32 0, i32 1, i32 1
  store i64 %_binop1629, i64* %_arr_init_ptr1630
  %_binop1632 = mul i64 3, 2
  %_arr_init_ptr1633 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1625, i32 0, i32 1, i32 2
  store i64 %_binop1632, i64* %_arr_init_ptr1633
  %_binop1635 = mul i64 3, 3
  %_arr_init_ptr1636 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1625, i32 0, i32 1, i32 3
  store i64 %_binop1635, i64* %_arr_init_ptr1636
  %_binop1638 = mul i64 3, 4
  %_arr_init_ptr1639 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1625, i32 0, i32 1, i32 4
  store i64 %_binop1638, i64* %_arr_init_ptr1639
  %_arr_init_ptr1641 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1566, i32 0, i32 1, i32 3
  store { i64, [0 x i64] }* %_array1625, { i64, [0 x i64] }** %_arr_init_ptr1641
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1566, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1643
  %_raw_array1644 = call i64* @oat_alloc_array(i64 3)
  %_array1645 = bitcast i64* %_raw_array1644 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1646 = call i64* @oat_alloc_array(i64 3)
  %_array1647 = bitcast i64* %_raw_array1646 to { i64, [0 x i64] }*
  %_binop1648 = mul i64 0, 0
  %_arr_init_ptr1649 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1647, i32 0, i32 1, i32 0
  store i64 %_binop1648, i64* %_arr_init_ptr1649
  %_binop1651 = mul i64 0, 1
  %_arr_init_ptr1652 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1647, i32 0, i32 1, i32 1
  store i64 %_binop1651, i64* %_arr_init_ptr1652
  %_binop1654 = mul i64 0, 2
  %_arr_init_ptr1655 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1647, i32 0, i32 1, i32 2
  store i64 %_binop1654, i64* %_arr_init_ptr1655
  %_arr_init_ptr1657 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1645, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1647, { i64, [0 x i64] }** %_arr_init_ptr1657
  %_raw_array1659 = call i64* @oat_alloc_array(i64 3)
  %_array1660 = bitcast i64* %_raw_array1659 to { i64, [0 x i64] }*
  %_binop1661 = mul i64 1, 0
  %_arr_init_ptr1662 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1660, i32 0, i32 1, i32 0
  store i64 %_binop1661, i64* %_arr_init_ptr1662
  %_binop1664 = mul i64 1, 1
  %_arr_init_ptr1665 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1660, i32 0, i32 1, i32 1
  store i64 %_binop1664, i64* %_arr_init_ptr1665
  %_binop1667 = mul i64 1, 2
  %_arr_init_ptr1668 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1660, i32 0, i32 1, i32 2
  store i64 %_binop1667, i64* %_arr_init_ptr1668
  %_arr_init_ptr1670 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1645, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1660, { i64, [0 x i64] }** %_arr_init_ptr1670
  %_raw_array1672 = call i64* @oat_alloc_array(i64 3)
  %_array1673 = bitcast i64* %_raw_array1672 to { i64, [0 x i64] }*
  %_binop1674 = mul i64 2, 0
  %_arr_init_ptr1675 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1673, i32 0, i32 1, i32 0
  store i64 %_binop1674, i64* %_arr_init_ptr1675
  %_binop1677 = mul i64 2, 1
  %_arr_init_ptr1678 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1673, i32 0, i32 1, i32 1
  store i64 %_binop1677, i64* %_arr_init_ptr1678
  %_binop1680 = mul i64 2, 2
  %_arr_init_ptr1681 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1673, i32 0, i32 1, i32 2
  store i64 %_binop1680, i64* %_arr_init_ptr1681
  %_arr_init_ptr1683 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1645, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array1673, { i64, [0 x i64] }** %_arr_init_ptr1683
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1645, { i64, [0 x { i64, [0 x i64] }*] }** %_arr01685
  %_load_ref1686 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr1643
  %_index_ptr1687 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1686, i32 0, i32 1, i32 3
  %_index_load1688 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1687
  %_index_ptr1689 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load1688, i32 0, i32 1, i32 4
  %_index_load1690 = load i64, i64* %_index_ptr1689
  %_load_ref1691 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a1564
  %_index_ptr1692 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1691, i32 0, i32 1, i32 1
  %_index_load1693 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1692
  %_index_ptr1694 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load1693, i32 0, i32 1, i32 2
  %_index_load1695 = load i64, i64* %_index_ptr1694
  %_binop1696 = add i64 %_index_load1690, %_index_load1695
  %_load_ref1697 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr01685
  %_call1698 = call i64 @f({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1697)
  %_binop1699 = add i64 %_binop1696, %_call1698
  %_call1700 = call i64 @g(i64 4)
  %_binop1701 = add i64 %_binop1699, %_call1700
  ret i64 %_binop1701
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
