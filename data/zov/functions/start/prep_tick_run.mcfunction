# ================================================
# ZOV — ТЕЛО ТИКА ПОДГОТОВКИ
# Вызывается только пока prep_timer > 0
# (это критично: старый guard с return не работал, и prep_end
#  мог вызываться преждевременно ещё во время заставки)
# ================================================

scoreboard players remove #prep_timer fl_math 10

execute as @a[team=red,tag=!fl_waiting] at @s if entity @s[z=-770,dz=30000770] run function zov:start/barrier_push_red
execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[z=-30000000,dz=29999474] run function zov:start/barrier_push_blue

execute store result bossbar zov:progress value run scoreboard players get #prep_timer fl_math

scoreboard players add #boat_timer fl_math 1
execute if score #boat_timer fl_math matches 1200.. run function zov:internal/boat_spawn
execute if score #boat_timer fl_math matches 1200.. run scoreboard players set #boat_timer fl_math 0

scoreboard players add #prep_hud_timer fl_math 1
execute if score #prep_hud_timer fl_math matches 20.. run function zov:start/prep_hud
execute if score #prep_hud_timer fl_math matches 20.. run scoreboard players set #prep_hud_timer fl_math 0

execute if score #prep_timer fl_math matches ..0 run function zov:start/prep_end