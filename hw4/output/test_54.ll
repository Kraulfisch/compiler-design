; generated from: oatprograms/run2.oat
target triple = "x86_64-unknown-linux"
@i = global i64 0

define i64 @f(i64 %x, i64 %y) {
  %_func_uid1069 = alloca i64
  %_func_uid1071 = alloca i64
  %_r1073 = alloca i64
  store i64 %x, i64* %_func_uid1069
  store i64 %y, i64* %_func_uid1071
  store i64 0, i64* %_r1073
  %_load_val1074 = load i64, i64* %_func_uid1069
  %_binop1075 = icmp sge i64 %_load_val1074, 1
  br i1 %_binop1075, label %_lthen1086, label %_lelse1087
_lthen1086:
  %_load_val1076 = load i64, i64* %_func_uid1069
  %_binop1077 = sub i64 %_load_val1076, 1
  %_load_val1078 = load i64, i64* %_func_uid1071
  %_call1079 = call i64 @f(i64 %_binop1077, i64 %_load_val1078)
  %_binop1080 = add i64 1, %_call1079
  store i64 %_binop1080, i64* %_r1073
  br label %_lafter1088
_lelse1087:
  %_load_val1082 = load i64, i64* %_func_uid1069
  %_load_val1083 = load i64, i64* %_func_uid1071
  %_binop1084 = add i64 %_load_val1082, %_load_val1083
  store i64 %_binop1084, i64* %_r1073
  br label %_lafter1088
_lafter1088:
  %_load_val1089 = load i64, i64* %_r1073
  ret i64 %_load_val1089
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1058 = alloca i64
  %_func_uid1060 = alloca { i64, [0 x i8*] }*
  %_x1062 = alloca i64
  %_y1063 = alloca i64
  store i64 %argc, i64* %_func_uid1058
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1060
  store i64 3, i64* %_x1062
  store i64 3, i64* %_y1063
  %_load_val1064 = load i64, i64* %_x1062
  %_load_val1065 = load i64, i64* %_y1063
  %_call1066 = call i64 @f(i64 %_load_val1064, i64 %_load_val1065)
  %_load_val1067 = load i64, i64* @i
  %_binop1068 = add i64 %_call1066, %_load_val1067
  ret i64 %_binop1068
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
