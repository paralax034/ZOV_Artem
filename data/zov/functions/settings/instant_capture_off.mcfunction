# 
# ZOV — НАСТРОЙКА: мгновенный захват выключить
# /function zov:settings/instant_capture_off
# 

scoreboard players set #instant_capture fl_math 0
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Мгновенный захват: ","color":"gray"},{"text":"ВЫКЛ","color":"red","bold":true}]