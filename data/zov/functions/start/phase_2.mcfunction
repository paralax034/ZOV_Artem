# ================================================
# ZOV — СТАРТ ФАЗА 2: вид с позиции синих (8 сек)
# Вызывается через 8 сек после start (schedule)
# ================================================

# Если заставка пропущена через skip/intro — не выполнять
# phase_3 уже запущен напрямую из skip/intro
execute if score #skip_intro fl_math matches 1 run return 0

execute in minecraft:overworld run tp @a 82.35 98.76 -425.23 -596.76 33.50

title @a times 10 80 10
title @a title [{"text":"БРИФИНГ","color":"gold","bold":true}]
title @a subtitle [{"text":"Синие защищают порт","color":"aqua"}]
tellraw @a[team=blue] [{"text":"[ZOV] ","color":"aqua","bold":true},{"text":"Это ваш порт. Удержите его любой ценой!","color":"white"}]
tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Запомните ориентиры — скоро атака.","color":"white"}]

schedule function zov:start/phase_3 8s
