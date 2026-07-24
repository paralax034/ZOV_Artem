# 
# ZOV — ДИНАМИЧЕСКИЙ TP СИНИХ (ЗАЩИТА)
# Учитывает вариант точки A1 (#a1_variant)
# 

# Вычисляем случайный индекс для передового спавна
scoreboard players operation #spawn_rand fl_math = #spawn_index fl_math
scoreboard players operation #spawn_rand fl_math %= #4 fl_math

# --- A1 (ВАРИАНТ 0: ЗДАНИЕ 1) ---
execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 0 if score #zone_state fl_math matches 1 run spreadplayers 30 -366 2 15 under 80 false @s
execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 0 if score #zone_state fl_math matches 1 as @s[y=-100,dy=160] run tp @s ~ 72 ~

execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 0 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 0 run tp @s 43 70 -409
execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 0 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 1 run tp @s 27 70 -409
execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 0 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 2 run tp @s 45 74 -409
execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 0 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 3 run tp @s 33 74 -409

# --- A1 (ВАРИАНТ 1: ЗДАНИЕ 2) ---
execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 1 if score #zone_state fl_math matches 1 run spreadplayers -57 -414 2 15 under 80 false @s
execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 1 if score #zone_state fl_math matches 1 as @s[y=-100,dy=160] run tp @s ~ 71 ~

execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 1 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 0 run tp @s -61 70 -404
execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 1 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 1 run tp @s -57 71 -414
execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 1 unless score #zone_state fl_math matches 2 run tp @s -53 77 -404
execute if score #global fl_active matches 1 if score #a1_variant fl_math matches 1 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 3 run tp @s -56 74 -411


# --- A2 ---
execute if score #global fl_active matches 2 if score #zone_state fl_math matches 1 run spreadplayers -3 -239 2 15 under 80 false @s
execute if score #global fl_active matches 2 if score #zone_state fl_math matches 1 as @s[y=-100,dy=160] run tp @s ~ 76 ~

execute if score #global fl_active matches 2 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 0 run tp @s -9 72 -288
execute if score #global fl_active matches 2 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 1 run tp @s -2 76 -275
execute if score #global fl_active matches 2 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 2 run tp @s -3 80 -286
execute if score #global fl_active matches 2 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 3 run tp @s -8 84 -289


# --- A3 ---
execute if score #global fl_active matches 3 if score #zone_state fl_math matches 1 run spreadplayers -244 -207 2 15 under 80 false @s
execute if score #global fl_active matches 3 if score #zone_state fl_math matches 1 as @s[y=-100,dy=160] run tp @s ~ 64 ~

execute if score #global fl_active matches 3 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 0 run tp @s -189 64 -139
execute if score #global fl_active matches 3 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 1 run tp @s -198 63 -129
execute if score #global fl_active matches 3 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 2 run tp @s -183 64 -128
execute if score #global fl_active matches 3 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 3 run tp @s -63 63 -197


# --- A4 ---
execute if score #global fl_active matches 4 if score #zone_state fl_math matches 1 run spreadplayers -521 -264 2 15 under 80 false @s
execute if score #global fl_active matches 4 if score #zone_state fl_math matches 1 as @s[y=-100,dy=160] run tp @s ~ 63 ~

execute if score #global fl_active matches 4 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 0 run tp @s -387 63 -321
execute if score #global fl_active matches 4 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 1 run tp @s -385 64 -288
execute if score #global fl_active matches 4 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 2 run tp @s -388 74 -267
execute if score #global fl_active matches 4 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 3 run tp @s -383 64 -269


# --- A5 ---
execute if score #global fl_active matches 5 if score #zone_state fl_math matches 1 run spreadplayers -301 39 2 15 under 80 false @s
execute if score #global fl_active matches 5 if score #zone_state fl_math matches 1 as @s[y=-100,dy=160] run tp @s ~ 64 ~

execute if score #global fl_active matches 5 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 0 run tp @s -439 64 42
execute if score #global fl_active matches 5 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 1 run tp @s -376 64 43
execute if score #global fl_active matches 5 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 2 run tp @s -415 64 55
execute if score #global fl_active matches 5 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 3 run tp @s -402 64 68


# --- A6 ---
execute if score #global fl_active matches 6 if score #zone_state fl_math matches 1 run spreadplayers -85 8 2 15 under 80 false @s
execute if score #global fl_active matches 6 if score #zone_state fl_math matches 1 as @s[y=-100,dy=160] run tp @s ~ 64 ~

execute if score #global fl_active matches 6 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 0 run tp @s -153 63 114
execute if score #global fl_active matches 6 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 1 run tp @s -142 63 132
execute if score #global fl_active matches 6 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 2 run tp @s -146 63 103
execute if score #global fl_active matches 6 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 3 run tp @s -152 63 145


# --- A7 ---
execute if score #global fl_active matches 7 if score #zone_state fl_math matches 1 run spreadplayers 252 190 2 15 under 80 false @s
execute if score #global fl_active matches 7 if score #zone_state fl_math matches 1 as @s[y=-100,dy=160] run tp @s ~ 71 ~

execute if score #global fl_active matches 7 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 0 run tp @s 309 99 205
execute if score #global fl_active matches 7 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 1 run tp @s 355 99 216
execute if score #global fl_active matches 7 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 2 run tp @s 363 75 200
execute if score #global fl_active matches 7 unless score #zone_state fl_math matches 1 if score #spawn_rand fl_math matches 3 run tp @s 340 99 210