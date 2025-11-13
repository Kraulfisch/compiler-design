; generated from: oatprograms/qsort.oat
target triple = "x86_64-unknown-linux"
define void @quick_sort({ i64, [0 x i64] }* %a, i64 %l, i64 %r) {
  %_func_uid3108 = alloca { i64, [0 x i64] }*
  %_func_uid3110 = alloca i64
  %_func_uid3112 = alloca i64
  %_j3114 = alloca i64
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_func_uid3108
  store i64 %l, i64* %_func_uid3110
  store i64 %r, i64* %_func_uid3112
  store i64 0, i64* %_j3114
  %_load_val3115 = load i64, i64* %_func_uid3110
  %_load_val3116 = load i64, i64* %_func_uid3112
  %_binop3117 = icmp slt i64 %_load_val3115, %_load_val3116
  br i1 %_binop3117, label %_lthen3133, label %_lelse3134
_lthen3133:
  %_load_ref3118 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3108
  %_load_val3119 = load i64, i64* %_func_uid3110
  %_load_val3120 = load i64, i64* %_func_uid3112
  %_call3121 = call i64 @partition({ i64, [0 x i64] }* %_load_ref3118, i64 %_load_val3119, i64 %_load_val3120)
  store i64 %_call3121, i64* %_j3114
  %_load_ref3123 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3108
  %_load_val3124 = load i64, i64* %_func_uid3110
  %_load_val3125 = load i64, i64* %_j3114
  %_binop3126 = sub i64 %_load_val3125, 1
  call void @quick_sort({ i64, [0 x i64] }* %_load_ref3123, i64 %_load_val3124, i64 %_binop3126)
  %_load_ref3128 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3108
  %_load_val3129 = load i64, i64* %_j3114
  %_binop3130 = add i64 %_load_val3129, 1
  %_load_val3131 = load i64, i64* %_func_uid3112
  call void @quick_sort({ i64, [0 x i64] }* %_load_ref3128, i64 %_binop3130, i64 %_load_val3131)
  br label %_lafter3135
_lelse3134:
  br label %_lafter3135
_lafter3135:
  ret void
}

define i64 @partition({ i64, [0 x i64] }* %a, i64 %l, i64 %r) {
  %_func_uid3002 = alloca { i64, [0 x i64] }*
  %_func_uid3004 = alloca i64
  %_func_uid3006 = alloca i64
  %_pivot3012 = alloca i64
  %_i3014 = alloca i64
  %_j3017 = alloca i64
  %_t3018 = alloca i64
  %_done3019 = alloca i64
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_func_uid3002
  store i64 %l, i64* %_func_uid3004
  store i64 %r, i64* %_func_uid3006
  %_load_ref3008 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3002
  %_load_val3009 = load i64, i64* %_func_uid3004
  %_index_ptr3010 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3008, i32 0, i32 1, i64 %_load_val3009
  %_index_load3011 = load i64, i64* %_index_ptr3010
  store i64 %_index_load3011, i64* %_pivot3012
  %_load_val3013 = load i64, i64* %_func_uid3004
  store i64 %_load_val3013, i64* %_i3014
  %_load_val3015 = load i64, i64* %_func_uid3006
  %_binop3016 = add i64 %_load_val3015, 1
  store i64 %_binop3016, i64* %_j3017
  store i64 0, i64* %_t3018
  store i64 0, i64* %_done3019
  br label %_lpre3086
_lpre3086:
  %_load_val3020 = load i64, i64* %_done3019
  %_binop3021 = icmp eq i64 %_load_val3020, 0
  br i1 %_binop3021, label %_lbody3087, label %_lpost3088
_lbody3087:
  %_load_val3022 = load i64, i64* %_i3014
  %_binop3023 = add i64 %_load_val3022, 1
  store i64 %_binop3023, i64* %_i3014
  br label %_lpre3038
_lpre3038:
  %_load_ref3025 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3002
  %_load_val3026 = load i64, i64* %_i3014
  %_index_ptr3027 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3025, i32 0, i32 1, i64 %_load_val3026
  %_index_load3028 = load i64, i64* %_index_ptr3027
  %_load_val3029 = load i64, i64* %_pivot3012
  %_binop3030 = icmp sle i64 %_index_load3028, %_load_val3029
  %_load_val3031 = load i64, i64* %_i3014
  %_load_val3032 = load i64, i64* %_func_uid3006
  %_binop3033 = icmp sle i64 %_load_val3031, %_load_val3032
  %_binop3034 = and i1 %_binop3030, %_binop3033
  br i1 %_binop3034, label %_lbody3039, label %_lpost3040
_lbody3039:
  %_load_val3035 = load i64, i64* %_i3014
  %_binop3036 = add i64 %_load_val3035, 1
  store i64 %_binop3036, i64* %_i3014
  br label %_lpre3038
_lpost3040:
  %_load_val3041 = load i64, i64* %_j3017
  %_binop3042 = sub i64 %_load_val3041, 1
  store i64 %_binop3042, i64* %_j3017
  br label %_lpre3053
_lpre3053:
  %_load_ref3044 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3002
  %_load_val3045 = load i64, i64* %_j3017
  %_index_ptr3046 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3044, i32 0, i32 1, i64 %_load_val3045
  %_index_load3047 = load i64, i64* %_index_ptr3046
  %_load_val3048 = load i64, i64* %_pivot3012
  %_binop3049 = icmp sgt i64 %_index_load3047, %_load_val3048
  br i1 %_binop3049, label %_lbody3054, label %_lpost3055
_lbody3054:
  %_load_val3050 = load i64, i64* %_j3017
  %_binop3051 = sub i64 %_load_val3050, 1
  store i64 %_binop3051, i64* %_j3017
  br label %_lpre3053
_lpost3055:
  %_load_val3056 = load i64, i64* %_i3014
  %_load_val3057 = load i64, i64* %_j3017
  %_binop3058 = icmp sge i64 %_load_val3056, %_load_val3057
  br i1 %_binop3058, label %_lthen3060, label %_lelse3061
_lthen3060:
  store i64 1, i64* %_done3019
  br label %_lafter3062
_lelse3061:
  br label %_lafter3062
_lafter3062:
  %_load_val3063 = load i64, i64* %_done3019
  %_binop3064 = icmp eq i64 %_load_val3063, 0
  br i1 %_binop3064, label %_lthen3083, label %_lelse3084
_lthen3083:
  %_load_ref3065 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3002
  %_load_val3066 = load i64, i64* %_i3014
  %_index_ptr3067 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3065, i32 0, i32 1, i64 %_load_val3066
  %_index_load3068 = load i64, i64* %_index_ptr3067
  store i64 %_index_load3068, i64* %_t3018
  %_load_ref3070 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3002
  %_load_val3071 = load i64, i64* %_i3014
  %_load_ref3072 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3002
  %_load_val3073 = load i64, i64* %_j3017
  %_index_ptr3074 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3072, i32 0, i32 1, i64 %_load_val3073
  %_index_load3075 = load i64, i64* %_index_ptr3074
  %_assign_ptr3076 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3070, i32 0, i32 1, i64 %_load_val3071
  store i64 %_index_load3075, i64* %_assign_ptr3076
  %_load_ref3078 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3002
  %_load_val3079 = load i64, i64* %_j3017
  %_load_val3080 = load i64, i64* %_t3018
  %_assign_ptr3081 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3078, i32 0, i32 1, i64 %_load_val3079
  store i64 %_load_val3080, i64* %_assign_ptr3081
  br label %_lafter3085
_lelse3084:
  br label %_lafter3085
_lafter3085:
  br label %_lpre3086
_lpost3088:
  %_load_ref3089 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3002
  %_load_val3090 = load i64, i64* %_func_uid3004
  %_index_ptr3091 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3089, i32 0, i32 1, i64 %_load_val3090
  %_index_load3092 = load i64, i64* %_index_ptr3091
  store i64 %_index_load3092, i64* %_t3018
  %_load_ref3094 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3002
  %_load_val3095 = load i64, i64* %_func_uid3004
  %_load_ref3096 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3002
  %_load_val3097 = load i64, i64* %_j3017
  %_index_ptr3098 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3096, i32 0, i32 1, i64 %_load_val3097
  %_index_load3099 = load i64, i64* %_index_ptr3098
  %_assign_ptr3100 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3094, i32 0, i32 1, i64 %_load_val3095
  store i64 %_index_load3099, i64* %_assign_ptr3100
  %_load_ref3102 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_func_uid3002
  %_load_val3103 = load i64, i64* %_j3017
  %_load_val3104 = load i64, i64* %_t3018
  %_assign_ptr3105 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load_ref3102, i32 0, i32 1, i64 %_load_val3103
  store i64 %_load_val3104, i64* %_assign_ptr3105
  %_load_val3107 = load i64, i64* %_j3017
  ret i64 %_load_val3107
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid2969 = alloca i64
  %_func_uid2971 = alloca { i64, [0 x i8*] }*
  %_a2993 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid2969
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid2971
  %_raw_array2973 = call i64* @oat_alloc_array(i64 9)
  %_array2974 = bitcast i64* %_raw_array2973 to { i64, [0 x i64] }*
  %_arr_init_ptr2975 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2974, i32 0, i32 1, i32 0
  store i64 107, i64* %_arr_init_ptr2975
  %_arr_init_ptr2977 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2974, i32 0, i32 1, i32 1
  store i64 112, i64* %_arr_init_ptr2977
  %_arr_init_ptr2979 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2974, i32 0, i32 1, i32 2
  store i64 121, i64* %_arr_init_ptr2979
  %_arr_init_ptr2981 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2974, i32 0, i32 1, i32 3
  store i64 102, i64* %_arr_init_ptr2981
  %_arr_init_ptr2983 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2974, i32 0, i32 1, i32 4
  store i64 123, i64* %_arr_init_ptr2983
  %_arr_init_ptr2985 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2974, i32 0, i32 1, i32 5
  store i64 115, i64* %_arr_init_ptr2985
  %_arr_init_ptr2987 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2974, i32 0, i32 1, i32 6
  store i64 104, i64* %_arr_init_ptr2987
  %_arr_init_ptr2989 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2974, i32 0, i32 1, i32 7
  store i64 111, i64* %_arr_init_ptr2989
  %_arr_init_ptr2991 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array2974, i32 0, i32 1, i32 8
  store i64 109, i64* %_arr_init_ptr2991
  store { i64, [0 x i64] }* %_array2974, { i64, [0 x i64] }** %_a2993
  %_load_ref2994 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2993
  %_call2995 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref2994)
  call void @print_string(i8* %_call2995)
  %_load_ref2997 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2993
  call void @quick_sort({ i64, [0 x i64] }* %_load_ref2997, i64 0, i64 8)
  %_load_ref2999 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a2993
  %_call3000 = call i8* @string_of_array({ i64, [0 x i64] }* %_load_ref2999)
  call void @print_string(i8* %_call3000)
  ret i64 255
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
