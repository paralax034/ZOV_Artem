# 
# ZOV — ТЕЛЕПОРТ НА СПАВН С НАБОРОМ КЛАССА
# runs as @s = возрождающийся игрок
# 

tag @s remove fl_waiting
gamemode survival @s

scoreboard players add #spawn_index fl_math 1

execute if entity @s[team=red] run function zov:spawn/tp_red
execute if entity @s[team=blue] run function zov:spawn/tp_blue

execute at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 1.0

# Эффекты при спавне
effect give @s minecraft:resistance 5 4 true
effect give @s minecraft:regeneration 5 4 true

#  Пополнение патронов при респавне 
superbwarfare ammo add @s rifle 50

#  Защита Curios от позднего захода и потери предметов 
curios replace iff 0 @s with superbwarfare:iff
execute if score #goggles_enabled fl_math matches 1 run curios replace head 0 @s with superbwarfare:thermal_imaging_goggles
execute if score #goggles_enabled fl_math matches 0 run curios replace head 0 @s with minecraft:air

#  Защита по РПГ и ракетам при смерти 
execute store result score @s fl_math run clear @s superbwarfare:rpg 0
execute if score @s fl_math matches 0 run give @s superbwarfare:rpg 1

execute store result score @s fl_math run clear @s superbwarfare:rpg_rocket_tbg 0
execute if score @s fl_math matches ..0 if entity @s[team=red] run give @s superbwarfare:rpg_rocket_tbg 2
execute if score @s fl_math matches ..0 if entity @s[team=blue] run give @s superbwarfare:rpg_rocket_tbg 2

#  Защита по бронепластинам при смерти (лимит 2) 
execute store result score @s fl_math run clear @s superbwarfare:armor_plate 0
execute if score @s fl_math matches ..1 run give @s superbwarfare:armor_plate 1

#  Защита по аптечкам при смерти (лимит 2) 
execute store result score @s fl_math run clear @s superbwarfare:medical_kit 0
execute if score @s fl_math matches ..1 run give @s superbwarfare:medical_kit 1

#  Хлеб (Безопасный лимит) 
execute store result score @s fl_math run clear @s minecraft:bread 0
execute if score @s fl_math matches ..3 run give @s minecraft:bread 4
execute if score @s fl_math matches 9.. run clear @s minecraft:bread
execute if score @s fl_math matches 9.. run give @s minecraft:bread 8

# Всегда фонарь
give @s minecraft:lantern 1

#  Статус лодок при респавне 
execute if entity @s[team=red] if score #global fl_captured matches 0 run function zov:internal/boat_status