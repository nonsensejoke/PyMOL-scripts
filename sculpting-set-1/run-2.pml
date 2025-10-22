import numpy as np  

load save1.pse

amplitude = 0.5 




select cys1, chain A and resi 218
select cys2, chain D and resi 220

unbond cys1 and name SG, cys2 and name SG


select loop, (chain A and resi 216-220) or (chain D and resi 218-222)  

select SA, name CA and cys1
select SB, name CA and cys2

# 获取选择 'A' 和 'B' 的坐标  
coords_A = cmd.get_coords('SA')  # 返回 Nx3 numpy 数组  
coords_B = cmd.get_coords('SB')  
  
# 提取单个原子的坐标（假设每个选择只有一个原子）  
pos_A = coords_A[0]  # [x, y, z]  
pos_B = coords_B[0]  # [x, y, z]  
  
# 计算向量  
vec_BA = pos_A - pos_B  # B-A 向量  
vec_AB = pos_B - pos_A  # A-B 向量  
  
# 归一化  
vec_BA_normalized = vec_BA / np.linalg.norm(vec_BA)  
vec_AB_normalized = vec_AB / np.linalg.norm(vec_AB)  
  
print("归一化的 B-A 向量:", vec_BA_normalized)  
print("归一化的 A-B 向量:", vec_AB_normalized)

select pp, all and not loop

deprotect all


 
vec_BA_move = vec_BA_normalized * amplitude
vec_AB_move = vec_AB_normalized * amplitude


#cmd.translate( list(vec_BA_move), 'cys1', camera=0)
#cmd.translate( list(vec_AB_move), 'cys2', camera=0)
run sculpting-2.py

run sculpting-2.py

run sculpting-2.py



save output-3move-b.pdb 