# 
# ZOV — СБРОС (Очистка игрового состояния)
# 

# Отмена всех запланированных задач
schedule clear zov:start/phase_2
schedule clear zov:start/phase_3
schedule clear zov:reset

# Очистка интерфейса катсцен (титры и звуки)
title @a clear
title @a reset
stopsound @a

# Сброс глобальных показателей
scoreboard players set #global fl_state 0
scoreboard players set #global fl_active 1
scoreboard players set #global fl_progress 0
scoreboard players set #global fl_captured 0
scoreboard players set #global fl_round 24000
scoreboard players set #global fl_timer 0
scoreboard players set #sound_timer fl_math 0
scoreboard players set #zone_state fl_math 0
scoreboard players set #boat_timer fl_math 0
scoreboard players set #prep_timer fl_math 0
scoreboard players set #prep_hud_timer fl_math 0
scoreboard players set #capture_cooldown fl_math 0

# Сброс флагов старта и пропуска
scoreboard players set #canstart fl_math 1
scoreboard players set #skip_intro fl_math 0
scoreboard players set #skip_prep fl_math 0

# Сброс таймера застоя и статуса артудара
scoreboard players set #zone_stall fl_math 0
scoreboard players set #strike_fired fl_math 0

# Очистка всех тегов игроков и сущностей
tag @a remove fl_waiting
tag @a remove fl_navigator
tag @a remove fl_holds_compass
tag @a remove fl_occupied
tag @a remove fl_b1
tag @a remove fl_b2
tag @a remove fl_selected
tag @a remove fl_boat_spawning
tag @a remove fl_unassigned
tag @a remove fl_to_assign
tag @a remove fl_tow_operator
tag @a remove fl_recipient

scoreboard players set @a fl_dead 0

team empty blue
team empty red

gamemode adventure @a
effect clear @a

function zov:cleanup

# Очистка блоков магнетита обеих точек A1 и остальных зон
setblock 37 62 -406 minecraft:stone
setblock -57 62 -414 minecraft:stone
setblock -5 71 -280 minecraft:stone
setblock -186 54 -164 minecraft:stone
setblock -404 55 -286 minecraft:stone
setblock -412 55 58 minecraft:stone
setblock -171 54 122 minecraft:stone
setblock 312 90 211 minecraft:stone

gamerule showDeathMessages false

bossbar set zov:progress value 24000
bossbar set zov:progress color white
bossbar set zov:progress name {"text":"Ожидание старта..."}
bossbar set zov:progress visible false

tp @a 47.42 48.00 -455.58 91 2

title @a times 10 40 10
title @a title [{"text":"Раунд окончен","color":"gray"}]

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Сброс выполнен.","color":"gray"}]