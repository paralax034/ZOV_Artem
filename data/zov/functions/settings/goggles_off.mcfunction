# 
# ZOV — НАСТРОЙКА: тепловизоры/ПНВ выключить
# /function zov:settings/goggles_off
# 

scoreboard players set #goggles_enabled fl_math 0
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Тепловизоры и ПНВ: ","color":"gray"},{"text":"ВЫКЛЮЧЕНЫ","color":"red","bold":true}]