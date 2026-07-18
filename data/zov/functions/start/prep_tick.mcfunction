# ================================================
# ZOV — ТИК ПОДГОТОВКИ (Каждый тик при fl_state=2)
# ================================================

# Guard-условие
execute if score #prep_timer fl_math matches ..0 run return 0

# Декремент таймера
scoreboard players remove #prep_timer fl_math 10

# Красные барьер Z >= -770
execute as @a[team=red,tag=!fl_waiting] at @s if entity @s[z=-770,dz=30000770] run function zov:start/barrier_push_red

# Синие барьер Z <= -525
execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[z=-30000000,dz=29999474] run function zov:start/barrier_push_blue

# Боссбар
execute store result bossbar zov:progress value run scoreboard players get #prep_timer fl_math

# Спавн лодок во время подготовки (1200 тиков = 60 сек, шаг 1)
scoreboard players add #boat_timer fl_math 1
execute if score #boat_timer fl_math matches 1200.. run function zov:internal/boat_spawn
execute if score #boat_timer fl_math matches 1200.. run scoreboard players set #boat_timer fl_math 0

# Actionbar подготовки
scoreboard players add #prep_hud_timer fl_math 1
execute if score #prep_hud_timer fl_math matches 20.. run function zov:start/prep_hud
execute if score #prep_hud_timer fl_math matches 20.. run scoreboard players set #prep_hud_timer fl_math 0

# Завершение подготовки
execute if score #prep_timer fl_math matches ..0 run function zov:start/prep_end