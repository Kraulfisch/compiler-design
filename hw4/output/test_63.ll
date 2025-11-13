; generated from: oatprograms/run11.oat
target triple = "x86_64-unknown-linux"
@i = global i64 1

define i64 @f({ i64, [0 x i64] }* %arr) {
  %_func_uid1426 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %arr, { i64, [0 x i64] }** %_func_uid1426
  %_load_ref1428 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid1426
  %_index_ptr1429 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1428, i32 0, i32 1, i32 3
  %_index_load1430 = load i64, i64* %_index_ptr1429
  ret i64 %_index_load1430
}

define { i64, [0 x i64] }* @g() {
  %_arr1424 = alloca { i64, [0 x i64] }*
  %_raw_array1414 = call i64* @oat_alloc_array(i64 4)
  %_array1415 = bitcast i64* %_raw_array1414 to { i64, [0 x i64] }*
  %_arr_init_ptr1416 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1415, i32 0, i32 1, i32 0
  store i64 99, i64* %_arr_init_ptr1416
  %_arr_init_ptr1418 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1415, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr1418
  %_arr_init_ptr1420 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1415, i32 0, i32 1, i32 2
  store i64 99, i64* %_arr_init_ptr1420
  %_arr_init_ptr1422 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1415, i32 0, i32 1, i32 3
  store i64 99, i64* %_arr_init_ptr1422
  store { i64, [0 x i64] }* %_array1415, { i64, [0 x i64] }** %_arr1424
  %_load_ref1425 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr1424
  ret { i64, [0 x i64] }* %_load_ref1425
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid1318 = alloca i64
  %_func_uid1320 = alloca { i64, [0 x i8*] }*
  %_arr11330 = alloca { i64, [0 x i64] }*
  %_arr21363 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_c1364 = alloca i64
  %_arr41366 = alloca { i64, [0 x i64] }*
  %_arr31377 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid1318
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid1320
  %_raw_array1322 = call i64* @oat_alloc_array(i64 3)
  %_array1323 = bitcast i64* %_raw_array1322 to { i64, [0 x i64] }*
  %_arr_init_ptr1324 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1323, i32 0, i32 1, i32 0
  store i64 99, i64* %_arr_init_ptr1324
  %_arr_init_ptr1326 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1323, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr1326
  %_arr_init_ptr1328 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1323, i32 0, i32 1, i32 2
  store i64 99, i64* %_arr_init_ptr1328
  store { i64, [0 x i64] }* %_array1323, { i64, [0 x i64] }** %_arr11330
  %_raw_array1331 = call i64* @oat_alloc_array(i64 3)
  %_array1332 = bitcast i64* %_raw_array1331 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array1333 = call i64* @oat_alloc_array(i64 3)
  %_array1334 = bitcast i64* %_raw_array1333 to { i64, [0 x i64] }*
  %_arr_init_ptr1335 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1334, i32 0, i32 1, i32 0
  store i64 99, i64* %_arr_init_ptr1335
  %_arr_init_ptr1337 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1334, i32 0, i32 1, i32 1
  store i64 99, i64* %_arr_init_ptr1337
  %_arr_init_ptr1339 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1334, i32 0, i32 1, i32 2
  store i64 99, i64* %_arr_init_ptr1339
  %_arr_init_ptr1341 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1332, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array1334, { i64, [0 x i64] }** %_arr_init_ptr1341
  %_raw_array1343 = call i64* @oat_alloc_array(i64 3)
  %_array1344 = bitcast i64* %_raw_array1343 to { i64, [0 x i64] }*
  %_arr_init_ptr1345 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1344, i32 0, i32 1, i32 0
  store i64 99, i64* %_arr_init_ptr1345
  %_arr_init_ptr1347 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1344, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr1347
  %_arr_init_ptr1349 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1344, i32 0, i32 1, i32 2
  store i64 99, i64* %_arr_init_ptr1349
  %_arr_init_ptr1351 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1332, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array1344, { i64, [0 x i64] }** %_arr_init_ptr1351
  %_raw_array1353 = call i64* @oat_alloc_array(i64 3)
  %_array1354 = bitcast i64* %_raw_array1353 to { i64, [0 x i64] }*
  %_arr_init_ptr1355 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1354, i32 0, i32 1, i32 0
  store i64 99, i64* %_arr_init_ptr1355
  %_arr_init_ptr1357 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1354, i32 0, i32 1, i32 1
  store i64 99, i64* %_arr_init_ptr1357
  %_arr_init_ptr1359 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1354, i32 0, i32 1, i32 2
  store i64 99, i64* %_arr_init_ptr1359
  %_arr_init_ptr1361 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array1332, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array1354, { i64, [0 x i64] }** %_arr_init_ptr1361
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array1332, { i64, [0 x { i64, [0 x i64] }*] }** %_arr21363
  store i64 1, i64* %_c1364
  %_call1365 = call { i64, [0 x i64] }* @g()
  store { i64, [0 x i64] }* %_call1365, { i64, [0 x i64] }** %_arr41366
  %_raw_array1367 = call i64* @oat_alloc_array(i64 4)
  %_array1368 = bitcast i64* %_raw_array1367 to { i64, [0 x i64] }*
  %_arr_init_ptr1369 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1368, i32 0, i32 1, i32 0
  store i64 99, i64* %_arr_init_ptr1369
  %_arr_init_ptr1371 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1368, i32 0, i32 1, i32 1
  store i64 99, i64* %_arr_init_ptr1371
  %_arr_init_ptr1373 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1368, i32 0, i32 1, i32 2
  store i64 99, i64* %_arr_init_ptr1373
  %_arr_init_ptr1375 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array1368, i32 0, i32 1, i32 3
  store i64 1, i64* %_arr_init_ptr1375
  store { i64, [0 x i64] }* %_array1368, { i64, [0 x i64] }** %_arr31377
  %_load_val1378 = load i64, i64* %_c1364
  %_load_val1379 = load i64, i64* @i
  %_binop1380 = add i64 %_load_val1378, %_load_val1379
  store i64 %_binop1380, i64* %_c1364
  %_load_val1382 = load i64, i64* %_c1364
  %_load_ref1383 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr11330
  %_index_ptr1384 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1383, i32 0, i32 1, i32 1
  %_index_load1385 = load i64, i64* %_index_ptr1384
  %_binop1386 = add i64 %_load_val1382, %_index_load1385
  store i64 %_binop1386, i64* %_c1364
  %_load_val1388 = load i64, i64* %_c1364
  %_load_ref1389 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr21363
  %_index_ptr1390 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref1389, i32 0, i32 1, i32 1
  %_index_load1391 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr1390
  %_index_ptr1392 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load1391, i32 0, i32 1, i32 1
  %_index_load1393 = load i64, i64* %_index_ptr1392
  %_binop1394 = add i64 %_load_val1388, %_index_load1393
  store i64 %_binop1394, i64* %_c1364
  %_load_val1396 = load i64, i64* %_c1364
  %_load_ref1397 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr31377
  %_index_ptr1398 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1397, i32 0, i32 1, i32 3
  %_index_load1399 = load i64, i64* %_index_ptr1398
  %_binop1400 = add i64 %_load_val1396, %_index_load1399
  store i64 %_binop1400, i64* %_c1364
  %_load_val1402 = load i64, i64* %_c1364
  %_load_ref1403 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr31377
  %_call1404 = call i64 @f({ i64, [0 x i64] }* %_load_ref1403)
  %_binop1405 = add i64 %_load_val1402, %_call1404
  store i64 %_binop1405, i64* %_c1364
  %_load_val1407 = load i64, i64* %_c1364
  %_load_ref1408 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr41366
  %_index_ptr1409 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref1408, i32 0, i32 1, i32 1
  %_index_load1410 = load i64, i64* %_index_ptr1409
  %_binop1411 = add i64 %_load_val1407, %_index_load1410
  store i64 %_binop1411, i64* %_c1364
  %_load_val1413 = load i64, i64* %_c1364
  ret i64 %_load_val1413
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
