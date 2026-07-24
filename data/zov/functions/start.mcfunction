# 
# ZOV — START (Старт заставки и инициализация)
#
# ⚠️ 1.20.1: команды /return не существует (добавлена в 1.20.2).
# Guard переписан через execute if ... run function — без return.
# 

scoreboard players set #canstart fl_math 1

execute if score #global fl_state matches 1 run scoreboard players set #canstart fl_math 0
execute if score #global fl_state matches 1 run tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Игра уже идёт!","color":"red"}]
execute if score #global fl_state matches 2 run scoreboard players set #canstart fl_math 0
execute if score #global fl_state matches 2 run tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Идёт подготовка!","color":"red"}]

# Вместо "unless canstart=1 run return 0" — прямой вызов тела
execute if score #canstart fl_math matches 1 run function zov:start_run