# ================================================
# ZOV — СТАРТ ФАЗА 1: вид с базы красных (8 сек)
# Вызывается только при skip_intro=0
# Не трогать — phase_2 и phase_3 стоят дальше по цепочке
# ================================================

gamemode spectator @a

execute in minecraft:overworld run tp @a 28.96 71.03 -829.25 -360.84 3.48

title @a times 10 80 10
title @a title [{"text":"БРИФИНГ","color":"gold","bold":true}]
title @a subtitle [{"text":"Красные атакуют порт на севере","color":"red"}]
tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Ваша цель — порт. Дистанция ~400 блоков на север.","color":"white"}]
tellraw @a[team=blue] [{"text":"[ZOV] ","color":"aqua","bold":true},{"text":"Противник атакует с юга. Оцените маршруты.","color":"white"}]

schedule function zov:start/phase_2 8s