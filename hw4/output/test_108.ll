; generated from: oatprograms/life.oat
target triple = "x86_64-unknown-linux"
@len = global i64 4

define i64 @check({ i64, [0 x { i64, [0 x i64] }*] }* %board, i64 %i, i64 %j, i64 %count) {
  %_func_uid5491 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_func_uid5493 = alloca i64
  %_func_uid5495 = alloca i64
  %_func_uid5497 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %board, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5491
  store i64 %i, i64* %_func_uid5493
  store i64 %j, i64* %_func_uid5495
  store i64 %count, i64* %_func_uid5497
  %_load_val5499 = load i64, i64* %_func_uid5493
  %_binop5500 = icmp sge i64 %_load_val5499, 0
  %_load_val5501 = load i64, i64* %_func_uid5495
  %_binop5502 = icmp sge i64 %_load_val5501, 0
  %_binop5503 = and i1 %_binop5500, %_binop5502
  %_load_val5504 = load i64, i64* %_func_uid5493
  %_load_val5505 = load i64, i64* @len
  %_binop5506 = icmp slt i64 %_load_val5504, %_load_val5505
  %_binop5507 = and i1 %_binop5503, %_binop5506
  %_load_val5508 = load i64, i64* %_func_uid5495
  %_load_val5509 = load i64, i64* @len
  %_binop5510 = icmp slt i64 %_load_val5508, %_load_val5509
  %_binop5511 = and i1 %_binop5507, %_binop5510
  br i1 %_binop5511, label %_lthen5522, label %_lelse5523
_lthen5522:
  %_load_val5512 = load i64, i64* %_func_uid5497
  %_load_ref5513 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5491
  %_load_val5514 = load i64, i64* %_func_uid5493
  %_index_ptr5515 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5513, i32 0, i32 1, i64 %_load_val5514
  %_index_load5516 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5515
  %_load_val5517 = load i64, i64* %_func_uid5495
  %_index_ptr5518 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load5516, i32 0, i32 1, i64 %_load_val5517
  %_index_load5519 = load i64, i64* %_index_ptr5518
  %_binop5520 = add i64 %_load_val5512, %_index_load5519
  ret i64 %_binop5520
_lelse5523:
  %_load_val5521 = load i64, i64* %_func_uid5497
  ret i64 %_load_val5521
}

define i64 @val_at({ i64, [0 x { i64, [0 x i64] }*] }* %board, i64 %i, i64 %j) {
  %_func_uid5396 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_func_uid5398 = alloca i64
  %_func_uid5400 = alloca i64
  %_alive5409 = alloca i64
  %_count5410 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %board, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5396
  store i64 %i, i64* %_func_uid5398
  store i64 %j, i64* %_func_uid5400
  %_load_ref5402 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5396
  %_load_val5403 = load i64, i64* %_func_uid5398
  %_index_ptr5404 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5402, i32 0, i32 1, i64 %_load_val5403
  %_index_load5405 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5404
  %_load_val5406 = load i64, i64* %_func_uid5400
  %_index_ptr5407 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load5405, i32 0, i32 1, i64 %_load_val5406
  %_index_load5408 = load i64, i64* %_index_ptr5407
  store i64 %_index_load5408, i64* %_alive5409
  store i64 0, i64* %_count5410
  %_load_ref5411 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5396
  %_load_val5412 = load i64, i64* %_func_uid5398
  %_binop5413 = sub i64 %_load_val5412, 1
  %_load_val5414 = load i64, i64* %_func_uid5400
  %_binop5415 = sub i64 %_load_val5414, 1
  %_load_val5416 = load i64, i64* %_count5410
  %_call5417 = call i64 @check({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5411, i64 %_binop5413, i64 %_binop5415, i64 %_load_val5416)
  store i64 %_call5417, i64* %_count5410
  %_load_ref5419 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5396
  %_load_val5420 = load i64, i64* %_func_uid5398
  %_binop5421 = sub i64 %_load_val5420, 1
  %_load_val5422 = load i64, i64* %_func_uid5400
  %_load_val5423 = load i64, i64* %_count5410
  %_call5424 = call i64 @check({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5419, i64 %_binop5421, i64 %_load_val5422, i64 %_load_val5423)
  store i64 %_call5424, i64* %_count5410
  %_load_ref5426 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5396
  %_load_val5427 = load i64, i64* %_func_uid5398
  %_binop5428 = sub i64 %_load_val5427, 1
  %_load_val5429 = load i64, i64* %_func_uid5400
  %_binop5430 = add i64 %_load_val5429, 1
  %_load_val5431 = load i64, i64* %_count5410
  %_call5432 = call i64 @check({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5426, i64 %_binop5428, i64 %_binop5430, i64 %_load_val5431)
  store i64 %_call5432, i64* %_count5410
  %_load_ref5434 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5396
  %_load_val5435 = load i64, i64* %_func_uid5398
  %_load_val5436 = load i64, i64* %_func_uid5400
  %_binop5437 = sub i64 %_load_val5436, 1
  %_load_val5438 = load i64, i64* %_count5410
  %_call5439 = call i64 @check({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5434, i64 %_load_val5435, i64 %_binop5437, i64 %_load_val5438)
  store i64 %_call5439, i64* %_count5410
  %_load_ref5441 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5396
  %_load_val5442 = load i64, i64* %_func_uid5398
  %_load_val5443 = load i64, i64* %_func_uid5400
  %_binop5444 = add i64 %_load_val5443, 1
  %_load_val5445 = load i64, i64* %_count5410
  %_call5446 = call i64 @check({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5441, i64 %_load_val5442, i64 %_binop5444, i64 %_load_val5445)
  store i64 %_call5446, i64* %_count5410
  %_load_ref5448 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5396
  %_load_val5449 = load i64, i64* %_func_uid5398
  %_binop5450 = add i64 %_load_val5449, 1
  %_load_val5451 = load i64, i64* %_func_uid5400
  %_binop5452 = sub i64 %_load_val5451, 1
  %_load_val5453 = load i64, i64* %_count5410
  %_call5454 = call i64 @check({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5448, i64 %_binop5450, i64 %_binop5452, i64 %_load_val5453)
  store i64 %_call5454, i64* %_count5410
  %_load_ref5456 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5396
  %_load_val5457 = load i64, i64* %_func_uid5398
  %_binop5458 = add i64 %_load_val5457, 1
  %_load_val5459 = load i64, i64* %_func_uid5400
  %_load_val5460 = load i64, i64* %_count5410
  %_call5461 = call i64 @check({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5456, i64 %_binop5458, i64 %_load_val5459, i64 %_load_val5460)
  store i64 %_call5461, i64* %_count5410
  %_load_ref5463 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_func_uid5396
  %_load_val5464 = load i64, i64* %_func_uid5398
  %_binop5465 = add i64 %_load_val5464, 1
  %_load_val5466 = load i64, i64* %_func_uid5400
  %_binop5467 = add i64 %_load_val5466, 1
  %_load_val5468 = load i64, i64* %_count5410
  %_call5469 = call i64 @check({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5463, i64 %_binop5465, i64 %_binop5467, i64 %_load_val5468)
  store i64 %_call5469, i64* %_count5410
  %_load_val5471 = load i64, i64* %_alive5409
  %_binop5472 = icmp eq i64 %_load_val5471, 1
  br i1 %_binop5472, label %_lthen5483, label %_lelse5484
_lthen5483:
  %_load_val5473 = load i64, i64* %_count5410
  %_binop5474 = icmp slt i64 %_load_val5473, 2
  br i1 %_binop5474, label %_lthen5480, label %_lelse5481
_lthen5480:
  ret i64 0
_lelse5481:
  %_load_val5475 = load i64, i64* %_count5410
  %_binop5476 = icmp slt i64 %_load_val5475, 4
  br i1 %_binop5476, label %_lthen5477, label %_lelse5478
_lthen5477:
  ret i64 1
_lelse5478:
  br label %_lafter5479
_lafter5479:
  br label %_lafter5482
_lafter5482:
  ret i64 0
_lelse5484:
  br label %_lafter5485
_lafter5485:
  %_load_val5486 = load i64, i64* %_count5410
  %_binop5487 = icmp eq i64 %_load_val5486, 3
  br i1 %_binop5487, label %_lthen5488, label %_lelse5489
_lthen5488:
  ret i64 1
_lelse5489:
  ret i64 0
_lafter5490:
  ret i64 0
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid5227 = alloca i64
  %_func_uid5229 = alloca { i64, [0 x i8*] }*
  %_board5281 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_new_board5332 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i5333 = alloca i64
  %_j5345 = alloca i64
  %_i5368 = alloca i64
  %_j5375 = alloca i64
  store i64 %argc, i64* %_func_uid5227
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid5229
  %_raw_array5231 = call i64* @oat_alloc_array(i64 4)
  %_array5232 = bitcast i64* %_raw_array5231 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array5233 = call i64* @oat_alloc_array(i64 4)
  %_array5234 = bitcast i64* %_raw_array5233 to { i64, [0 x i64] }*
  %_arr_init_ptr5235 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5234, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr5235
  %_arr_init_ptr5237 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5234, i32 0, i32 1, i32 1
  store i64 0, i64* %_arr_init_ptr5237
  %_arr_init_ptr5239 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5234, i32 0, i32 1, i32 2
  store i64 0, i64* %_arr_init_ptr5239
  %_arr_init_ptr5241 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5234, i32 0, i32 1, i32 3
  store i64 0, i64* %_arr_init_ptr5241
  %_arr_init_ptr5243 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5232, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array5234, { i64, [0 x i64] }** %_arr_init_ptr5243
  %_raw_array5245 = call i64* @oat_alloc_array(i64 4)
  %_array5246 = bitcast i64* %_raw_array5245 to { i64, [0 x i64] }*
  %_arr_init_ptr5247 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5246, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr5247
  %_arr_init_ptr5249 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5246, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr5249
  %_arr_init_ptr5251 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5246, i32 0, i32 1, i32 2
  store i64 1, i64* %_arr_init_ptr5251
  %_arr_init_ptr5253 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5246, i32 0, i32 1, i32 3
  store i64 1, i64* %_arr_init_ptr5253
  %_arr_init_ptr5255 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5232, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array5246, { i64, [0 x i64] }** %_arr_init_ptr5255
  %_raw_array5257 = call i64* @oat_alloc_array(i64 4)
  %_array5258 = bitcast i64* %_raw_array5257 to { i64, [0 x i64] }*
  %_arr_init_ptr5259 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5258, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr5259
  %_arr_init_ptr5261 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5258, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr5261
  %_arr_init_ptr5263 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5258, i32 0, i32 1, i32 2
  store i64 1, i64* %_arr_init_ptr5263
  %_arr_init_ptr5265 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5258, i32 0, i32 1, i32 3
  store i64 0, i64* %_arr_init_ptr5265
  %_arr_init_ptr5267 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5232, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array5258, { i64, [0 x i64] }** %_arr_init_ptr5267
  %_raw_array5269 = call i64* @oat_alloc_array(i64 4)
  %_array5270 = bitcast i64* %_raw_array5269 to { i64, [0 x i64] }*
  %_arr_init_ptr5271 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5270, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr5271
  %_arr_init_ptr5273 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5270, i32 0, i32 1, i32 1
  store i64 0, i64* %_arr_init_ptr5273
  %_arr_init_ptr5275 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5270, i32 0, i32 1, i32 2
  store i64 0, i64* %_arr_init_ptr5275
  %_arr_init_ptr5277 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5270, i32 0, i32 1, i32 3
  store i64 0, i64* %_arr_init_ptr5277
  %_arr_init_ptr5279 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5232, i32 0, i32 1, i32 3
  store { i64, [0 x i64] }* %_array5270, { i64, [0 x i64] }** %_arr_init_ptr5279
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5232, { i64, [0 x { i64, [0 x i64] }*] }** %_board5281
  %_raw_array5282 = call i64* @oat_alloc_array(i64 4)
  %_array5283 = bitcast i64* %_raw_array5282 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array5284 = call i64* @oat_alloc_array(i64 4)
  %_array5285 = bitcast i64* %_raw_array5284 to { i64, [0 x i64] }*
  %_arr_init_ptr5286 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5285, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr5286
  %_arr_init_ptr5288 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5285, i32 0, i32 1, i32 1
  store i64 0, i64* %_arr_init_ptr5288
  %_arr_init_ptr5290 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5285, i32 0, i32 1, i32 2
  store i64 0, i64* %_arr_init_ptr5290
  %_arr_init_ptr5292 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5285, i32 0, i32 1, i32 3
  store i64 0, i64* %_arr_init_ptr5292
  %_arr_init_ptr5294 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5283, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array5285, { i64, [0 x i64] }** %_arr_init_ptr5294
  %_raw_array5296 = call i64* @oat_alloc_array(i64 4)
  %_array5297 = bitcast i64* %_raw_array5296 to { i64, [0 x i64] }*
  %_arr_init_ptr5298 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5297, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr5298
  %_arr_init_ptr5300 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5297, i32 0, i32 1, i32 1
  store i64 0, i64* %_arr_init_ptr5300
  %_arr_init_ptr5302 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5297, i32 0, i32 1, i32 2
  store i64 0, i64* %_arr_init_ptr5302
  %_arr_init_ptr5304 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5297, i32 0, i32 1, i32 3
  store i64 0, i64* %_arr_init_ptr5304
  %_arr_init_ptr5306 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5283, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array5297, { i64, [0 x i64] }** %_arr_init_ptr5306
  %_raw_array5308 = call i64* @oat_alloc_array(i64 4)
  %_array5309 = bitcast i64* %_raw_array5308 to { i64, [0 x i64] }*
  %_arr_init_ptr5310 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5309, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr5310
  %_arr_init_ptr5312 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5309, i32 0, i32 1, i32 1
  store i64 0, i64* %_arr_init_ptr5312
  %_arr_init_ptr5314 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5309, i32 0, i32 1, i32 2
  store i64 0, i64* %_arr_init_ptr5314
  %_arr_init_ptr5316 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5309, i32 0, i32 1, i32 3
  store i64 0, i64* %_arr_init_ptr5316
  %_arr_init_ptr5318 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5283, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array5309, { i64, [0 x i64] }** %_arr_init_ptr5318
  %_raw_array5320 = call i64* @oat_alloc_array(i64 4)
  %_array5321 = bitcast i64* %_raw_array5320 to { i64, [0 x i64] }*
  %_arr_init_ptr5322 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5321, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr5322
  %_arr_init_ptr5324 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5321, i32 0, i32 1, i32 1
  store i64 0, i64* %_arr_init_ptr5324
  %_arr_init_ptr5326 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5321, i32 0, i32 1, i32 2
  store i64 0, i64* %_arr_init_ptr5326
  %_arr_init_ptr5328 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5321, i32 0, i32 1, i32 3
  store i64 0, i64* %_arr_init_ptr5328
  %_arr_init_ptr5330 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5283, i32 0, i32 1, i32 3
  store { i64, [0 x i64] }* %_array5321, { i64, [0 x i64] }** %_arr_init_ptr5330
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5283, { i64, [0 x { i64, [0 x i64] }*] }** %_new_board5332
  store i64 0, i64* %_i5333
  br label %_lpre5365
_lpre5365:
  %_load_val5337 = load i64, i64* %_i5333
  %_binop5338 = icmp slt i64 %_load_val5337, 4
  br i1 %_binop5338, label %_lbody5366, label %_lpost5367
_lbody5366:
  %_load_ref5339 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_new_board5332
  %_load_val5340 = load i64, i64* %_i5333
  %_raw_array5341 = call i64* @oat_alloc_array(i64 4)
  %_array5342 = bitcast i64* %_raw_array5341 to { i64, [0 x i64] }*
  %_assign_ptr5343 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5339, i32 0, i32 1, i64 %_load_val5340
  store { i64, [0 x i64] }* %_array5342, { i64, [0 x i64] }** %_assign_ptr5343
  store i64 0, i64* %_j5345
  br label %_lpre5362
_lpre5362:
  %_load_val5349 = load i64, i64* %_j5345
  %_binop5350 = icmp slt i64 %_load_val5349, 4
  br i1 %_binop5350, label %_lbody5363, label %_lpost5364
_lbody5363:
  %_load_ref5351 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_new_board5332
  %_load_val5352 = load i64, i64* %_i5333
  %_index_ptr5353 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5351, i32 0, i32 1, i64 %_load_val5352
  %_index_load5354 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5353
  %_load_val5355 = load i64, i64* %_j5345
  %_load_ref5356 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board5281
  %_load_val5357 = load i64, i64* %_i5333
  %_load_val5358 = load i64, i64* %_j5345
  %_call5359 = call i64 @val_at({ i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5356, i64 %_load_val5357, i64 %_load_val5358)
  %_assign_ptr5360 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load5354, i32 0, i32 1, i64 %_load_val5355
  store i64 %_call5359, i64* %_assign_ptr5360
  %_load_val5346 = load i64, i64* %_j5345
  %_binop5347 = add i64 %_load_val5346, 1
  store i64 %_binop5347, i64* %_j5345
  br label %_lpre5362
_lpost5364:
  %_load_val5334 = load i64, i64* %_i5333
  %_binop5335 = add i64 %_load_val5334, 1
  store i64 %_binop5335, i64* %_i5333
  br label %_lpre5365
_lpost5367:
  store i64 0, i64* %_i5368
  br label %_lpre5393
_lpre5393:
  %_load_val5372 = load i64, i64* %_i5368
  %_load_val5373 = load i64, i64* @len
  %_binop5374 = icmp slt i64 %_load_val5372, %_load_val5373
  br i1 %_binop5374, label %_lbody5394, label %_lpost5395
_lbody5394:
  store i64 0, i64* %_j5375
  br label %_lpre5390
_lpre5390:
  %_load_val5379 = load i64, i64* %_j5375
  %_load_val5380 = load i64, i64* @len
  %_binop5381 = icmp slt i64 %_load_val5379, %_load_val5380
  br i1 %_binop5381, label %_lbody5391, label %_lpost5392
_lbody5391:
  %_load_ref5382 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_new_board5332
  %_load_val5383 = load i64, i64* %_i5368
  %_index_ptr5384 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref5382, i32 0, i32 1, i64 %_load_val5383
  %_index_load5385 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr5384
  %_load_val5386 = load i64, i64* %_j5375
  %_index_ptr5387 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load5385, i32 0, i32 1, i64 %_load_val5386
  %_index_load5388 = load i64, i64* %_index_ptr5387
  call void @print_int(i64 %_index_load5388)
  %_load_val5376 = load i64, i64* %_j5375
  %_binop5377 = add i64 %_load_val5376, 1
  store i64 %_binop5377, i64* %_j5375
  br label %_lpre5390
_lpost5392:
  %_load_val5369 = load i64, i64* %_i5368
  %_binop5370 = add i64 %_load_val5369, 1
  store i64 %_binop5370, i64* %_i5368
  br label %_lpre5393
_lpost5395:
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
