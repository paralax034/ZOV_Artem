# ================================================
# ZOV — СПАВН ЛОДКИ У БАЗЫ КРАСНЫХ
# Активен ТОЛЬКО пока A1 не захвачена (fl_captured=0)
#
# Лодки получают тег fl_boat при спавне.
# Подсчёт по тегу — не зависит от загрузки чанков:
# даже если игроки уплыли, тег виден везде в загруженных чанках.
# Лимит: 2 лодки одновременно.
#
# Спавн в радиусе 10 блоков от 32 63 -801
# spreadplayers: minDistance=2 исключает стак
# ================================================

# Гуард: только до захвата A1
execute unless score #global fl_captured matches 0 run return 0

# Считаем наши лодки по тегу — независимо от позиции
execute store result score #boat_count fl_math if entity @e[type=minecraft:boat,tag=fl_boat]

# Лимит 2 лодки
execute if score #boat_count fl_math matches 2.. run return 0

# Спавн + тег сразу
summon minecraft:boat 32 63 -801 {Type:"oak",Tags:["fl_boat"]}
spreadplayers 32 -801 2 10 false @e[type=minecraft:boat,tag=fl_boat,limit=1,sort=nearest]

tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Лодка доставлена на базу!","color":"green"}]