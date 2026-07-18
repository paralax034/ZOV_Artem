# ================================================
# ZOV — СЛУЧАЙНЫЙ СПАВН КРАСНЫХ (runs as @s)
# П-3: gametime % 4 заменён на #spawn_index % 4
# Каждый вызов do_respawn инкрементирует #spawn_index →
# одновременные респауны получают разные точки спавна
# ================================================

# Вычисляем индекс для ЭТОГО игрока
scoreboard players operation #spawn_rand fl_math = #spawn_index fl_math
scoreboard players operation #spawn_rand fl_math %= #4 fl_math

# --- База (до первого захвата) ---
execute if score #global fl_captured matches 0 if score #spawn_rand fl_math matches 0 run tp @s 17 64 -817
execute if score #global fl_captured matches 0 if score #spawn_rand fl_math matches 1 run tp @s 4 71 -828
execute if score #global fl_captured matches 0 if score #spawn_rand fl_math matches 2 run tp @s -17 63 -789
execute if score #global fl_captured matches 0 if score #spawn_rand fl_math matches 3 run tp @s -36 69 -840

# --- Захвачена A1 ---
execute if score #global fl_captured matches 1 if score #spawn_rand fl_math matches 0 run tp @s 43 70 -409
execute if score #global fl_captured matches 1 if score #spawn_rand fl_math matches 1 run tp @s 27 70 -409
execute if score #global fl_captured matches 1 if score #spawn_rand fl_math matches 2 run tp @s 45 74 -409
execute if score #global fl_captured matches 1 if score #spawn_rand fl_math matches 3 run tp @s 33 74 -409

# --- Захвачена A2 ---
execute if score #global fl_captured matches 2 if score #spawn_rand fl_math matches 0 run tp @s -9 72 -288
execute if score #global fl_captured matches 2 if score #spawn_rand fl_math matches 1 run tp @s -2 76 -275
execute if score #global fl_captured matches 2 if score #spawn_rand fl_math matches 2 run tp @s -3 80 -286
execute if score #global fl_captured matches 2 if score #spawn_rand fl_math matches 3 run tp @s -8 84 -289

# --- Захвачена A3 ---
execute if score #global fl_captured matches 3 if score #spawn_rand fl_math matches 0 run tp @s -189 64 -139
execute if score #global fl_captured matches 3 if score #spawn_rand fl_math matches 1 run tp @s -198 63 -129
execute if score #global fl_captured matches 3 if score #spawn_rand fl_math matches 2 run tp @s -183 64 -128
execute if score #global fl_captured matches 3 if score #spawn_rand fl_math matches 3 run tp @s -63 63 -197

# --- Захвачена A4 ---
execute if score #global fl_captured matches 4 if score #spawn_rand fl_math matches 0 run tp @s -387 63 -321
execute if score #global fl_captured matches 4 if score #spawn_rand fl_math matches 1 run tp @s -385 64 -288
execute if score #global fl_captured matches 4 if score #spawn_rand fl_math matches 2 run tp @s -388 74 -267
execute if score #global fl_captured matches 4 if score #spawn_rand fl_math matches 3 run tp @s -383 64 -269

# --- Захвачена A5 (П-4: все 4 точки разные) ---
execute if score #global fl_captured matches 5 if score #spawn_rand fl_math matches 0 run tp @s -439 64 42
execute if score #global fl_captured matches 5 if score #spawn_rand fl_math matches 1 run tp @s -376 64 43
execute if score #global fl_captured matches 5 if score #spawn_rand fl_math matches 2 run tp @s -415 64 55
execute if score #global fl_captured matches 5 if score #spawn_rand fl_math matches 3 run tp @s -402 64 68

# --- Захвачена A6 ---
execute if score #global fl_captured matches 6 if score #spawn_rand fl_math matches 0 run tp @s -153 63 114
execute if score #global fl_captured matches 6 if score #spawn_rand fl_math matches 1 run tp @s -142 63 132
execute if score #global fl_captured matches 6 if score #spawn_rand fl_math matches 2 run tp @s -146 63 103
execute if score #global fl_captured matches 6 if score #spawn_rand fl_math matches 3 run tp @s -152 63 145