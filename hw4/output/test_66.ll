; generated from: oatprograms/run16.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1758 = alloca i64
  %_func_uid1760 = alloca { i64, [0 x i8*] }*
  %_x1762 = alloca i64
  %_a1822 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_b1824 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %argc, i64* %_func_uid1758
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1760
  store i64 10, i64* %_x1762
  %_raw_array1763 = call i64* @oat_alloc_array(i64 3)
  %_array1764 = bitcast i64* %_raw_array1763 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1765 = call i64* @oat_alloc_array(i64 3)
  %_array1766 = bitcast i64* %_raw_array1765 to { i64, [0 x i64] }*
  %_load_val1767 = load i64, i64* %_x1762
  %_binop1768 = add i64 %_load_val1767, 0
  %_binop1769 = add i64 %_binop1768, 0
  %_arr_init_ptr1770 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1766, i32 0, i32 1, i32 0
  store i64 %_binop1769, i64* %_arr_init_ptr1770
  %_load_val1772 = load i64, i64* %_x1762
  %_binop1773 = add i64 %_load_val1772, 0
  %_binop1774 = add i64 %_binop1773, 1
  %_arr_init_ptr1775 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1766, i32 0, i32 1, i32 1
  store i64 %_binop1774, i64* %_arr_init_ptr1775
  %_load_val1777 = load i64, i64* %_x1762
  %_binop1778 = add i64 %_load_val1777, 0
  %_binop1779 = add i64 %_binop1778, 2
  %_arr_init_ptr1780 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1766, i32 0, i32 1, i32 2
  store i64 %_binop1779, i64* %_arr_init_ptr1780
  %_arr_init_ptr1782 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1764, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1766, { i64, [0 x i64] }** %_arr_init_ptr1782
  %_raw_array1784 = call i64* @oat_alloc_array(i64 3)
  %_array1785 = bitcast i64* %_raw_array1784 to { i64, [0 x i64] }*
  %_load_val1786 = load i64, i64* %_x1762
  %_binop1787 = add i64 %_load_val1786, 1
  %_binop1788 = add i64 %_binop1787, 0
  %_arr_init_ptr1789 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1785, i32 0, i32 1, i32 0
  store i64 %_binop1788, i64* %_arr_init_ptr1789
  %_load_val1791 = load i64, i64* %_x1762
  %_binop1792 = add i64 %_load_val1791, 1
  %_binop1793 = add i64 %_binop1792, 1
  %_arr_init_ptr1794 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1785, i32 0, i32 1, i32 1
  store i64 %_binop1793, i64* %_arr_init_ptr1794
  %_load_val1796 = load i64, i64* %_x1762
  %_binop1797 = add i64 %_load_val1796, 1
  %_binop1798 = add i64 %_binop1797, 2
  %_arr_init_ptr1799 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1785, i32 0, i32 1, i32 2
  store i64 %_binop1798, i64* %_arr_init_ptr1799
  %_arr_init_ptr1801 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1764, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1785, { i64, [0 x i64] }** %_arr_init_ptr1801
  %_raw_array1803 = call i64* @oat_alloc_array(i64 3)
  %_array1804 = bitcast i64* %_raw_array1803 to { i64, [0 x i64] }*
  %_load_val1805 = load i64, i64* %_x1762
  %_binop1806 = add i64 %_load_val1805, 2
  %_binop1807 = add i64 %_binop1806, 0
  %_arr_init_ptr1808 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1804, i32 0, i32 1, i32 0
  store i64 %_binop1807, i64* %_arr_init_ptr1808
  %_load_val1810 = load i64, i64* %_x1762
  %_binop1811 = add i64 %_load_val1810, 2
  %_binop1812 = add i64 %_binop1811, 1
  %_arr_init_ptr1813 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1804, i32 0, i32 1, i32 1
  store i64 %_binop1812, i64* %_arr_init_ptr1813
  %_load_val1815 = load i64, i64* %_x1762
  %_binop1816 = add i64 %_load_val1815, 2
  %_binop1817 = add i64 %_binop1816, 2
  %_arr_init_ptr1818 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1804, i32 0, i32 1, i32 2
  store i64 %_binop1817, i64* %_arr_init_ptr1818
  %_arr_init_ptr1820 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1764, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array1804, { i64, [0 x i64] }** %_arr_init_ptr1820
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1764, { i64, [0 x { i64, [0 x i64] }*] }** %_a1822
  %_load_ref1823 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a1822
  store { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1823, { i64, [0 x { i64, [0 x i64] }*] }** %_b1824
  %_load_ref1825 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b1824
  %_index_ptr1826 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1825, i32 0, i32 1, i32 2
  %_index_load1827 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1826
  %_index_ptr1828 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load1827, i32 0, i32 1, i32 1
  %_index_load1829 = load i64, i64* %_index_ptr1828
  ret i64 %_index_load1829
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
