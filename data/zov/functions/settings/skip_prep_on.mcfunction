# 
# ZOV — НАСТРОЙКА: пропуск подготовки включить
# /function zov:settings/skip_prep_on
# 

scoreboard players set #skip_prep fl_math 1
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Пропуск подготовки: ","color":"gray"},{"text":"ВКЛ","color":"green","bold":true}]