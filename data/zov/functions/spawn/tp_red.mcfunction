# ================================================
# ZOV — ТП КРАСНЫХ НА СПАВН (runs as @s)
# Спавнятся на последней захваченной точке
# ================================================

# База (до первого захвата)
execute if score #global fl_captured matches 0 run tp @s 22 64 -816

# Захвачена A1 — спавн у A1
execute if score #global fl_captured matches 1 run tp @s 28 70 -408

# Захвачена A2
execute if score #global fl_captured matches 2 run tp @s -5 81 -280

# Захвачена A3
execute if score #global fl_captured matches 3 run tp @s -186 64 -164

# Захвачена A4
execute if score #global fl_captured matches 4 run tp @s -404 65 -286

# Захвачена A5
execute if score #global fl_captured matches 5 run tp @s -412 65 58

# Захвачена A6
execute if score #global fl_captured matches 6 run tp @s -171 64 122