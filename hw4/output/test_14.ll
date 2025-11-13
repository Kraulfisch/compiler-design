; generated from: oatprograms/easyrun10.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid149 = alloca i64
  %_func_uid151 = alloca { i64, [0 x i8*] }*
  %_x179 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_ans180 = alloca i64
  %_i181 = alloca i64
  store i64 %argc, i64* %_func_uid149
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid151
  %_raw_array153 = call i64* @oat_alloc_array(i64 4)
  %_array154 = bitcast i64* %_raw_array153 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array155 = call i64* @oat_alloc_array(i64 1)
  %_array156 = bitcast i64* %_raw_array155 to { i64, [0 x i64] }*
  %_arr_init_ptr157 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array156, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr157
  %_arr_init_ptr159 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array154, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array156, { i64, [0 x i64] }** %_arr_init_ptr159
  %_raw_array161 = call i64* @oat_alloc_array(i64 1)
  %_array162 = bitcast i64* %_raw_array161 to { i64, [0 x i64] }*
  %_arr_init_ptr163 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array162, i32 0, i32 1, i32 0
  store i64 2, i64* %_arr_init_ptr163
  %_arr_init_ptr165 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array154, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array162, { i64, [0 x i64] }** %_arr_init_ptr165
  %_raw_array167 = call i64* @oat_alloc_array(i64 1)
  %_array168 = bitcast i64* %_raw_array167 to { i64, [0 x i64] }*
  %_arr_init_ptr169 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array168, i32 0, i32 1, i32 0
  store i64 3, i64* %_arr_init_ptr169
  %_arr_init_ptr171 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array154, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array168, { i64, [0 x i64] }** %_arr_init_ptr171
  %_raw_array173 = call i64* @oat_alloc_array(i64 1)
  %_array174 = bitcast i64* %_raw_array173 to { i64, [0 x i64] }*
  %_arr_init_ptr175 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array174, i32 0, i32 1, i32 0
  store i64 4, i64* %_arr_init_ptr175
  %_arr_init_ptr177 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array154, i32 0, i32 1, i32 3
  store { i64, [0 x i64] }* %_array174, { i64, [0 x i64] }** %_arr_init_ptr177
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array154, { i64, [0 x { i64, [0 x i64] }*] }** %_x179
  store i64 0, i64* %_ans180
  store i64 0, i64* %_i181
  br label %_lpre196
_lpre196:
  %_load_val185 = load i64, i64* %_i181
  %_binop186 = icmp slt i64 %_load_val185, 4
  br i1 %_binop186, label %_lbody197, label %_lpost198
_lbody197:
  %_load_ref187 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_x179
  %_load_val188 = load i64, i64* %_i181
  %_index_ptr189 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref187, i32 0, i32 1, i64 %_load_val188
  %_index_load190 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr189
  %_index_ptr191 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load190, i32 0, i32 1, i32 0
  %_index_load192 = load i64, i64* %_index_ptr191
  %_load_val193 = load i64, i64* %_ans180
  %_binop194 = sub i64 %_index_load192, %_load_val193
  store i64 %_binop194, i64* %_ans180
  %_load_val182 = load i64, i64* %_i181
  %_binop183 = add i64 %_load_val182, 1
  store i64 %_binop183, i64* %_i181
  br label %_lpre196
_lpost198:
  %_uop199 = xor i64 5, -1
  %_binop200 = and i64 5, %_uop199
  %_binop201 = or i64 %_binop200, 0
  %_binop202 = icmp ne i64 %_binop201, 0
  br i1 %_binop202, label %_lthen206, label %_lelse207
_lthen206:
  %_load_val203 = load i64, i64* %_ans180
  ret i64 %_load_val203
_lelse207:
  %_load_val204 = load i64, i64* %_ans180
  %_uop205 = sub i64 0, %_load_val204
  ret i64 %_uop205
_lafter208:
  %_load_val209 = load i64, i64* %_ans180
  ret i64 %_load_val209
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
