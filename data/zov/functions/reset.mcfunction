# ================================================
# ZOV — СБРОС
# ================================================

scoreboard players set #global fl_state 0
scoreboard players set #global fl_active 1
scoreboard players set #global fl_progress 0
scoreboard players set #global fl_captured 0
scoreboard players set #global fl_round 24000
scoreboard players set #global fl_timer 0
scoreboard players set #sound_timer fl_math 0
scoreboard players set #zone_state fl_math 0

tag @a remove fl_waiting
scoreboard players set @a fl_dead 0

effect clear @a minecraft:resistance
effect clear @a minecraft:slowness
effect clear @a minecraft:mining_fatigue

gamemode adventure @a

# --- ОЧИСТКА КАРТЫ (техника, снаряды, мины, предметы) ---
function zov:cleanup

# Убираем lodestone блоки
setblock 37 62 -406 minecraft:stone
setblock -5 71 -280 minecraft:stone
setblock -186 54 -164 minecraft:stone
setblock -404 55 -286 minecraft:stone
setblock -412 55 58 minecraft:stone
setblock -171 54 122 minecraft:stone
setblock 312 90 211 minecraft:stone

bossbar set zov:progress value 24000
bossbar set zov:progress color white
bossbar set zov:progress name {"text":"Ожидание старта..."}
bossbar set zov:progress visible false

# Телепортируем всех на точку сбора
tp @a 50 48 -457 0 0

title @a times 10 40 10
title @a title [{"text":"Раунд окончен","color":"gray"}]
title @a subtitle [{"text":"/function zov:start","color":"yellow"}]

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Раунд сброшен.","color":"gray"}]