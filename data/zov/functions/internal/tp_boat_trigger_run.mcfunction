# ================================================
# ZOV — ТЕЛО ВОЗВРАТА ЛОДКИ
#
# Занята → kill (пассажир НЕ телепортируется, просто спешивается
# на месте) + спавн замены. Свободна → обычный tp.
# ================================================

execute if score @s fl_tp_boat matches 1 run tag @e[type=minecraft:boat,tag=fl_b1,limit=1] add fl_selected
execute if score @s fl_tp_boat matches 2 run tag @e[type=minecraft:boat,tag=fl_b2,limit=1] add fl_selected

execute unless entity @e[type=minecraft:boat,tag=fl_selected] run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Лодка не найдена. Обновите статус — нажмите табличку ещё раз.","color":"red"}]

# Занята: убиваем (пассажир остаётся на месте), спавним замену
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=fl_occupied] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка была занята — пассажир высажен, лодка возвращена на базу.","color":"yellow"}]
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=fl_occupied] run kill @e[type=minecraft:boat,tag=fl_selected,limit=1]

execute if score @s fl_tp_boat matches 1 unless entity @e[type=minecraft:boat,tag=fl_selected] if entity @e[type=minecraft:boat,tag=fl_boat] run summon minecraft:boat 32 63 -801 {Type:"oak",Tags:["fl_boat","fl_b1"]}
execute if score @s fl_tp_boat matches 2 unless entity @e[type=minecraft:boat,tag=fl_selected] if entity @e[type=minecraft:boat,tag=fl_boat] run summon minecraft:boat 32 63 -801 {Type:"oak",Tags:["fl_boat","fl_b2"]}

execute if score @s fl_tp_boat matches 1 unless entity @e[type=minecraft:boat,tag=fl_selected] run spreadplayers 32 -801 2 10 false @e[type=minecraft:boat,tag=fl_b1,limit=1,sort=nearest]
execute if score @s fl_tp_boat matches 2 unless entity @e[type=minecraft:boat,tag=fl_selected] run spreadplayers 32 -801 2 10 false @e[type=minecraft:boat,tag=fl_b2,limit=1,sort=nearest]

# Свободна: обычный телепорт
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=!fl_occupied] run tp @e[type=minecraft:boat,tag=fl_selected,limit=1] 32 63 -801
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=!fl_occupied] run spreadplayers 32 -801 2 10 false @e[type=minecraft:boat,tag=fl_selected,limit=1]
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=!fl_occupied] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка успешно возвращена на базу!","color":"green"}]

tag @e[type=minecraft:boat,tag=fl_selected] remove fl_selected
scoreboard players set @s fl_tp_boat 0