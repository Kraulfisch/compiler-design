; generated from: oatprograms/josh_joyce_test.oat
target triple = "x86_64-unknown-linux"
@arr1 = global { i64, [0 x i64] }* bitcast ({ i64, [4 x i64] }* @_garr_data5181 to { i64, [0 x i64] }*)
@_garr_data5181 = global { i64, [4 x i64] } { i64 4, [4 x i64] [ i64 1, i64 2, i64 3, i64 4 ] }
@arr2 = global { i64, [0 x i64] }* bitcast ({ i64, [4 x i64] }* @_garr_data5180 to { i64, [0 x i64] }*)
@_garr_data5180 = global { i64, [4 x i64] } { i64 4, [4 x i64] [ i64 1, i64 2, i64 3, i64 5 ] }

define i64 @arrcheck({ i64, [0 x i64] }* %ar1, { i64, [0 x i64] }* %ar2, i64 %len) {
  %_func_uid5149 = alloca { i64, [0 x i64] }*
  %_func_uid5151 = alloca { i64, [0 x i64] }*
  %_func_uid5153 = alloca i64
  %_val5155 = alloca i64
  %_i5156 = alloca i64
  store { i64, [0 x i64] }* %ar1, { i64, [0 x i64] }** %_func_uid5149
  store { i64, [0 x i64] }* %ar2, { i64, [0 x i64] }** %_func_uid5151
  store i64 %len, i64* %_func_uid5153
  store i64 0, i64* %_val5155
  store i64 0, i64* %_i5156
  br label %_lpre5176
_lpre5176:
  %_load_val5160 = load i64, i64* %_i5156
  %_load_val5161 = load i64, i64* %_func_uid5153
  %_binop5162 = icmp slt i64 %_load_val5160, %_load_val5161
  br i1 %_binop5162, label %_lbody5177, label %_lpost5178
_lbody5177:
  %_load_ref5163 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5149
  %_load_val5164 = load i64, i64* %_i5156
  %_index_ptr5165 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5163, i32 0, i32 1, i64 %_load_val5164
  %_index_load5166 = load i64, i64* %_index_ptr5165
  %_load_ref5167 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5151
  %_load_val5168 = load i64, i64* %_i5156
  %_index_ptr5169 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5167, i32 0, i32 1, i64 %_load_val5168
  %_index_load5170 = load i64, i64* %_index_ptr5169
  %_binop5171 = icmp ne i64 %_index_load5166, %_index_load5170
  br i1 %_binop5171, label %_lthen5173, label %_lelse5174
_lthen5173:
  store i64 1, i64* %_val5155
  br label %_lafter5175
_lelse5174:
  br label %_lafter5175
_lafter5175:
  %_load_val5157 = load i64, i64* %_i5156
  %_binop5158 = add i64 %_load_val5157, 1
  store i64 %_binop5158, i64* %_i5156
  br label %_lpre5176
_lpost5178:
  %_load_val5179 = load i64, i64* %_val5155
  ret i64 %_load_val5179
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid5135 = alloca i64
  %_func_uid5137 = alloca { i64, [0 x i8*] }*
  %_val5139 = alloca i64
  store i64 %argc, i64* %_func_uid5135
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid5137
  store i64 1, i64* %_val5139
  %_load_ref5140 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @arr1
  %_load_ref5141 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @arr2
  %_call5142 = call i64 @arrcheck({ i64, [0 x i64] }* %_load_ref5140, { i64, [0 x i64] }* %_load_ref5141, i64 4)
  %_binop5143 = icmp eq i64 %_call5142, 1
  br i1 %_binop5143, label %_lthen5145, label %_lelse5146
_lthen5145:
  store i64 0, i64* %_val5139
  br label %_lafter5147
_lelse5146:
  br label %_lafter5147
_lafter5147:
  %_load_val5148 = load i64, i64* %_val5139
  ret i64 %_load_val5148
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
