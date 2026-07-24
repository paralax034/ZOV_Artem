# 
# ZOV — КОНЕЦ ПОДГОТОВКИ
# 

scoreboard players set #global fl_state 1
effect clear @a minecraft:resistance

bossbar set zov:progress color red
bossbar set zov:progress max 24000
bossbar set zov:progress value 24000
function zov:hud/bossbar_name
function zov:hud/bossbar

title @a times 10 50 10
title @a title [{"text":"БОЙ НАЧАЛСЯ","color":"red","bold":true}]
title @a subtitle [{"text":"Красные атакуют  •  Синие защищают","color":"white"}]

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Началась корабельная артподготовка перед высадкой десанта!","color":"red","italic":true}]

tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Вперёд! Захватите точку ","color":"white"},{"text":"A1","color":"yellow","bold":true}]
tellraw @a[team=blue] [{"text":"[ZOV] ","color":"aqua","bold":true},{"text":"Они идут! Держите точку ","color":"white"},{"text":"A1","color":"yellow","bold":true}]

# 50 снарядов, разброс 180б, шаг 30т, RANDOM, залп 2, азимут 250°-290° (корабли с запада), дистанция 400б
sbwt strike raw 46.18 67.00 -453.37 50 180 30 RANDOM 2 250 290 400