# ================================================
# ZOV — ОБНОВЛЕНИЕ СПАВНОВ ПОСЛЕ ЗАХВАТА
# Вызывается ДО zone/next, пока fl_active = захваченная точка
# Красные → на захваченную точку
# Синие   → на следующую (новую активную)
# ================================================

# === КРАСНЫЕ: спавн на только что захваченной точке ===
execute if score #global fl_active matches 1 run spawnpoint @a[team=red] 37 72 -406
execute if score #global fl_active matches 2 run spawnpoint @a[team=red] -5 81 -280
execute if score #global fl_active matches 3 run spawnpoint @a[team=red] -186 64 -164
execute if score #global fl_active matches 4 run spawnpoint @a[team=red] -404 65 -286
execute if score #global fl_active matches 5 run spawnpoint @a[team=red] -412 65 58
execute if score #global fl_active matches 6 run spawnpoint @a[team=red] -171 64 122

# === СИНИЕ: спавн смещается на СЛЕДУЮЩУЮ точку ===
# fl_active ещё не переключён, поэтому active=1 → синие идут на A2 и т.д.
execute if score #global fl_active matches 1 run spawnpoint @a[team=blue] -5 81 -280
execute if score #global fl_active matches 2 run spawnpoint @a[team=blue] -186 64 -164
execute if score #global fl_active matches 3 run spawnpoint @a[team=blue] -404 65 -286
execute if score #global fl_active matches 4 run spawnpoint @a[team=blue] -412 65 58
execute if score #global fl_active matches 5 run spawnpoint @a[team=blue] -171 64 122
execute if score #global fl_active matches 6 run spawnpoint @a[team=blue] 312 100 211