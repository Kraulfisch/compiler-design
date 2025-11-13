; generated from: oatprograms/fac.oat
target triple = "x86_64-unknown-linux"
define i64 @f(i64 %i) {
  %_func_uid2953 = alloca i64
  %_r2955 = alloca i64
  store i64 %i, i64* %_func_uid2953
  store i64 0, i64* %_r2955
  %_load_val2956 = load i64, i64* %_func_uid2953
  %_binop2957 = icmp eq i64 %_load_val2956, 0
  br i1 %_binop2957, label %_lthen2965, label %_lelse2966
_lthen2965:
  store i64 1, i64* %_r2955
  br label %_lafter2967
_lelse2966:
  %_load_val2959 = load i64, i64* %_func_uid2953
  %_load_val2960 = load i64, i64* %_func_uid2953
  %_binop2961 = sub i64 %_load_val2960, 1
  %_call2962 = call i64 @f(i64 %_binop2961)
  %_binop2963 = mul i64 %_load_val2959, %_call2962
  store i64 %_binop2963, i64* %_r2955
  br label %_lafter2967
_lafter2967:
  %_load_val2968 = load i64, i64* %_r2955
  ret i64 %_load_val2968
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2948 = alloca i64
  %_func_uid2950 = alloca { i64, [0 x i8*] }*
  store i64 %argc, i64* %_func_uid2948
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2950
  %_call2952 = call i64 @f(i64 5)
  ret i64 %_call2952
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
