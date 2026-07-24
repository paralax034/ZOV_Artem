# 
# ZOV — ТИК ПОДГОТОВКИ: диспетчер (без /return)
# Вызывается каждый тик при fl_state=2
# 

execute unless score #prep_timer fl_math matches ..0 run function zov:start/prep_tick_run