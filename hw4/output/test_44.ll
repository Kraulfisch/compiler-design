; generated from: oatprograms/run39.oat
target triple = "x86_64-unknown-linux"
define i64 @f1(i64 %i) {
  %_func_uid781 = alloca i64
  store i64 %i, i64* %_func_uid781
  %_load_val783 = load i64, i64* %_func_uid781
  %_call784 = call i64 @f2(i64 %_load_val783)
  ret i64 %_call784
}

define i64 @f2(i64 %i) {
  %_func_uid777 = alloca i64
  store i64 %i, i64* %_func_uid777
  %_load_val779 = load i64, i64* %_func_uid777
  %_call780 = call i64 @f3(i64 %_load_val779)
  ret i64 %_call780
}

define i64 @f3(i64 %i) {
  %_func_uid773 = alloca i64
  store i64 %i, i64* %_func_uid773
  %_load_val775 = load i64, i64* %_func_uid773
  %_call776 = call i64 @f4(i64 %_load_val775)
  ret i64 %_call776
}

define i64 @f4(i64 %i) {
  %_func_uid769 = alloca i64
  store i64 %i, i64* %_func_uid769
  %_load_val771 = load i64, i64* %_func_uid769
  %_call772 = call i64 @f5(i64 %_load_val771)
  ret i64 %_call772
}

define i64 @f5(i64 %i) {
  %_func_uid765 = alloca i64
  store i64 %i, i64* %_func_uid765
  %_load_val767 = load i64, i64* %_func_uid765
  %_call768 = call i64 @f6(i64 %_load_val767)
  ret i64 %_call768
}

define i64 @f6(i64 %i) {
  %_func_uid761 = alloca i64
  store i64 %i, i64* %_func_uid761
  %_load_val763 = load i64, i64* %_func_uid761
  %_call764 = call i64 @f7(i64 %_load_val763)
  ret i64 %_call764
}

define i64 @f7(i64 %i) {
  %_func_uid757 = alloca i64
  store i64 %i, i64* %_func_uid757
  %_load_val759 = load i64, i64* %_func_uid757
  %_call760 = call i64 @f8(i64 %_load_val759)
  ret i64 %_call760
}

define i64 @f8(i64 %i) {
  %_func_uid753 = alloca i64
  store i64 %i, i64* %_func_uid753
  %_load_val755 = load i64, i64* %_func_uid753
  %_call756 = call i64 @f9(i64 %_load_val755)
  ret i64 %_call756
}

define i64 @f9(i64 %i) {
  %_func_uid750 = alloca i64
  store i64 %i, i64* %_func_uid750
  %_load_val752 = load i64, i64* %_func_uid750
  ret i64 %_load_val752
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid744 = alloca i64
  %_func_uid746 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid744
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid746
  %_load_val748 = load i64, i64* %_func_uid744
  %_call749 = call i64 @f1(i64 %_load_val748)
  ret i64 %_call749
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
