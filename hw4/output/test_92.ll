; generated from: oatprograms/bsort.oat
target triple = "x86_64-unknown-linux"
@_string_hoist3170 = global [2 x i8] c" \00"

define void @bubble_sort({ i64, [0 x i64] }* %numbers, i64 %array_size) {
  %_func_uid3179 = alloca { i64, [0 x i64] }*
  %_func_uid3181 = alloca i64
  %_temp3183 = alloca i64
  %_i3186 = alloca i64
  %_j3192 = alloca i64
  store { i64, [0 x i64] }* %numbers, { i64, [0 x i64] }** %_func_uid3179
  store i64 %array_size, i64* %_func_uid3181
  store i64 0, i64* %_temp3183
  %_load_val3184 = load i64, i64* %_func_uid3181
  %_binop3185 = sub i64 %_load_val3184, 1
  store i64 %_binop3185, i64* %_i3186
  br label %_lpre3235
_lpre3235:
  %_load_val3190 = load i64, i64* %_i3186
  %_binop3191 = icmp sgt i64 %_load_val3190, 0
  br i1 %_binop3191, label %_lbody3236, label %_lpost3237
_lbody3236:
  store i64 1, i64* %_j3192
  br label %_lpre3232
_lpre3232:
  %_load_val3196 = load i64, i64* %_j3192
  %_load_val3197 = load i64, i64* %_i3186
  %_binop3198 = icmp sle i64 %_load_val3196, %_load_val3197
  br i1 %_binop3198, label %_lbody3233, label %_lpost3234
_lbody3233:
  %_load_ref3199 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3179
  %_load_val3200 = load i64, i64* %_j3192
  %_binop3201 = sub i64 %_load_val3200, 1
  %_index_ptr3202 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3199, i32 0, i32 1, i64 %_binop3201
  %_index_load3203 = load i64, i64* %_index_ptr3202
  %_load_ref3204 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3179
  %_load_val3205 = load i64, i64* %_i3186
  %_index_ptr3206 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3204, i32 0, i32 1, i64 %_load_val3205
  %_index_load3207 = load i64, i64* %_index_ptr3206
  %_binop3208 = icmp sgt i64 %_index_load3203, %_index_load3207
  br i1 %_binop3208, label %_lthen3229, label %_lelse3230
_lthen3229:
  %_load_ref3209 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3179
  %_load_val3210 = load i64, i64* %_j3192
  %_binop3211 = sub i64 %_load_val3210, 1
  %_index_ptr3212 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3209, i32 0, i32 1, i64 %_binop3211
  %_index_load3213 = load i64, i64* %_index_ptr3212
  store i64 %_index_load3213, i64* %_temp3183
  %_load_ref3215 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3179
  %_load_val3216 = load i64, i64* %_j3192
  %_binop3217 = sub i64 %_load_val3216, 1
  %_load_ref3218 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3179
  %_load_val3219 = load i64, i64* %_i3186
  %_index_ptr3220 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3218, i32 0, i32 1, i64 %_load_val3219
  %_index_load3221 = load i64, i64* %_index_ptr3220
  %_assign_ptr3222 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3215, i32 0, i32 1, i64 %_binop3217
  store i64 %_index_load3221, i64* %_assign_ptr3222
  %_load_ref3224 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3179
  %_load_val3225 = load i64, i64* %_i3186
  %_load_val3226 = load i64, i64* %_temp3183
  %_assign_ptr3227 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3224, i32 0, i32 1, i64 %_load_val3225
  store i64 %_load_val3226, i64* %_assign_ptr3227
  br label %_lafter3231
_lelse3230:
  br label %_lafter3231
_lafter3231:
  %_load_val3193 = load i64, i64* %_j3192
  %_binop3194 = add i64 %_load_val3193, 1
  store i64 %_binop3194, i64* %_j3192
  br label %_lpre3232
_lpost3234:
  %_load_val3187 = load i64, i64* %_i3186
  %_binop3188 = sub i64 %_load_val3187, 1
  store i64 %_binop3188, i64* %_i3186
  br label %_lpre3235
_lpost3237:
  ret void
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid3136 = alloca i64
  %_func_uid3138 = alloca { i64, [0 x i8*] }*
  %_a3142 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid3136
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid3138
  %_raw_array3140 = call i64* @oat_alloc_array(i64 8)
  %_array3141 = bitcast i64* %_raw_array3140 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array3141, { i64, [0 x i64] }** %_a3142
  %_load_ref3143 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3142
  %_assign_ptr3144 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3143, i32 0, i32 1, i32 0
  store i64 121, i64* %_assign_ptr3144
  %_load_ref3146 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3142
  %_assign_ptr3147 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3146, i32 0, i32 1, i32 1
  store i64 125, i64* %_assign_ptr3147
  %_load_ref3149 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3142
  %_assign_ptr3150 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3149, i32 0, i32 1, i32 2
  store i64 120, i64* %_assign_ptr3150
  %_load_ref3152 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3142
  %_assign_ptr3153 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3152, i32 0, i32 1, i32 3
  store i64 111, i64* %_assign_ptr3153
  %_load_ref3155 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3142
  %_assign_ptr3156 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3155, i32 0, i32 1, i32 4
  store i64 116, i64* %_assign_ptr3156
  %_load_ref3158 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3142
  %_assign_ptr3159 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3158, i32 0, i32 1, i32 5
  store i64 110, i64* %_assign_ptr3159
  %_load_ref3161 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3142
  %_assign_ptr3162 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3161, i32 0, i32 1, i32 6
  store i64 117, i64* %_assign_ptr3162
  %_load_ref3164 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3142
  %_assign_ptr3165 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3164, i32 0, i32 1, i32 7
  store i64 119, i64* %_assign_ptr3165
  %_load_ref3167 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3142
  %_call3168 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref3167)
  call void @print_string(i8* %_call3168)
  %_str_ptr3171 = getelementptr [2 x i8], [2 x i8]* @_string_hoist3170, i32 0, i32 0
  call void @print_string(i8* %_str_ptr3171)
  %_load_ref3173 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3142
  call void @bubble_sort({ i64, [0 x i64] }* %_load_ref3173, i64 8)
  %_load_ref3175 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3142
  %_call3176 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref3175)
  call void @print_string(i8* %_call3176)
  %_uop3178 = sub i64 0, 1
  ret i64 %_uop3178
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
