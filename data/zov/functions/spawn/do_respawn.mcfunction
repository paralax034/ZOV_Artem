# ================================================
# ZOV — ТЕЛЕПОРТ НА СПАВН (runs as @s)
# Логика: если предмета >= макс — не трогаем вообще
# Срезка хлеба только если МЫ давали (было < 8)
# ================================================

tag @s remove fl_waiting
gamemode survival @s

execute if entity @s[team=red] run function zov:spawn/tp_red
execute if entity @s[team=blue] run function zov:spawn/tp_blue

execute at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 1.0

# === БРОНЕПЛАСТИНЫ: +1 только если < 2, иначе не трогать ===
execute store result score @s fl_math run clear @s superbwarfare:armor_plate 0
execute if score @s fl_math matches ..1 run give @s superbwarfare:armor_plate 1

# === ХЛЕБ: +4 только если < 8, иначе не трогать ===
# Запоминаем кол-во ДО give в @s fl_math
execute store result score @s fl_math run clear @s minecraft:bread 0
# Даём только если было < 8
execute if score @s fl_math matches ..7 run give @s minecraft:bread 4
# Проверяем результат ПОСЛЕ give отдельной переменной — @s fl_math всё ещё = до give
execute if score @s fl_math matches ..7 store result score #tmp_bread fl_math run clear @s minecraft:bread 0
# Если после give вышло > 8 — срезаем до 8
execute if score @s fl_math matches ..7 if score #tmp_bread fl_math matches 9.. run clear @s minecraft:bread
execute if score @s fl_math matches ..7 if score #tmp_bread fl_math matches 9.. run give @s minecraft:bread 8

# === ПАТРОНЫ: +1 только если < 2, иначе не трогать ===
execute store result score @s fl_math run clear @s superbwarfare:rifle_ammo_box 0
execute if score @s fl_math matches ..1 run give @s superbwarfare:rifle_ammo_box 1