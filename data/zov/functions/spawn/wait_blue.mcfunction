# ================================================
# ZOV — ТОЧКА ОЖИДАНИЯ СИНИХ (runs as @s)
# Одна фиксированная точка на каждую зону
# Используется в on_death и spec_lock
# ================================================

execute if score #global fl_active matches 1 run tp @s 43 70 -409
execute if score #global fl_active matches 2 run tp @s -9 72 -288
execute if score #global fl_active matches 3 run tp @s -189 64 -139
execute if score #global fl_active matches 4 run tp @s -387 63 -321
execute if score #global fl_active matches 5 run tp @s -439 64 42
execute if score #global fl_active matches 6 run tp @s -153 63 114
execute if score #global fl_active matches 7 run tp @s 309 99 205