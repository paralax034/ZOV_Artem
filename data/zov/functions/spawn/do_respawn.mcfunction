# ================================================
# ZOV — ТЕЛЕПОРТ НА СПАВН (runs as @s)
#
# curios reset УБРАН — он снимал тепловизор с curios-слота,
# заставляя игрока вручную надевать заново каждый респаун.
# keepInventory=true сохраняет curios-слоты через смерть.
#
# Защита от дюпа: подсчёт очков, если > 1 → лишние убираются
# Очки выдаются ТОЛЬКО в start.mcfunction — здесь не выдаются
# ================================================

tag @s remove fl_waiting
gamemode survival @s

execute if entity @s[team=red] run function zov:spawn/tp_red
execute if entity @s[team=blue] run function zov:spawn/tp_blue

execute at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 1.0

# === ЗАЩИТА ОТ ДЮПА ТЕПЛОВИЗОРА ===
# Считаем очки в инвентаре (clear count 0 — не удаляет)
# Если больше 1 — убираем все и возвращаем 1
execute store result score #tmp_goggles fl_math run clear @s superbwarfare:thermal_imaging_goggles 0
execute if score #tmp_goggles fl_math matches 2.. run clear @s superbwarfare:thermal_imaging_goggles
execute if score #tmp_goggles fl_math matches 2.. run give @s superbwarfare:thermal_imaging_goggles 1

# === БРОНЕПЛАСТИНЫ: +1 только если < 2 ===
execute store result score @s fl_math run clear @s superbwarfare:armor_plate 0
execute if score @s fl_math matches ..1 run give @s superbwarfare:armor_plate 1

# === ХЛЕБ: +4 только если < 8, срезать до 8 ===
execute store result score @s fl_math run clear @s minecraft:bread 0
execute if score @s fl_math matches ..7 run give @s minecraft:bread 4
execute if score @s fl_math matches ..7 store result score #tmp_bread fl_math run clear @s minecraft:bread 0
execute if score @s fl_math matches ..7 if score #tmp_bread fl_math matches 9.. run clear @s minecraft:bread
execute if score @s fl_math matches ..7 if score #tmp_bread fl_math matches 9.. run give @s minecraft:bread 8

# === ПАТРОНЫ: +2 только если < 4 ===
execute store result score @s fl_math run clear @s superbwarfare:rifle_ammo_box 0
execute if score @s fl_math matches ..3 run give @s superbwarfare:rifle_ammo_box 2