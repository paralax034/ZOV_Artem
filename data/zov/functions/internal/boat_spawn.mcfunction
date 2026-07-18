# ================================================
# ZOV — СПАВН ЛОДКИ У БАЗЫ КРАСНЫХ
# Активен ТОЛЬКО пока A1 не захвачена (fl_captured=0)
# После захвата A1 функция выходит без действий
# Вызывается из tick_logic раз в 60 секунд
# ================================================

# Гуард: лодки нужны только на базе, база актуальна только до захвата A1
execute unless score #global fl_captured matches 0 run return 0

# Считаем лодки рядом с базой
execute store result score #boat_count fl_math if entity @e[type=minecraft:boat,x=22,y=64,z=-807,distance=..100]

# Если 3+ — не спавним
execute if score #boat_count fl_math matches 3.. run return 0

# Маркер для случайной позиции через spreadplayers
summon minecraft:marker 22 64 -807 {Tags:["fl_boat_pos"]}
spreadplayers 22 -807 0 5 false @e[type=minecraft:marker,tag=fl_boat_pos,limit=1]
execute at @e[type=minecraft:marker,tag=fl_boat_pos,limit=1] run summon minecraft:boat ~ ~ ~ {Type:"oak"}

# Удаляем маркер
kill @e[type=minecraft:marker,tag=fl_boat_pos]

tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Лодка доставлена на базу!","color":"green"}]