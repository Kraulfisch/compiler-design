; generated from: oatprograms/binary_gcd.oat
target triple = "x86_64-unknown-linux"
define i64 @binary_gcd(i64 %x, i64 %y) {
  %_func_uid4831 = alloca i64
  %_func_uid4833 = alloca i64
  store i64 %x, i64* %_func_uid4831
  store i64 %y, i64* %_func_uid4833
  %_load_val4835 = load i64, i64* %_func_uid4831
  %_load_val4836 = load i64, i64* %_func_uid4833
  %_binop4837 = icmp eq i64 %_load_val4835, %_load_val4836
  br i1 %_binop4837, label %_lthen4839, label %_lelse4840
_lthen4839:
  %_load_val4838 = load i64, i64* %_func_uid4831
  ret i64 %_load_val4838
_lelse4840:
  br label %_lafter4841
_lafter4841:
  %_load_val4842 = load i64, i64* %_func_uid4831
  %_binop4843 = icmp eq i64 %_load_val4842, 0
  br i1 %_binop4843, label %_lthen4845, label %_lelse4846
_lthen4845:
  %_load_val4844 = load i64, i64* %_func_uid4833
  ret i64 %_load_val4844
_lelse4846:
  br label %_lafter4847
_lafter4847:
  %_load_val4848 = load i64, i64* %_func_uid4833
  %_binop4849 = icmp eq i64 %_load_val4848, 0
  br i1 %_binop4849, label %_lthen4851, label %_lelse4852
_lthen4851:
  %_load_val4850 = load i64, i64* %_func_uid4831
  ret i64 %_load_val4850
_lelse4852:
  br label %_lafter4853
_lafter4853:
  %_load_val4854 = load i64, i64* %_func_uid4831
  %_uop4855 = xor i64 %_load_val4854, -1
  %_binop4856 = and i64 %_uop4855, 1
  %_binop4857 = icmp eq i64 %_binop4856, 1
  br i1 %_binop4857, label %_lthen4874, label %_lelse4875
_lthen4874:
  %_load_val4858 = load i64, i64* %_func_uid4833
  %_binop4859 = and i64 %_load_val4858, 1
  %_binop4860 = icmp eq i64 %_binop4859, 1
  br i1 %_binop4860, label %_lthen4871, label %_lelse4872
_lthen4871:
  %_load_val4861 = load i64, i64* %_func_uid4831
  %_binop4862 = lshr i64 %_load_val4861, 1
  %_load_val4863 = load i64, i64* %_func_uid4833
  %_call4864 = call i64 @binary_gcd(i64 %_binop4862, i64 %_load_val4863)
  ret i64 %_call4864
_lelse4872:
  %_load_val4865 = load i64, i64* %_func_uid4831
  %_binop4866 = lshr i64 %_load_val4865, 1
  %_load_val4867 = load i64, i64* %_func_uid4833
  %_binop4868 = lshr i64 %_load_val4867, 1
  %_call4869 = call i64 @binary_gcd(i64 %_binop4866, i64 %_binop4868)
  %_binop4870 = shl i64 %_call4869, 1
  ret i64 %_binop4870
_lafter4873:
  br label %_lafter4876
_lelse4875:
  br label %_lafter4876
_lafter4876:
  %_load_val4877 = load i64, i64* %_func_uid4833
  %_uop4878 = xor i64 %_load_val4877, -1
  %_binop4879 = and i64 %_uop4878, 1
  %_binop4880 = icmp eq i64 %_binop4879, 1
  br i1 %_binop4880, label %_lthen4885, label %_lelse4886
_lthen4885:
  %_load_val4881 = load i64, i64* %_func_uid4831
  %_load_val4882 = load i64, i64* %_func_uid4833
  %_binop4883 = lshr i64 %_load_val4882, 1
  %_call4884 = call i64 @binary_gcd(i64 %_load_val4881, i64 %_binop4883)
  ret i64 %_call4884
_lelse4886:
  br label %_lafter4887
_lafter4887:
  %_load_val4888 = load i64, i64* %_func_uid4831
  %_load_val4889 = load i64, i64* %_func_uid4833
  %_binop4890 = icmp sgt i64 %_load_val4888, %_load_val4889
  br i1 %_binop4890, label %_lthen4897, label %_lelse4898
_lthen4897:
  %_load_val4891 = load i64, i64* %_func_uid4831
  %_load_val4892 = load i64, i64* %_func_uid4833
  %_binop4893 = sub i64 %_load_val4891, %_load_val4892
  %_binop4894 = lshr i64 %_binop4893, 1
  %_load_val4895 = load i64, i64* %_func_uid4833
  %_call4896 = call i64 @binary_gcd(i64 %_binop4894, i64 %_load_val4895)
  ret i64 %_call4896
_lelse4898:
  br label %_lafter4899
_lafter4899:
  %_load_val4900 = load i64, i64* %_func_uid4833
  %_load_val4901 = load i64, i64* %_func_uid4831
  %_binop4902 = sub i64 %_load_val4900, %_load_val4901
  %_binop4903 = lshr i64 %_binop4902, 1
  %_load_val4904 = load i64, i64* %_func_uid4831
  %_call4905 = call i64 @binary_gcd(i64 %_binop4903, i64 %_load_val4904)
  ret i64 %_call4905
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid4822 = alloca i64
  %_func_uid4824 = alloca { i64, [0 x i8*] }*
  %_x4826 = alloca i64
  %_y4827 = alloca i64
  store i64 %argc, i64* %_func_uid4822
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid4824
  store i64 21, i64* %_x4826
  store i64 15, i64* %_y4827
  %_load_val4828 = load i64, i64* %_x4826
  %_load_val4829 = load i64, i64* %_y4827
  %_call4830 = call i64 @binary_gcd(i64 %_load_val4828, i64 %_load_val4829)
  ret i64 %_call4830
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
