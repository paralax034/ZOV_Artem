# 
# ZOV — НАСТРОЙКА: пропуск подготовки выключить
# /function zov:settings/skip_prep_off
# 

scoreboard players set #skip_prep fl_math 0
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Пропуск подготовки: ","color":"gray"},{"text":"ВЫКЛ","color":"red","bold":true}]