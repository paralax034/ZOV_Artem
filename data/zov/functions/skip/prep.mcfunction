# ================================================
# ZOV — ПРОПУСК ПОДГОТОВКИ: диспетчер (без /return)
# /function zov:skip/prep
# ================================================

execute unless score #global fl_state matches 2 run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Подготовка не идёт.","color":"red"}]

execute if score #global fl_state matches 2 if score #prep_timer fl_math matches ..0 run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Подготовка ещё не началась — идёт заставка. Используй /function zov:skip/intro","color":"red"}]

execute if score #global fl_state matches 2 unless score #prep_timer fl_math matches ..0 run function zov:skip/prep_run