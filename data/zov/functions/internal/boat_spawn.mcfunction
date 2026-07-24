# 
# ZOV — СПАВН ЛОДКИ: диспетчер
# Вызывается раз в 60 сек из tick_logic и prep_tick_run.
#
# #boat_count считаем здесь один раз — чтобы не сканировать
# entity дважды (в диспетчере и в теле).
# Гуард fl_captured=0 здесь: нет смысла даже считать лодки
# если система мертва.
# 

execute if score #global fl_captured matches 0 store result score #boat_count fl_math if entity @e[type=minecraft:boat,tag=fl_boat]
execute if score #global fl_captured matches 0 if score #boat_count fl_math matches ..1 run function zov:internal/boat_spawn_run