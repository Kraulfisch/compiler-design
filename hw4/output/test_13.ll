; generated from: oatprograms/easyrun9.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid112 = alloca i64
  %_func_uid114 = alloca { i64, [0 x i8*] }*
  %_x126 = alloca { i64, [0 x i64] }*
  %_ans127 = alloca i64
  %_i128 = alloca i64
  store i64 %argc, i64* %_func_uid112
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid114
  %_raw_array116 = call i64* @oat_alloc_array(i64 4)
  %_array117 = bitcast i64* %_raw_array116 to { i64, [0 x i64] }*
  %_arr_init_ptr118 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array117, i32 0, i32 1, i32 0
  store i64 1, i64* %_arr_init_ptr118
  %_arr_init_ptr120 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array117, i32 0, i32 1, i32 1
  store i64 2, i64* %_arr_init_ptr120
  %_arr_init_ptr122 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array117, i32 0, i32 1, i32 2
  store i64 3, i64* %_arr_init_ptr122
  %_arr_init_ptr124 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array117, i32 0, i32 1, i32 3
  store i64 4, i64* %_arr_init_ptr124
  store { i64, [0 x i64] }* %_array117, { i64, [0 x i64] }** %_x126
  store i64 0, i64* %_ans127
  store i64 0, i64* %_i128
  br label %_lpre145
_lpre145:
  %_load_val132 = load i64, i64* %_i128
  %_binop133 = icmp slt i64 %_load_val132, 4
  br i1 %_binop133, label %_lbody146, label %_lpost147
_lbody146:
  %_load_ref134 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x126
  %_load_val135 = load i64, i64* %_i128
  %_index_ptr136 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref134, i32 0, i32 1, i64 %_load_val135
  %_index_load137 = load i64, i64* %_index_ptr136
  %_load_ref138 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x126
  %_load_val139 = load i64, i64* %_i128
  %_index_ptr140 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref138, i32 0, i32 1, i64 %_load_val139
  %_index_load141 = load i64, i64* %_index_ptr140
  %_uop142 = xor i64 %_index_load141, -1
  %_binop143 = mul i64 %_index_load137, %_uop142
  store i64 %_binop143, i64* %_ans127
  %_load_val129 = load i64, i64* %_i128
  %_binop130 = add i64 %_load_val129, 1
  store i64 %_binop130, i64* %_i128
  br label %_lpre145
_lpost147:
  %_load_val148 = load i64, i64* %_ans127
  ret i64 %_load_val148
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
