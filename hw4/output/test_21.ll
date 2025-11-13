; generated from: oatprograms/globals7.oat
target triple = "x86_64-unknown-linux"
@arr = global { i64, [0 x i64] }* bitcast ({ i64, [0 x i64] }* @_garr_data259 to { i64, [0 x i64] }*)
@_garr_data259 = global { i64, [0 x i64] } { i64 0, [0 x i64] [  ] }

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid244 = alloca i64
  %_func_uid246 = alloca { i64, [0 x i8*] }*
  %_x250 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid244
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid246
  %_raw_array248 = call i64* @oat_alloc_array(i64 3)
  %_array249 = bitcast i64* %_raw_array248 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array249, { i64, [0 x i64] }** %_x250
  %_load_ref251 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x250
  store { i64, [0 x i64] }* %_load_ref251, { i64, [0 x i64] }** @arr
  %_load_ref253 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x250
  %_assign_ptr254 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref253, i32 0, i32 1, i32 2
  store i64 3, i64* %_assign_ptr254
  %_load_ref256 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @arr
  %_index_ptr257 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref256, i32 0, i32 1, i32 2
  %_index_load258 = load i64, i64* %_index_ptr257
  ret i64 %_index_load258
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
