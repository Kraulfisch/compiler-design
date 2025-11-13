; generated from: oatprograms/gcd.oat
target triple = "x86_64-unknown-linux"
define i64 @gcd(i64 %a, i64 %b) {
  %_func_uid5209 = alloca i64
  %_func_uid5211 = alloca i64
  %_t5216 = alloca i64
  store i64 %a, i64* %_func_uid5209
  store i64 %b, i64* %_func_uid5211
  br label %_lpre5223
_lpre5223:
  %_load_val5213 = load i64, i64* %_func_uid5211
  %_binop5214 = icmp ne i64 %_load_val5213, 0
  br i1 %_binop5214, label %_lbody5224, label %_lpost5225
_lbody5224:
  %_load_val5215 = load i64, i64* %_func_uid5211
  store i64 %_load_val5215, i64* %_t5216
  %_load_val5217 = load i64, i64* %_func_uid5209
  %_load_val5218 = load i64, i64* %_func_uid5211
  %_call5219 = call i64 @mod(i64 %_load_val5217, i64 %_load_val5218)
  store i64 %_call5219, i64* %_func_uid5211
  %_load_val5221 = load i64, i64* %_t5216
  store i64 %_load_val5221, i64* %_func_uid5209
  br label %_lpre5223
_lpost5225:
  %_load_val5226 = load i64, i64* %_func_uid5209
  ret i64 %_load_val5226
}

define i64 @mod(i64 %a, i64 %b) {
  %_func_uid5191 = alloca i64
  %_func_uid5193 = alloca i64
  %_t5196 = alloca i64
  store i64 %a, i64* %_func_uid5191
  store i64 %b, i64* %_func_uid5193
  %_load_val5195 = load i64, i64* %_func_uid5191
  store i64 %_load_val5195, i64* %_t5196
  br label %_lpre5205
_lpre5205:
  %_load_val5197 = load i64, i64* %_t5196
  %_load_val5198 = load i64, i64* %_func_uid5193
  %_binop5199 = sub i64 %_load_val5197, %_load_val5198
  %_binop5200 = icmp sge i64 %_binop5199, 0
  br i1 %_binop5200, label %_lbody5206, label %_lpost5207
_lbody5206:
  %_load_val5201 = load i64, i64* %_t5196
  %_load_val5202 = load i64, i64* %_func_uid5193
  %_binop5203 = sub i64 %_load_val5201, %_load_val5202
  store i64 %_binop5203, i64* %_t5196
  br label %_lpre5205
_lpost5207:
  %_load_val5208 = load i64, i64* %_t5196
  ret i64 %_load_val5208
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid5182 = alloca i64
  %_func_uid5184 = alloca { i64, [0 x i8*] }*
  %_a5186 = alloca i64
  %_b5187 = alloca i64
  store i64 %argc, i64* %_func_uid5182
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid5184
  store i64 64, i64* %_a5186
  store i64 48, i64* %_b5187
  %_load_val5188 = load i64, i64* %_a5186
  %_load_val5189 = load i64, i64* %_b5187
  %_call5190 = call i64 @gcd(i64 %_load_val5188, i64 %_load_val5189)
  ret i64 %_call5190
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
