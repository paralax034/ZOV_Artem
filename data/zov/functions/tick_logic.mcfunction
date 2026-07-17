# ================================================
# ZOV — TICK LOGIC (каждые 4 тика)
# Приоритет actionbar (последний = высший):
#   1. blue_nav (низший — синие)
#   2. wrong_zone (красные вне зоны)
#   3. nav/compass (красные с компасом)
#   4. zone/effects (высший — при захвате, все)
# respawn_loop пишет поверх всего для fl_waiting
# ================================================

scoreboard players remove #global fl_round 4
execute if score #global fl_round matches ..0 run function zov:win/blue

scoreboard players set #zone_state fl_math 0

execute if score #global fl_active matches 1 run function zov:zone/check_1
execute if score #global fl_active matches 2 run function zov:zone/check_2
execute if score #global fl_active matches 3 run function zov:zone/check_3
execute if score #global fl_active matches 4 run function zov:zone/check_4
execute if score #global fl_active matches 5 run function zov:zone/check_5
execute if score #global fl_active matches 6 run function zov:zone/check_6
execute if score #global fl_active matches 7 run function zov:zone/check_7

# 1. Навигация синих (низший приоритет)
function zov:nav/blue_nav

# 2. wrong_zone для красных (перекрывает blue_nav)
function zov:zone/wrong_zone

# 3. Компас для красных (перекрывает wrong_zone)
execute if score #zone_state fl_math matches 0 run function zov:nav/compass

# 4. zone/effects — высший (вызван внутри check_N)

# Bossbar раз в 5 вызовов (каждые 20 тиков) через отдельный счётчик
scoreboard players add #hud_timer fl_math 1
execute if score #hud_timer fl_math matches 5.. run function zov:hud/bossbar
execute if score #hud_timer fl_math matches 5.. run scoreboard players set #hud_timer fl_math 0