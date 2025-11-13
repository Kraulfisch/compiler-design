; generated from: oatprograms/msort.oat
target triple = "x86_64-unknown-linux"
@_string_hoist3433 = global [2 x i8] c" \00"
@_string_hoist3439 = global [2 x i8] c" \00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid3400 = alloca i64
  %_func_uid3402 = alloca { i64, [0 x i8*] }*
  %_i3404 = alloca i64
  %_a3427 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid3400
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid3402
  store i64 0, i64* %_i3404
  %_raw_array3405 = call i64* @oat_alloc_array(i64 10)
  %_array3406 = bitcast i64* %_raw_array3405 to { i64, [0 x i64] }*
  %_arr_init_ptr3407 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3406, i32 0, i32 1, i32 0
  store i64 126, i64* %_arr_init_ptr3407
  %_arr_init_ptr3409 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3406, i32 0, i32 1, i32 1
  store i64 125, i64* %_arr_init_ptr3409
  %_arr_init_ptr3411 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3406, i32 0, i32 1, i32 2
  store i64 124, i64* %_arr_init_ptr3411
  %_arr_init_ptr3413 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3406, i32 0, i32 1, i32 3
  store i64 123, i64* %_arr_init_ptr3413
  %_arr_init_ptr3415 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3406, i32 0, i32 1, i32 4
  store i64 122, i64* %_arr_init_ptr3415
  %_arr_init_ptr3417 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3406, i32 0, i32 1, i32 5
  store i64 121, i64* %_arr_init_ptr3417
  %_arr_init_ptr3419 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3406, i32 0, i32 1, i32 6
  store i64 120, i64* %_arr_init_ptr3419
  %_arr_init_ptr3421 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3406, i32 0, i32 1, i32 7
  store i64 119, i64* %_arr_init_ptr3421
  %_arr_init_ptr3423 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3406, i32 0, i32 1, i32 8
  store i64 118, i64* %_arr_init_ptr3423
  %_arr_init_ptr3425 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3406, i32 0, i32 1, i32 9
  store i64 117, i64* %_arr_init_ptr3425
  store { i64, [0 x i64] }* %_array3406, { i64, [0 x i64] }** %_a3427
  %_load_ref3428 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3427
  %_call3429 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref3428)
  call void @print_string(i8* %_call3429)
  %_load_ref3431 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3427
  call void @oat_mergesort({ i64, [0 x i64] }* %_load_ref3431, i64 0, i64 9)
  %_str_ptr3434 = getelementptr [2 x i8], [2 x i8]* @_string_hoist3433, i32 0, i32 0
  call void @print_string(i8* %_str_ptr3434)
  %_load_ref3436 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3427
  %_call3437 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref3436)
  call void @print_string(i8* %_call3437)
  %_str_ptr3440 = getelementptr [2 x i8], [2 x i8]* @_string_hoist3439, i32 0, i32 0
  call void @print_string(i8* %_str_ptr3440)
  %_load_val3442 = load i64, i64* %_i3404
  ret i64 %_load_val3442
}

define void @oat_mergesort({ i64, [0 x i64] }* %a, i64 %low, i64 %high) {
  %_func_uid3368 = alloca { i64, [0 x i64] }*
  %_func_uid3370 = alloca i64
  %_func_uid3372 = alloca i64
  %_mid3374 = alloca i64
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_func_uid3368
  store i64 %low, i64* %_func_uid3370
  store i64 %high, i64* %_func_uid3372
  store i64 0, i64* %_mid3374
  %_load_val3375 = load i64, i64* %_func_uid3370
  %_load_val3376 = load i64, i64* %_func_uid3372
  %_binop3377 = icmp slt i64 %_load_val3375, %_load_val3376
  br i1 %_binop3377, label %_lthen3397, label %_lelse3398
_lthen3397:
  %_load_val3378 = load i64, i64* %_func_uid3370
  %_load_val3379 = load i64, i64* %_func_uid3372
  %_binop3380 = add i64 %_load_val3378, %_load_val3379
  %_binop3381 = lshr i64 %_binop3380, 1
  store i64 %_binop3381, i64* %_mid3374
  %_load_ref3383 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3368
  %_load_val3384 = load i64, i64* %_func_uid3370
  %_load_val3385 = load i64, i64* %_mid3374
  call void @oat_mergesort({ i64, [0 x i64] }* %_load_ref3383, i64 %_load_val3384, i64 %_load_val3385)
  %_load_ref3387 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3368
  %_load_val3388 = load i64, i64* %_mid3374
  %_binop3389 = add i64 %_load_val3388, 1
  %_load_val3390 = load i64, i64* %_func_uid3372
  call void @oat_mergesort({ i64, [0 x i64] }* %_load_ref3387, i64 %_binop3389, i64 %_load_val3390)
  %_load_ref3392 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3368
  %_load_val3393 = load i64, i64* %_func_uid3370
  %_load_val3394 = load i64, i64* %_func_uid3372
  %_load_val3395 = load i64, i64* %_mid3374
  call void @merge({ i64, [0 x i64] }* %_load_ref3392, i64 %_load_val3393, i64 %_load_val3394, i64 %_load_val3395)
  br label %_lafter3399
_lelse3398:
  br label %_lafter3399
_lafter3399:
  ret void
}

define void @merge({ i64, [0 x i64] }* %a, i64 %low, i64 %high, i64 %mid) {
  %_func_uid3238 = alloca { i64, [0 x i64] }*
  %_func_uid3240 = alloca i64
  %_func_uid3242 = alloca i64
  %_func_uid3244 = alloca i64
  %_i3246 = alloca i64
  %_j3247 = alloca i64
  %_k3248 = alloca i64
  %_c3251 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_func_uid3238
  store i64 %low, i64* %_func_uid3240
  store i64 %high, i64* %_func_uid3242
  store i64 %mid, i64* %_func_uid3244
  store i64 0, i64* %_i3246
  store i64 0, i64* %_j3247
  store i64 0, i64* %_k3248
  %_raw_array3249 = call i64* @oat_alloc_array(i64 50)
  %_array3250 = bitcast i64* %_raw_array3249 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array3250, { i64, [0 x i64] }** %_c3251
  %_load_val3252 = load i64, i64* %_func_uid3240
  store i64 %_load_val3252, i64* %_i3246
  %_load_val3254 = load i64, i64* %_func_uid3244
  %_binop3255 = add i64 %_load_val3254, 1
  store i64 %_binop3255, i64* %_j3247
  %_load_val3257 = load i64, i64* %_func_uid3240
  store i64 %_load_val3257, i64* %_k3248
  br label %_lpre3306
_lpre3306:
  %_load_val3259 = load i64, i64* %_i3246
  %_load_val3260 = load i64, i64* %_func_uid3244
  %_binop3261 = icmp sle i64 %_load_val3259, %_load_val3260
  %_load_val3262 = load i64, i64* %_j3247
  %_load_val3263 = load i64, i64* %_func_uid3242
  %_binop3264 = icmp sle i64 %_load_val3262, %_load_val3263
  %_binop3265 = and i1 %_binop3261, %_binop3264
  br i1 %_binop3265, label %_lbody3307, label %_lpost3308
_lbody3307:
  %_load_ref3266 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3238
  %_load_val3267 = load i64, i64* %_i3246
  %_index_ptr3268 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3266, i32 0, i32 1, i64 %_load_val3267
  %_index_load3269 = load i64, i64* %_index_ptr3268
  %_load_ref3270 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3238
  %_load_val3271 = load i64, i64* %_j3247
  %_index_ptr3272 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3270, i32 0, i32 1, i64 %_load_val3271
  %_index_load3273 = load i64, i64* %_index_ptr3272
  %_binop3274 = icmp slt i64 %_index_load3269, %_index_load3273
  br i1 %_binop3274, label %_lthen3303, label %_lelse3304
_lthen3303:
  %_load_ref3275 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3251
  %_load_val3276 = load i64, i64* %_k3248
  %_load_ref3277 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3238
  %_load_val3278 = load i64, i64* %_i3246
  %_index_ptr3279 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3277, i32 0, i32 1, i64 %_load_val3278
  %_index_load3280 = load i64, i64* %_index_ptr3279
  %_assign_ptr3281 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3275, i32 0, i32 1, i64 %_load_val3276
  store i64 %_index_load3280, i64* %_assign_ptr3281
  %_load_val3283 = load i64, i64* %_k3248
  %_binop3284 = add i64 %_load_val3283, 1
  store i64 %_binop3284, i64* %_k3248
  %_load_val3286 = load i64, i64* %_i3246
  %_binop3287 = add i64 %_load_val3286, 1
  store i64 %_binop3287, i64* %_i3246
  br label %_lafter3305
_lelse3304:
  %_load_ref3289 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3251
  %_load_val3290 = load i64, i64* %_k3248
  %_load_ref3291 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3238
  %_load_val3292 = load i64, i64* %_j3247
  %_index_ptr3293 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3291, i32 0, i32 1, i64 %_load_val3292
  %_index_load3294 = load i64, i64* %_index_ptr3293
  %_assign_ptr3295 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3289, i32 0, i32 1, i64 %_load_val3290
  store i64 %_index_load3294, i64* %_assign_ptr3295
  %_load_val3297 = load i64, i64* %_k3248
  %_binop3298 = add i64 %_load_val3297, 1
  store i64 %_binop3298, i64* %_k3248
  %_load_val3300 = load i64, i64* %_j3247
  %_binop3301 = add i64 %_load_val3300, 1
  store i64 %_binop3301, i64* %_j3247
  br label %_lafter3305
_lafter3305:
  br label %_lpre3306
_lpost3308:
  br label %_lpre3326
_lpre3326:
  %_load_val3309 = load i64, i64* %_i3246
  %_load_val3310 = load i64, i64* %_func_uid3244
  %_binop3311 = icmp sle i64 %_load_val3309, %_load_val3310
  br i1 %_binop3311, label %_lbody3327, label %_lpost3328
_lbody3327:
  %_load_ref3312 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3251
  %_load_val3313 = load i64, i64* %_k3248
  %_load_ref3314 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3238
  %_load_val3315 = load i64, i64* %_i3246
  %_index_ptr3316 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3314, i32 0, i32 1, i64 %_load_val3315
  %_index_load3317 = load i64, i64* %_index_ptr3316
  %_assign_ptr3318 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3312, i32 0, i32 1, i64 %_load_val3313
  store i64 %_index_load3317, i64* %_assign_ptr3318
  %_load_val3320 = load i64, i64* %_k3248
  %_binop3321 = add i64 %_load_val3320, 1
  store i64 %_binop3321, i64* %_k3248
  %_load_val3323 = load i64, i64* %_i3246
  %_binop3324 = add i64 %_load_val3323, 1
  store i64 %_binop3324, i64* %_i3246
  br label %_lpre3326
_lpost3328:
  br label %_lpre3346
_lpre3346:
  %_load_val3329 = load i64, i64* %_j3247
  %_load_val3330 = load i64, i64* %_func_uid3242
  %_binop3331 = icmp sle i64 %_load_val3329, %_load_val3330
  br i1 %_binop3331, label %_lbody3347, label %_lpost3348
_lbody3347:
  %_load_ref3332 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3251
  %_load_val3333 = load i64, i64* %_k3248
  %_load_ref3334 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3238
  %_load_val3335 = load i64, i64* %_j3247
  %_index_ptr3336 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3334, i32 0, i32 1, i64 %_load_val3335
  %_index_load3337 = load i64, i64* %_index_ptr3336
  %_assign_ptr3338 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3332, i32 0, i32 1, i64 %_load_val3333
  store i64 %_index_load3337, i64* %_assign_ptr3338
  %_load_val3340 = load i64, i64* %_k3248
  %_binop3341 = add i64 %_load_val3340, 1
  store i64 %_binop3341, i64* %_k3248
  %_load_val3343 = load i64, i64* %_j3247
  %_binop3344 = add i64 %_load_val3343, 1
  store i64 %_binop3344, i64* %_j3247
  br label %_lpre3346
_lpost3348:
  %_load_val3349 = load i64, i64* %_func_uid3240
  store i64 %_load_val3349, i64* %_i3246
  br label %_lpre3365
_lpre3365:
  %_load_val3354 = load i64, i64* %_i3246
  %_load_val3355 = load i64, i64* %_k3248
  %_binop3356 = icmp slt i64 %_load_val3354, %_load_val3355
  br i1 %_binop3356, label %_lbody3366, label %_lpost3367
_lbody3366:
  %_load_ref3357 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3238
  %_load_val3358 = load i64, i64* %_i3246
  %_load_ref3359 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3251
  %_load_val3360 = load i64, i64* %_i3246
  %_index_ptr3361 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3359, i32 0, i32 1, i64 %_load_val3360
  %_index_load3362 = load i64, i64* %_index_ptr3361
  %_assign_ptr3363 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3357, i32 0, i32 1, i64 %_load_val3358
  store i64 %_index_load3362, i64* %_assign_ptr3363
  %_load_val3351 = load i64, i64* %_i3246
  %_binop3352 = add i64 %_load_val3351, 1
  store i64 %_binop3352, i64* %_i3246
  br label %_lpre3365
_lpost3367:
  ret void
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
