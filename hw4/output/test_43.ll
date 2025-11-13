; generated from: oatprograms/run38.oat
target triple = "x86_64-unknown-linux"
define i64 @f1() {
  %_call743 = call i64 @f2()
  ret i64 %_call743
}

define i64 @f2() {
  %_call742 = call i64 @f3()
  ret i64 %_call742
}

define i64 @f3() {
  %_call741 = call i64 @f4()
  ret i64 %_call741
}

define i64 @f4() {
  %_call740 = call i64 @f5()
  ret i64 %_call740
}

define i64 @f5() {
  %_call739 = call i64 @f6()
  ret i64 %_call739
}

define i64 @f6() {
  %_call738 = call i64 @f7()
  ret i64 %_call738
}

define i64 @f7() {
  %_call737 = call i64 @f8()
  ret i64 %_call737
}

define i64 @f8() {
  %_call736 = call i64 @f9()
  ret i64 %_call736
}

define i64 @f9() {
  ret i64 31
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid731 = alloca i64
  %_func_uid733 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid731
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid733
  %_call735 = call i64 @f1()
  ret i64 %_call735
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
