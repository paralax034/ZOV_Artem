# ================================================
# ZOV — TICK LOGIC (каждые 4 тика)
# Порядок actionbar (последний = высший приоритет):
#   1. wrong_zone (низший)
#   2. nav/compass (перекрывает wrong_zone)
#   3. zone/effects (высший, только при захвате)
# Respawn_loop пишет в своём цикле поверх wrong_zone
# ================================================

scoreboard players remove #global fl_round 4
execute if score #global fl_round matches ..0 run function zov:win/blue

# Сбрасываем zone_state
scoreboard players set #zone_state fl_math 0

execute if score #global fl_active matches 1 run function zov:zone/check_1
execute if score #global fl_active matches 2 run function zov:zone/check_2
execute if score #global fl_active matches 3 run function zov:zone/check_3
execute if score #global fl_active matches 4 run function zov:zone/check_4
execute if score #global fl_active matches 5 run function zov:zone/check_5
execute if score #global fl_active matches 6 run function zov:zone/check_6
execute if score #global fl_active matches 7 run function zov:zone/check_7

# 1. wrong_zone (самый низкий приоритет)
function zov:zone/wrong_zone

# 2. compass (перекрывает wrong_zone, только при idle и не fl_waiting)
execute if score #zone_state fl_math matches 0 run function zov:nav/compass

# 3. zone/effects перекрывает всё (вызывается внутри check_N)
# (уже вызван выше через check_N → effects)

function zov:hud/bossbar