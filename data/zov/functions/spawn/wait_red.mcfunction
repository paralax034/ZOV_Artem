# ================================================
# ZOV — ТОЧКА ОЖИДАНИЯ КРАСНЫХ (runs as @s)
# Одна фиксированная точка на каждый спавн (нет петли из 7 условий)
# Используется в on_death и spec_lock
# ================================================

execute if score #global fl_captured matches 0 run tp @s 22 64 -816
execute if score #global fl_captured matches 1 run tp @s 43 70 -409
execute if score #global fl_captured matches 2 run tp @s -9 72 -288
execute if score #global fl_captured matches 3 run tp @s -189 64 -139
execute if score #global fl_captured matches 4 run tp @s -387 63 -321
execute if score #global fl_captured matches 5 run tp @s -439 64 42
execute if score #global fl_captured matches 6 run tp @s -153 63 114