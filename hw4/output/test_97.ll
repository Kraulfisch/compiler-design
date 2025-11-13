; generated from: oatprograms/binary_search.oat
target triple = "x86_64-unknown-linux"
@_string_hoist4082 = global [9 x i8] c"Correct!\00"

define i64 @euclid_division(i64 %numerator, i64 %denominator) {
  %_func_uid4137 = alloca i64
  %_func_uid4139 = alloca i64
  %_quotient4151 = alloca i64
  %_remainder4153 = alloca i64
  store i64 %numerator, i64* %_func_uid4137
  store i64 %denominator, i64* %_func_uid4139
  %_load_val4141 = load i64, i64* %_func_uid4139
  %_binop4142 = icmp slt i64 %_load_val4141, 0
  br i1 %_binop4142, label %_lthen4148, label %_lelse4149
_lthen4148:
  %_load_val4143 = load i64, i64* %_func_uid4137
  %_load_val4144 = load i64, i64* %_func_uid4139
  %_uop4145 = sub i64 0, %_load_val4144
  %_call4146 = call i64 @euclid_division(i64 %_load_val4143, i64 %_uop4145)
  %_uop4147 = sub i64 0, %_call4146
  ret i64 %_uop4147
_lelse4149:
  br label %_lafter4150
_lafter4150:
  store i64 0, i64* %_quotient4151
  %_load_val4152 = load i64, i64* %_func_uid4137
  store i64 %_load_val4152, i64* %_remainder4153
  %_load_val4154 = load i64, i64* %_func_uid4137
  %_binop4155 = icmp slt i64 %_load_val4154, 0
  br i1 %_binop4155, label %_lthen4182, label %_lelse4183
_lthen4182:
  %_load_val4156 = load i64, i64* %_func_uid4137
  %_uop4157 = sub i64 0, %_load_val4156
  store i64 %_uop4157, i64* %_remainder4153
  br label %_lpre4169
_lpre4169:
  %_load_val4159 = load i64, i64* %_remainder4153
  %_load_val4160 = load i64, i64* %_func_uid4139
  %_binop4161 = icmp sge i64 %_load_val4159, %_load_val4160
  br i1 %_binop4161, label %_lbody4170, label %_lpost4171
_lbody4170:
  %_load_val4162 = load i64, i64* %_quotient4151
  %_binop4163 = add i64 %_load_val4162, 1
  store i64 %_binop4163, i64* %_quotient4151
  %_load_val4165 = load i64, i64* %_remainder4153
  %_load_val4166 = load i64, i64* %_func_uid4139
  %_binop4167 = sub i64 %_load_val4165, %_load_val4166
  store i64 %_binop4167, i64* %_remainder4153
  br label %_lpre4169
_lpost4171:
  %_load_val4172 = load i64, i64* %_remainder4153
  %_binop4173 = icmp eq i64 %_load_val4172, 0
  br i1 %_binop4173, label %_lthen4179, label %_lelse4180
_lthen4179:
  %_load_val4174 = load i64, i64* %_quotient4151
  %_uop4175 = sub i64 0, %_load_val4174
  ret i64 %_uop4175
_lelse4180:
  %_load_val4176 = load i64, i64* %_quotient4151
  %_uop4177 = sub i64 0, %_load_val4176
  %_binop4178 = sub i64 %_uop4177, 1
  ret i64 %_binop4178
_lafter4181:
  br label %_lafter4184
_lelse4183:
  br label %_lafter4184
_lafter4184:
  br label %_lpre4195
_lpre4195:
  %_load_val4185 = load i64, i64* %_remainder4153
  %_load_val4186 = load i64, i64* %_func_uid4139
  %_binop4187 = icmp sge i64 %_load_val4185, %_load_val4186
  br i1 %_binop4187, label %_lbody4196, label %_lpost4197
_lbody4196:
  %_load_val4188 = load i64, i64* %_quotient4151
  %_binop4189 = add i64 %_load_val4188, 1
  store i64 %_binop4189, i64* %_quotient4151
  %_load_val4191 = load i64, i64* %_remainder4153
  %_load_val4192 = load i64, i64* %_func_uid4139
  %_binop4193 = sub i64 %_load_val4191, %_load_val4192
  store i64 %_binop4193, i64* %_remainder4153
  br label %_lpre4195
_lpost4197:
  %_load_val4198 = load i64, i64* %_quotient4151
  ret i64 %_load_val4198
}

define i1 @binary_search({ i64, [0 x i64] }* %input, i64 %key, i64 %min, i64 %max) {
  %_func_uid4088 = alloca { i64, [0 x i64] }*
  %_func_uid4090 = alloca i64
  %_func_uid4092 = alloca i64
  %_func_uid4094 = alloca i64
  %_midpt4106 = alloca i64
  store { i64, [0 x i64] }* %input, { i64, [0 x i64] }** %_func_uid4088
  store i64 %key, i64* %_func_uid4090
  store i64 %min, i64* %_func_uid4092
  store i64 %max, i64* %_func_uid4094
  %_load_val4096 = load i64, i64* %_func_uid4094
  %_load_val4097 = load i64, i64* %_func_uid4092
  %_binop4098 = icmp slt i64 %_load_val4096, %_load_val4097
  br i1 %_binop4098, label %_lthen4099, label %_lelse4100
_lthen4099:
  ret i1 0
_lelse4100:
  br label %_lafter4101
_lafter4101:
  %_load_val4102 = load i64, i64* %_func_uid4094
  %_load_val4103 = load i64, i64* %_func_uid4092
  %_binop4104 = add i64 %_load_val4102, %_load_val4103
  %_call4105 = call i64 @euclid_division(i64 %_binop4104, i64 2)
  store i64 %_call4105, i64* %_midpt4106
  %_load_ref4107 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4088
  %_load_val4108 = load i64, i64* %_midpt4106
  %_index_ptr4109 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4107, i32 0, i32 1, i64 %_load_val4108
  %_index_load4110 = load i64, i64* %_index_ptr4109
  %_load_val4111 = load i64, i64* %_func_uid4090
  %_binop4112 = icmp sgt i64 %_index_load4110, %_load_val4111
  br i1 %_binop4112, label %_lthen4119, label %_lelse4120
_lthen4119:
  %_load_ref4113 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4088
  %_load_val4114 = load i64, i64* %_func_uid4090
  %_load_val4115 = load i64, i64* %_func_uid4092
  %_load_val4116 = load i64, i64* %_midpt4106
  %_binop4117 = sub i64 %_load_val4116, 1
  %_call4118 = call i1 @binary_search({ i64, [0 x i64] }* %_load_ref4113, i64 %_load_val4114, i64 %_load_val4115, i64 %_binop4117)
  ret i1 %_call4118
_lelse4120:
  br label %_lafter4121
_lafter4121:
  %_load_ref4122 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4088
  %_load_val4123 = load i64, i64* %_midpt4106
  %_index_ptr4124 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4122, i32 0, i32 1, i64 %_load_val4123
  %_index_load4125 = load i64, i64* %_index_ptr4124
  %_load_val4126 = load i64, i64* %_func_uid4090
  %_binop4127 = icmp slt i64 %_index_load4125, %_load_val4126
  br i1 %_binop4127, label %_lthen4134, label %_lelse4135
_lthen4134:
  %_load_ref4128 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4088
  %_load_val4129 = load i64, i64* %_func_uid4090
  %_load_val4130 = load i64, i64* %_midpt4106
  %_binop4131 = add i64 %_load_val4130, 1
  %_load_val4132 = load i64, i64* %_func_uid4094
  %_call4133 = call i1 @binary_search({ i64, [0 x i64] }* %_load_ref4128, i64 %_load_val4129, i64 %_binop4131, i64 %_load_val4132)
  ret i1 %_call4133
_lelse4135:
  ret i1 1
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid4045 = alloca i64
  %_func_uid4047 = alloca { i64, [0 x i8*] }*
  %_test_array4051 = alloca { i64, [0 x i64] }*
  %_i4052 = alloca i64
  %_even4070 = alloca i1
  %_odd4073 = alloca i1
  store i64 %argc, i64* %_func_uid4045
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid4047
  %_raw_array4049 = call i64* @oat_alloc_array(i64 100)
  %_array4050 = bitcast i64* %_raw_array4049 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array4050, { i64, [0 x i64] }** %_test_array4051
  store i64 0, i64* %_i4052
  br label %_lpre4065
_lpre4065:
  %_load_val4056 = load i64, i64* %_i4052
  %_binop4057 = icmp slt i64 %_load_val4056, 100
  br i1 %_binop4057, label %_lbody4066, label %_lpost4067
_lbody4066:
  %_load_ref4058 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_test_array4051
  %_load_val4059 = load i64, i64* %_i4052
  %_load_val4060 = load i64, i64* %_i4052
  %_binop4061 = mul i64 2, %_load_val4060
  %_binop4062 = add i64 %_binop4061, 1
  %_assign_ptr4063 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4058, i32 0, i32 1, i64 %_load_val4059
  store i64 %_binop4062, i64* %_assign_ptr4063
  %_load_val4053 = load i64, i64* %_i4052
  %_binop4054 = add i64 %_load_val4053, 1
  store i64 %_binop4054, i64* %_i4052
  br label %_lpre4065
_lpost4067:
  %_load_ref4068 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_test_array4051
  %_call4069 = call i1 @binary_search({ i64, [0 x i64] }* %_load_ref4068, i64 80, i64 0, i64 99)
  store i1 %_call4069, i1* %_even4070
  %_load_ref4071 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_test_array4051
  %_call4072 = call i1 @binary_search({ i64, [0 x i64] }* %_load_ref4071, i64 81, i64 0, i64 99)
  store i1 %_call4072, i1* %_odd4073
  %_load_val4074 = load i1, i1* %_even4070
  %_load_val4075 = load i1, i1* %_odd4073
  %_binop4076 = and i1 %_load_val4074, %_load_val4075
  %_uop4077 = icmp eq i1 %_binop4076, 0
  %_load_val4078 = load i1, i1* %_even4070
  %_load_val4079 = load i1, i1* %_odd4073
  %_binop4080 = or i1 %_load_val4078, %_load_val4079
  %_binop4081 = and i1 %_uop4077, %_binop4080
  br i1 %_binop4081, label %_lthen4085, label %_lelse4086
_lthen4085:
  %_str_ptr4083 = getelementptr [9 x i8], [9 x i8]* @_string_hoist4082, i32 0, i32 0
  call void @print_string(i8* %_str_ptr4083)
  br label %_lafter4087
_lelse4086:
  br label %_lafter4087
_lafter4087:
  ret i64 0
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
