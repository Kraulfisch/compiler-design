; generated from: oatprograms/gnomesort.oat
target triple = "x86_64-unknown-linux"
define void @gnomeSort({ i64, [0 x i64] }* %a, i64 %len) {
  %_func_uid5072 = alloca { i64, [0 x i64] }*
  %_func_uid5074 = alloca i64
  %_i5076 = alloca i64
  %_j5077 = alloca i64
  %_tmp5101 = alloca i64
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_func_uid5072
  store i64 %len, i64* %_func_uid5074
  store i64 1, i64* %_i5076
  store i64 2, i64* %_j5077
  br label %_lpre5132
_lpre5132:
  %_load_val5078 = load i64, i64* %_i5076
  %_load_val5079 = load i64, i64* %_func_uid5074
  %_binop5080 = icmp slt i64 %_load_val5078, %_load_val5079
  br i1 %_binop5080, label %_lbody5133, label %_lpost5134
_lbody5133:
  %_load_ref5081 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5072
  %_load_val5082 = load i64, i64* %_i5076
  %_binop5083 = sub i64 %_load_val5082, 1
  %_index_ptr5084 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5081, i32 0, i32 1, i64 %_binop5083
  %_index_load5085 = load i64, i64* %_index_ptr5084
  %_load_ref5086 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5072
  %_load_val5087 = load i64, i64* %_i5076
  %_index_ptr5088 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5086, i32 0, i32 1, i64 %_load_val5087
  %_index_load5089 = load i64, i64* %_index_ptr5088
  %_binop5090 = icmp sle i64 %_index_load5085, %_index_load5089
  br i1 %_binop5090, label %_lthen5129, label %_lelse5130
_lthen5129:
  %_load_val5091 = load i64, i64* %_j5077
  store i64 %_load_val5091, i64* %_i5076
  %_load_val5093 = load i64, i64* %_j5077
  %_binop5094 = add i64 %_load_val5093, 1
  store i64 %_binop5094, i64* %_j5077
  br label %_lafter5131
_lelse5130:
  %_load_ref5096 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5072
  %_load_val5097 = load i64, i64* %_i5076
  %_binop5098 = sub i64 %_load_val5097, 1
  %_index_ptr5099 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5096, i32 0, i32 1, i64 %_binop5098
  %_index_load5100 = load i64, i64* %_index_ptr5099
  store i64 %_index_load5100, i64* %_tmp5101
  %_load_ref5102 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5072
  %_load_val5103 = load i64, i64* %_i5076
  %_binop5104 = sub i64 %_load_val5103, 1
  %_load_ref5105 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5072
  %_load_val5106 = load i64, i64* %_i5076
  %_index_ptr5107 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5105, i32 0, i32 1, i64 %_load_val5106
  %_index_load5108 = load i64, i64* %_index_ptr5107
  %_assign_ptr5109 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5102, i32 0, i32 1, i64 %_binop5104
  store i64 %_index_load5108, i64* %_assign_ptr5109
  %_load_ref5111 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid5072
  %_load_val5112 = load i64, i64* %_i5076
  %_load_val5113 = load i64, i64* %_tmp5101
  %_assign_ptr5114 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5111, i32 0, i32 1, i64 %_load_val5112
  store i64 %_load_val5113, i64* %_assign_ptr5114
  %_load_val5116 = load i64, i64* %_i5076
  %_binop5117 = sub i64 %_load_val5116, 1
  store i64 %_binop5117, i64* %_i5076
  %_load_val5119 = load i64, i64* %_i5076
  %_binop5120 = icmp eq i64 %_load_val5119, 0
  br i1 %_binop5120, label %_lthen5126, label %_lelse5127
_lthen5126:
  %_load_val5121 = load i64, i64* %_j5077
  store i64 %_load_val5121, i64* %_i5076
  %_load_val5123 = load i64, i64* %_j5077
  %_binop5124 = add i64 %_load_val5123, 1
  store i64 %_binop5124, i64* %_j5077
  br label %_lafter5128
_lelse5127:
  br label %_lafter5128
_lafter5128:
  br label %_lafter5131
_lafter5131:
  br label %_lpre5132
_lpost5134:
  ret void
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid5031 = alloca i64
  %_func_uid5033 = alloca { i64, [0 x i8*] }*
  %_arr5053 = alloca { i64, [0 x i64] }*
  %_len5054 = alloca i64
  %_i5058 = alloca i64
  store i64 %argc, i64* %_func_uid5031
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid5033
  %_raw_array5035 = call i64* @oat_alloc_array(i64 8)
  %_array5036 = bitcast i64* %_raw_array5035 to { i64, [0 x i64] }*
  %_arr_init_ptr5037 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5036, i32 0, i32 1, i32 0
  store i64 5, i64* %_arr_init_ptr5037
  %_arr_init_ptr5039 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5036, i32 0, i32 1, i32 1
  store i64 200, i64* %_arr_init_ptr5039
  %_arr_init_ptr5041 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5036, i32 0, i32 1, i32 2
  store i64 1, i64* %_arr_init_ptr5041
  %_arr_init_ptr5043 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5036, i32 0, i32 1, i32 3
  store i64 65, i64* %_arr_init_ptr5043
  %_arr_init_ptr5045 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5036, i32 0, i32 1, i32 4
  store i64 30, i64* %_arr_init_ptr5045
  %_arr_init_ptr5047 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5036, i32 0, i32 1, i32 5
  store i64 99, i64* %_arr_init_ptr5047
  %_arr_init_ptr5049 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5036, i32 0, i32 1, i32 6
  store i64 2, i64* %_arr_init_ptr5049
  %_arr_init_ptr5051 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5036, i32 0, i32 1, i32 7
  store i64 0, i64* %_arr_init_ptr5051
  store { i64, [0 x i64] }* %_array5036, { i64, [0 x i64] }** %_arr5053
  store i64 8, i64* %_len5054
  %_load_ref5055 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5053
  %_load_val5056 = load i64, i64* %_len5054
  call void @gnomeSort({ i64, [0 x i64] }* %_load_ref5055, i64 %_load_val5056)
  store i64 0, i64* %_i5058
  br label %_lpre5069
_lpre5069:
  %_load_val5062 = load i64, i64* %_i5058
  %_binop5063 = icmp slt i64 %_load_val5062, 8
  br i1 %_binop5063, label %_lbody5070, label %_lpost5071
_lbody5070:
  %_load_ref5064 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5053
  %_load_val5065 = load i64, i64* %_i5058
  %_index_ptr5066 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref5064, i32 0, i32 1, i64 %_load_val5065
  %_index_load5067 = load i64, i64* %_index_ptr5066
  call void @print_int(i64 %_index_load5067)
  %_load_val5059 = load i64, i64* %_i5058
  %_binop5060 = add i64 %_load_val5059, 1
  store i64 %_binop5060, i64* %_i5058
  br label %_lpre5069
_lpost5071:
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
