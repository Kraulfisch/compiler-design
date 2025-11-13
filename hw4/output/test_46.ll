; generated from: oatprograms/run41.oat
target triple = "x86_64-unknown-linux"
define i64 @f(i64 %x1, i64 %x2, i64 %x3, i64 %x4, i64 %x5, i64 %x6, i64 %x7, i64 %x8) {
  %_func_uid803 = alloca i64
  %_func_uid805 = alloca i64
  %_func_uid807 = alloca i64
  %_func_uid809 = alloca i64
  %_func_uid811 = alloca i64
  %_func_uid813 = alloca i64
  %_func_uid815 = alloca i64
  %_func_uid817 = alloca i64
  store i64 %x1, i64* %_func_uid803
  store i64 %x2, i64* %_func_uid805
  store i64 %x3, i64* %_func_uid807
  store i64 %x4, i64* %_func_uid809
  store i64 %x5, i64* %_func_uid811
  store i64 %x6, i64* %_func_uid813
  store i64 %x7, i64* %_func_uid815
  store i64 %x8, i64* %_func_uid817
  %_load_val819 = load i64, i64* %_func_uid803
  %_load_val820 = load i64, i64* %_func_uid805
  %_binop821 = add i64 %_load_val819, %_load_val820
  %_load_val822 = load i64, i64* %_func_uid807
  %_binop823 = add i64 %_binop821, %_load_val822
  %_load_val824 = load i64, i64* %_func_uid809
  %_binop825 = add i64 %_binop823, %_load_val824
  %_load_val826 = load i64, i64* %_func_uid811
  %_binop827 = add i64 %_binop825, %_load_val826
  %_load_val828 = load i64, i64* %_func_uid813
  %_binop829 = add i64 %_binop827, %_load_val828
  %_load_val830 = load i64, i64* %_func_uid815
  %_binop831 = add i64 %_binop829, %_load_val830
  %_load_val832 = load i64, i64* %_func_uid817
  %_binop833 = add i64 %_binop831, %_load_val832
  ret i64 %_binop833
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid795 = alloca i64
  %_func_uid797 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid795
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid797
  %_uop799 = sub i64 0, 5
  %_uop800 = sub i64 0, 4
  %_uop801 = sub i64 0, 3
  %_call802 = call i64 @f(i64 1, i64 2, i64 3, i64 4, i64 5, i64 %_uop799, i64 %_uop800, i64 %_uop801)
  ret i64 %_call802
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
