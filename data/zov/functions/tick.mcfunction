# ================================================
# ZOV — TICK (каждый тик)
# ================================================

execute as @a if score #global fl_state matches 1 run function zov:spawn/death_check
execute as @a[tag=fl_waiting] run function zov:spawn/respawn_loop

# Блокировка позиции спека раз в 20 тиков (не каждый тик — лаг у игроков с плохим интернетом)
scoreboard players add #speclock_timer fl_math 1
execute if score #speclock_timer fl_math matches 20.. as @a[tag=fl_waiting] run function zov:spawn/spec_lock
execute if score #speclock_timer fl_math matches 20.. run scoreboard players set #speclock_timer fl_math 0

# Основная логика каждые 4 тика
scoreboard players add #global fl_timer 1
execute if score #global fl_state matches 1 if score #global fl_timer matches 4.. run function zov:tick_logic
execute if score #global fl_timer matches 4.. run scoreboard players set #global fl_timer 0

# Компас раз в секунду при idle
scoreboard players add #compass_timer fl_math 1
execute if score #global fl_state matches 1 if score #zone_state fl_math matches 0 if score #compass_timer fl_math matches 20.. run function zov:nav/compass
execute if score #compass_timer fl_math matches 20.. run scoreboard players set #compass_timer fl_math 0