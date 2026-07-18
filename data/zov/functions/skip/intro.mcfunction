# ================================================
# ZOV — ПРОПУСК ЗАСТАВКИ: диспетчер (без /return)
# /function zov:skip/intro
# ================================================

execute unless score #global fl_state matches 2 run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Заставка не идёт.","color":"red"}]

execute if score #global fl_state matches 2 unless score #prep_timer fl_math matches ..0 run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Заставка уже закончилась — идёт подготовка. Используй /function zov:skip/prep","color":"red"}]

execute if score #global fl_state matches 2 if score #prep_timer fl_math matches ..0 run function zov:skip/intro_run