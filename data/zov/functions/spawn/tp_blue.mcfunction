# ================================================
# ZOV — TP СИНИХ: случайная из 4 точек (runs as @s)
# Рандом: gametime % 4 → 0..3
# ================================================

execute store result score #spawn_rand fl_math run time query gametime
scoreboard players operation #spawn_rand fl_math %= #4 fl_math

# --- A1 ---
execute if score #global fl_active matches 1 if score #spawn_rand fl_math matches 0 run tp @s 43 70 -409
execute if score #global fl_active matches 1 if score #spawn_rand fl_math matches 1 run tp @s 27 70 -409
execute if score #global fl_active matches 1 if score #spawn_rand fl_math matches 2 run tp @s 45 74 -409
execute if score #global fl_active matches 1 if score #spawn_rand fl_math matches 3 run tp @s 33 74 -409

# --- A2 ---
execute if score #global fl_active matches 2 if score #spawn_rand fl_math matches 0 run tp @s -9 72 -288
execute if score #global fl_active matches 2 if score #spawn_rand fl_math matches 1 run tp @s -2 76 -275
execute if score #global fl_active matches 2 if score #spawn_rand fl_math matches 2 run tp @s -3 80 -286
execute if score #global fl_active matches 2 if score #spawn_rand fl_math matches 3 run tp @s -8 84 -289

# --- A3 ---
execute if score #global fl_active matches 3 if score #spawn_rand fl_math matches 0 run tp @s -189 64 -139
execute if score #global fl_active matches 3 if score #spawn_rand fl_math matches 1 run tp @s -198 63 -129
execute if score #global fl_active matches 3 if score #spawn_rand fl_math matches 2 run tp @s -183 64 -128
execute if score #global fl_active matches 3 if score #spawn_rand fl_math matches 3 run tp @s -63 63 -197

# --- A4 ---
execute if score #global fl_active matches 4 if score #spawn_rand fl_math matches 0 run tp @s -387 63 -321
execute if score #global fl_active matches 4 if score #spawn_rand fl_math matches 1 run tp @s -385 64 -288
execute if score #global fl_active matches 4 if score #spawn_rand fl_math matches 2 run tp @s -388 74 -267
execute if score #global fl_active matches 4 if score #spawn_rand fl_math matches 3 run tp @s -383 64 -269

# --- A5 ---
execute if score #global fl_active matches 5 if score #spawn_rand fl_math matches 0 run tp @s -439 64 42
execute if score #global fl_active matches 5 if score #spawn_rand fl_math matches 1 run tp @s -439 64 42
execute if score #global fl_active matches 5 if score #spawn_rand fl_math matches 2 run tp @s -439 64 42
execute if score #global fl_active matches 5 if score #spawn_rand fl_math matches 3 run tp @s -376 64 43

# --- A6 ---
execute if score #global fl_active matches 6 if score #spawn_rand fl_math matches 0 run tp @s -153 63 114
execute if score #global fl_active matches 6 if score #spawn_rand fl_math matches 1 run tp @s -142 63 132
execute if score #global fl_active matches 6 if score #spawn_rand fl_math matches 2 run tp @s -146 63 103
execute if score #global fl_active matches 6 if score #spawn_rand fl_math matches 3 run tp @s -152 63 145

# --- A7 ---
execute if score #global fl_active matches 7 if score #spawn_rand fl_math matches 0 run tp @s 309 99 205
execute if score #global fl_active matches 7 if score #spawn_rand fl_math matches 1 run tp @s 355 99 216
execute if score #global fl_active matches 7 if score #spawn_rand fl_math matches 2 run tp @s 355 99 216
execute if score #global fl_active matches 7 if score #spawn_rand fl_math matches 3 run tp @s 363 75 200