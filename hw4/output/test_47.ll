; generated from: oatprograms/run42.oat
target triple = "x86_64-unknown-linux"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_func_uid834 = alloca i64
  %_func_uid836 = alloca { i64, [0 x i8*] }*
  %_a1852 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a2867 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a3882 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a4897 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a5906 = alloca { i64, [0 x i64] }*
  store i64 %argc, i64* %_func_uid834
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_func_uid836
  %_raw_array838 = call i64* @oat_alloc_array(i64 3)
  %_array839 = bitcast i64* %_raw_array838 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array840 = call i64* @oat_alloc_array(i64 1)
  %_array841 = bitcast i64* %_raw_array840 to { i64, [0 x i64] }*
  %_arr_init_ptr842 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array839, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array841, { i64, [0 x i64] }** %_arr_init_ptr842
  %_raw_array844 = call i64* @oat_alloc_array(i64 1)
  %_array845 = bitcast i64* %_raw_array844 to { i64, [0 x i64] }*
  %_arr_init_ptr846 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array839, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array845, { i64, [0 x i64] }** %_arr_init_ptr846
  %_raw_array848 = call i64* @oat_alloc_array(i64 1)
  %_array849 = bitcast i64* %_raw_array848 to { i64, [0 x i64] }*
  %_arr_init_ptr850 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array839, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array849, { i64, [0 x i64] }** %_arr_init_ptr850
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array839, { i64, [0 x { i64, [0 x i64] }*] }** %_a1852
  %_raw_array853 = call i64* @oat_alloc_array(i64 3)
  %_array854 = bitcast i64* %_raw_array853 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array855 = call i64* @oat_alloc_array(i64 1)
  %_array856 = bitcast i64* %_raw_array855 to { i64, [0 x i64] }*
  %_arr_init_ptr857 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array854, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array856, { i64, [0 x i64] }** %_arr_init_ptr857
  %_raw_array859 = call i64* @oat_alloc_array(i64 1)
  %_array860 = bitcast i64* %_raw_array859 to { i64, [0 x i64] }*
  %_arr_init_ptr861 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array854, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array860, { i64, [0 x i64] }** %_arr_init_ptr861
  %_raw_array863 = call i64* @oat_alloc_array(i64 1)
  %_array864 = bitcast i64* %_raw_array863 to { i64, [0 x i64] }*
  %_arr_init_ptr865 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array854, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array864, { i64, [0 x i64] }** %_arr_init_ptr865
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array854, { i64, [0 x { i64, [0 x i64] }*] }** %_a2867
  %_raw_array868 = call i64* @oat_alloc_array(i64 3)
  %_array869 = bitcast i64* %_raw_array868 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array870 = call i64* @oat_alloc_array(i64 1)
  %_array871 = bitcast i64* %_raw_array870 to { i64, [0 x i64] }*
  %_arr_init_ptr872 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array869, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array871, { i64, [0 x i64] }** %_arr_init_ptr872
  %_raw_array874 = call i64* @oat_alloc_array(i64 1)
  %_array875 = bitcast i64* %_raw_array874 to { i64, [0 x i64] }*
  %_arr_init_ptr876 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array869, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array875, { i64, [0 x i64] }** %_arr_init_ptr876
  %_raw_array878 = call i64* @oat_alloc_array(i64 1)
  %_array879 = bitcast i64* %_raw_array878 to { i64, [0 x i64] }*
  %_arr_init_ptr880 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array869, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array879, { i64, [0 x i64] }** %_arr_init_ptr880
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array869, { i64, [0 x { i64, [0 x i64] }*] }** %_a3882
  %_raw_array883 = call i64* @oat_alloc_array(i64 3)
  %_array884 = bitcast i64* %_raw_array883 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array885 = call i64* @oat_alloc_array(i64 1)
  %_array886 = bitcast i64* %_raw_array885 to { i64, [0 x i64] }*
  %_arr_init_ptr887 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array884, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array886, { i64, [0 x i64] }** %_arr_init_ptr887
  %_raw_array889 = call i64* @oat_alloc_array(i64 1)
  %_array890 = bitcast i64* %_raw_array889 to { i64, [0 x i64] }*
  %_arr_init_ptr891 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array884, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array890, { i64, [0 x i64] }** %_arr_init_ptr891
  %_raw_array893 = call i64* @oat_alloc_array(i64 1)
  %_array894 = bitcast i64* %_raw_array893 to { i64, [0 x i64] }*
  %_arr_init_ptr895 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array884, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array894, { i64, [0 x i64] }** %_arr_init_ptr895
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array884, { i64, [0 x { i64, [0 x i64] }*] }** %_a4897
  %_raw_array898 = call i64* @oat_alloc_array(i64 3)
  %_array899 = bitcast i64* %_raw_array898 to { i64, [0 x i64] }*
  %_arr_init_ptr900 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array899, i32 0, i32 1, i32 0
  store i64 0, i64* %_arr_init_ptr900
  %_arr_init_ptr902 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array899, i32 0, i32 1, i32 1
  store i64 1, i64* %_arr_init_ptr902
  %_arr_init_ptr904 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array899, i32 0, i32 1, i32 2
  store i64 2, i64* %_arr_init_ptr904
  store { i64, [0 x i64] }* %_array899, { i64, [0 x i64] }** %_a5906
  %_load_ref907 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2867
  %_load_ref908 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a5906
  %_assign_ptr909 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref907, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_load_ref908, { i64, [0 x i64] }** %_assign_ptr909
  %_load_ref911 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2867
  %_index_ptr912 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref911, i32 0, i32 1, i32 0
  %_index_load913 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr912
  %_assign_ptr914 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load913, i32 0, i32 1, i32 0
  store i64 2, i64* %_assign_ptr914
  %_load_ref916 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2867
  store { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref916, { i64, [0 x { i64, [0 x i64] }*] }** %_a1852
  %_load_ref918 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a1852
  store { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref918, { i64, [0 x { i64, [0 x i64] }*] }** %_a3882
  %_load_ref920 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a4897
  store { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref920, { i64, [0 x { i64, [0 x i64] }*] }** %_a1852
  %_load_ref922 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a3882
  store { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref922, { i64, [0 x { i64, [0 x i64] }*] }** %_a2867
  %_load_ref924 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a2867
  store { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref924, { i64, [0 x { i64, [0 x i64] }*] }** %_a4897
  %_load_ref926 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a4897
  store { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref926, { i64, [0 x { i64, [0 x i64] }*] }** %_a3882
  %_load_ref928 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a3882
  %_index_ptr929 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_load_ref928, i32 0, i32 1, i32 0
  %_index_load930 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr929
  %_index_ptr931 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_index_load930, i32 0, i32 1, i32 0
  %_index_load932 = load i64, i64* %_index_ptr931
  ret i64 %_index_load932
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
