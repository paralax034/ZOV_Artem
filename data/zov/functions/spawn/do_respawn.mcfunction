# ================================================
# ZOV — ТЕЛЕПОРТ НА СПАВН С НАБОРОМ КЛАССА
#
# Патроны: +50 rifle при каждом респавне.
# execute as @s уже активен — @s работает напрямую.
#
# Статус лодок: выводится сразу после респавна красным
# на базе (fl_captured=0). Игрок только что появился —
# самый удобный момент увидеть где лодки.
# ================================================

tag @s remove fl_waiting
gamemode survival @s

scoreboard players add #spawn_index fl_math 1

execute if entity @s[team=red] run function zov:spawn/tp_red
execute if entity @s[team=blue] run function zov:spawn/tp_blue

execute at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 1.0

# === Пополнение патронов при респавне ===
superbwarfare ammo add @s rifle 50

# === Защита от дюпа тепловизора ===
execute store result score #temp fl_math run clear @s superbwarfare:thermal_imaging_goggles 0
execute if score #temp fl_math matches 2.. run clear @s superbwarfare:thermal_imaging_goggles
execute if score #temp fl_math matches 2.. run give @s superbwarfare:thermal_imaging_goggles 1

# === Бронепластины ===
execute store result score @s fl_math run clear @s superbwarfare:armor_plate 0
execute if score @s fl_math matches ..1 run give @s superbwarfare:armor_plate 1

# === Хлеб ===
execute store result score @s fl_math run clear @s minecraft:bread 0
execute if score @s fl_math matches ..7 run give @s minecraft:bread 4
execute if score @s fl_math matches ..7 store result score #temp fl_math run clear @s minecraft:bread 0
execute if score @s fl_math matches ..7 if score #temp fl_math matches 9.. run clear @s minecraft:bread
execute if score @s fl_math matches ..7 if score #temp fl_math matches 9.. run give @s minecraft:bread 8

# === Статус лодок при респавне ===
# Показываем только красным пока система лодок активна.
# fl_waiting уже снят выше — игрок полноценно в игре.
# Вызов as @s: boat_status_run использует @s для tellraw.
execute if entity @s[team=red] if score #global fl_captured matches 0 run function zov:internal/boat_status