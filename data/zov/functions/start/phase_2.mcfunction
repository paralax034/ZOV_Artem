# 
# ZOV — СТАРТ ФАЗА 2: диспетчер (без /return, 1.20.1)
#
# Эта функция вызывается только по schedule из phase_1.
# Если skip_intro=1 — phase_1 вообще не запускалась,
# значит и schedule не было → phase_2 никогда не вызовется.
# Единственный оставшийся случай: skip/intro был вызван
# вручную ВО ВРЕМЯ phase_1, т.е. prep_timer уже > 0
# (phase_3 уже запущена) — нужно защититься от этого.
#
# Ветки:
#   prep_timer > 0        → phase_3 уже запущена вручную, молчим
#   prep_timer ≤ 0        → нормальная заставка, phase_2_run
# 

execute if score #prep_timer fl_math matches ..0 run function zov:start/phase_2_run