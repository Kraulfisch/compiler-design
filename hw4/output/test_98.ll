; generated from: oatprograms/xor_shift.oat
target triple = "x86_64-unknown-linux"
@_string_hoist4225 = global [2 x i8] c"
\00"

define i64 @xor(i64 %x, i64 %y) {
  %_func_uid4269 = alloca i64
  %_func_uid4271 = alloca i64
  store i64 %x, i64* %_func_uid4269
  store i64 %y, i64* %_func_uid4271
  %_load_val4273 = load i64, i64* %_func_uid4269
  %_load_val4274 = load i64, i64* %_func_uid4271
  %_binop4275 = and i64 %_load_val4273, %_load_val4274
  %_uop4276 = xor i64 %_binop4275, -1
  %_load_val4277 = load i64, i64* %_func_uid4269
  %_load_val4278 = load i64, i64* %_func_uid4271
  %_binop4279 = or i64 %_load_val4277, %_load_val4278
  %_binop4280 = and i64 %_uop4276, %_binop4279
  ret i64 %_binop4280
}

define i64 @xor_shift_plus({ i64, [0 x i64] }* %s) {
  %_func_uid4231 = alloca { i64, [0 x i64] }*
  %_x4236 = alloca i64
  %_y4240 = alloca i64
  store { i64, [0 x i64] }* %s, { i64, [0 x i64] }** %_func_uid4231
  %_load_ref4233 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4231
  %_index_ptr4234 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4233, i32 0, i32 1, i32 0
  %_index_load4235 = load i64, i64* %_index_ptr4234
  store i64 %_index_load4235, i64* %_x4236
  %_load_ref4237 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4231
  %_index_ptr4238 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4237, i32 0, i32 1, i32 1
  %_index_load4239 = load i64, i64* %_index_ptr4238
  store i64 %_index_load4239, i64* %_y4240
  %_load_ref4241 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4231
  %_load_val4242 = load i64, i64* %_y4240
  %_assign_ptr4243 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4241, i32 0, i32 1, i32 0
  store i64 %_load_val4242, i64* %_assign_ptr4243
  %_load_val4245 = load i64, i64* %_x4236
  %_load_val4246 = load i64, i64* %_x4236
  %_binop4247 = shl i64 %_load_val4246, 23
  %_call4248 = call i64 @xor(i64 %_load_val4245, i64 %_binop4247)
  store i64 %_call4248, i64* %_x4236
  %_load_val4250 = load i64, i64* %_x4236
  %_load_val4251 = load i64, i64* %_x4236
  %_binop4252 = lshr i64 %_load_val4251, 17
  %_call4253 = call i64 @xor(i64 %_load_val4250, i64 %_binop4252)
  store i64 %_call4253, i64* %_x4236
  %_load_val4255 = load i64, i64* %_x4236
  %_load_val4256 = load i64, i64* %_y4240
  %_load_val4257 = load i64, i64* %_y4240
  %_binop4258 = lshr i64 %_load_val4257, 26
  %_call4259 = call i64 @xor(i64 %_load_val4256, i64 %_binop4258)
  %_call4260 = call i64 @xor(i64 %_load_val4255, i64 %_call4259)
  store i64 %_call4260, i64* %_x4236
  %_load_ref4262 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid4231
  %_load_val4263 = load i64, i64* %_x4236
  %_assign_ptr4264 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4262, i32 0, i32 1, i32 1
  store i64 %_load_val4263, i64* %_assign_ptr4264
  %_load_val4266 = load i64, i64* %_x4236
  %_load_val4267 = load i64, i64* %_y4240
  %_binop4268 = add i64 %_load_val4266, %_load_val4267
  ret i64 %_binop4268
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid4199 = alloca i64
  %_func_uid4201 = alloca { i64, [0 x i8*] }*
  %_seed4205 = alloca { i64, [0 x i64] }*
  %_i4206 = alloca i64
  store i64 %argc, i64* %_func_uid4199
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid4201
  %_raw_array4203 = call i64* @oat_alloc_array(i64 2)
  %_array4204 = bitcast i64* %_raw_array4203 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array4204, { i64, [0 x i64] }** %_seed4205
  store i64 0, i64* %_i4206
  br label %_lpre4219
_lpre4219:
  %_load_val4210 = load i64, i64* %_i4206
  %_binop4211 = icmp slt i64 %_load_val4210, 2
  br i1 %_binop4211, label %_lbody4220, label %_lpost4221
_lbody4220:
  %_load_ref4212 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_seed4205
  %_load_val4213 = load i64, i64* %_i4206
  %_load_val4214 = load i64, i64* %_i4206
  %_binop4215 = add i64 %_load_val4214, 1
  %_binop4216 = mul i64 100, %_binop4215
  %_assign_ptr4217 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref4212, i32 0, i32 1, i64 %_load_val4213
  store i64 %_binop4216, i64* %_assign_ptr4217
  %_load_val4207 = load i64, i64* %_i4206
  %_binop4208 = add i64 %_load_val4207, 1
  store i64 %_binop4208, i64* %_i4206
  br label %_lpre4219
_lpost4221:
  %_load_ref4222 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_seed4205
  %_call4223 = call i64 @xor_shift_plus({ i64, [0 x i64] }* %_load_ref4222)
  call void @print_int(i64 %_call4223)
  %_str_ptr4226 = getelementptr [2 x i8], [2 x i8]* @_string_hoist4225, i32 0, i32 0
  call void @print_string(i8* %_str_ptr4226)
  %_load_ref4228 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_seed4205
  %_call4229 = call i64 @xor_shift_plus({ i64, [0 x i64] }* %_load_ref4228)
  call void @print_int(i64 %_call4229)
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
