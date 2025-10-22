import time
from pymol import cmd
#import sys 


cmd.deprotect('all')
cmd.protect('pp')             # 你的选择可保留
cmd.set('sculpting', 1)
#cmd.set('sculpt_field_mask',3)
cmd.sculpt_activate('all')

cmd.translate( list(vec_BA_move), 'cys1', camera=0)
cmd.translate( list(vec_AB_move), 'cys2', camera=0)

t_end = time.time() + 3.0
while time.time() < t_end:
    cmd.sculpt_iterate('all', cycles=50)
    cmd.refresh()             # 有GUI时可见动画
    cmd.sync(0.1)             # 让PyMOL处理内部队列

cmd.set('sculpting', 0)
cmd.sculpt_deactivate('all')



