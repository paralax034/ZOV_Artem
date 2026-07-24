# 
# ZOV — НАСТРОЙКА: тепловизоры/ПНВ включить
# /function zov:settings/goggles_on
# 

scoreboard players set #goggles_enabled fl_math 1
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Тепловизоры и ПНВ: ","color":"gray"},{"text":"ВКЛЮЧЕНЫ","color":"green","bold":true}]