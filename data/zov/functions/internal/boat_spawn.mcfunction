# ================================================
# ZOV — СПАВН ЛОДКИ У БАЗЫ КРАСНЫХ
# Вызывается из tick_logic раз в 60 секунд
# Позиция: ~22 64 -807, разброс ±5 блоков через spreadplayers
# Лимит: 3 лодки в радиусе 100 блоков от базы
#
# 1.20.1: entity ID = minecraft:boat, тип дерева через NBT {Type:oak}
# ================================================

# Считаем лодки рядом с базой
execute store result score #boat_count fl_math positioned 22 64 -807 if entity @e[type=minecraft:boat,distance=..100]

# Если 3+ — не спавним
execute unless score #boat_count fl_math matches ..2 run scoreboard players set #boat_skip fl_math 1
execute if score #boat_count fl_math matches ..2 run scoreboard players set #boat_skip fl_math 0

# Маркер для случайной позиции через spreadplayers
execute if score #boat_skip fl_math matches 0 run summon minecraft:marker 22 64 -807 {Tags:["fl_boat_pos"]}
execute if score #boat_skip fl_math matches 0 run spreadplayers 22 -807 0 5 false @e[type=minecraft:marker,tag=fl_boat_pos,limit=1]
execute if score #boat_skip fl_math matches 0 at @e[type=minecraft:marker,tag=fl_boat_pos,limit=1] run summon minecraft:boat ~ ~ ~ {Type:"oak"}

# Удаляем маркер
kill @e[type=minecraft:marker,tag=fl_boat_pos]

# Оповещение красным
execute if score #boat_skip fl_math matches 0 run tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Лодка доставлена на базу!","color":"green"}]