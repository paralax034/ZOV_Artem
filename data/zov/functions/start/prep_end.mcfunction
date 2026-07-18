# ================================================
# ZOV — КОНЕЦ ПОДГОТОВКИ
# ================================================

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

tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Вперёд! Захватите точку ","color":"white"},{"text":"A1","color":"yellow","bold":true}]
tellraw @a[team=blue] [{"text":"[ZOV] ","color":"aqua","bold":true},{"text":"Они идут! Держите точку ","color":"white"},{"text":"A1","color":"yellow","bold":true}]