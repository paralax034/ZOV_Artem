# ================================================
# ZOV — ТЕЛЕПОРТ НА СПАВН С НАБОРОМ КЛАССА
# ================================================

tag @s remove fl_waiting
gamemode survival @s

scoreboard players add #spawn_index fl_math 1

execute if entity @s[team=red] run function zov:spawn/tp_red
execute if entity @s[team=blue] run function zov:spawn/tp_blue

execute at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 1.0

# === Защита от дюпа тепловизора (Использование #temp) ===
execute store result score #temp fl_math run clear @s superbwarfare:thermal_imaging_goggles 0
execute if score #temp fl_math matches 2.. run clear @s superbwarfare:thermal_imaging_goggles
execute if score #temp fl_math matches 2.. run give @s superbwarfare:thermal_imaging_goggles 1

# === Бронепластины ===
execute store result score @s fl_math run clear @s superbwarfare:armor_plate 0
execute if score @s fl_math matches ..1 run give @s superbwarfare:armor_plate 1

# === Хлеб (Использование #temp) ===
execute store result score @s fl_math run clear @s minecraft:bread 0
execute if score @s fl_math matches ..7 run give @s minecraft:bread 4
execute if score @s fl_math matches ..7 store result score #temp fl_math run clear @s minecraft:bread 0
execute if score @s fl_math matches ..7 if score #temp fl_math matches 9.. run clear @s minecraft:bread
execute if score @s fl_math matches ..7 if score #temp fl_math matches 9.. run give @s minecraft:bread 8

# === Патроны ===
execute store result score @s fl_math run clear @s superbwarfare:rifle_ammo_box 0
execute if score @s fl_math matches ..3 run give @s superbwarfare:rifle_ammo_box 2