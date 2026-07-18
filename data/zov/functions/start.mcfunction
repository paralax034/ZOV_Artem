# ================================================
# ZOV — START (Старт заставки и инициализация)
# ================================================

scoreboard players set #canstart fl_math 1

execute if score #global fl_state matches 1 run scoreboard players set #canstart fl_math 0
execute if score #global fl_state matches 1 run tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Игра уже идёт!","color":"red"}]
execute if score #global fl_state matches 2 run scoreboard players set #canstart fl_math 0
execute if score #global fl_state matches 2 run tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Идёт подготовка!","color":"red"}]
execute unless score #canstart fl_math matches 1 run return 0

function zov:cleanup

gamerule keepInventory true
gamerule doImmediateRespawn true
gamerule naturalRegeneration true
gamerule showDeathMessages false

# Фаза подготовки — заставка идёт
scoreboard players set #global fl_state 2
scoreboard players set #global fl_active 1
scoreboard players set #global fl_progress 0
scoreboard players set #global fl_captured 0
scoreboard players set #global fl_round 24000
scoreboard players set #sound_timer fl_math 0
scoreboard players set #zone_state fl_math 0
scoreboard players set #prep_timer fl_math 0
scoreboard players set #prep_hud_timer fl_math 0
scoreboard players set #boat_timer fl_math 0

team modify red nametagVisibility hideForOtherTeams
team modify blue nametagVisibility hideForOtherTeams
team modify red deathMessageVisibility hideForOtherTeams
team modify blue deathMessageVisibility hideForOtherTeams

scoreboard players operation @a fl_prev_deaths = @a fl_deaths
scoreboard players set @a fl_dead 0
tag @a remove fl_waiting
tag @a remove fl_navigator
tag @a remove fl_special

# Настройка рандомного зерна спавна
execute store result score #spawn_index fl_math run time query gametime

weather clear
time set 0

# Все в спектатор — заставка
gamemode spectator @a

# Фаза 1: вид с позиции красных — атака на порт
execute in minecraft:overworld run tp @a 28.96 71.03 -829.25 -360.84 3.48

title @a times 10 80 10
title @a title [{"text":"БРИФИНГ","color":"gold","bold":true}]
title @a subtitle [{"text":"Красные атакуют порт на севере","color":"red"}]
tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Ваша цель — порт. Дистанция ~400 блоков на север.","color":"white"}]
tellraw @a[team=blue] [{"text":"[ZOV] ","color":"aqua","bold":true},{"text":"Противник атакует с юга. Оцените маршруты.","color":"white"}]

# Через 8 секунд — смена позиции обзора
schedule function zov:start/phase_2 8s