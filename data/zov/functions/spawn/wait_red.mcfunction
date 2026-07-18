# ================================================
# ZOV — ТОЧКА ОЖИДАНИЯ КРАСНЫХ (runs as @s)
# Одна фиксированная точка на каждый спавн
# Используется в on_death и spec_lock
#
# При смерти на базе (fl_captured=0) — показываем
# кликабельную подсказку про табличку лодок.
# ================================================

execute if score #global fl_captured matches 0 run tp @s 22 64 -816
execute if score #global fl_captured matches 1 run tp @s 43 70 -409
execute if score #global fl_captured matches 2 run tp @s -9 72 -288
execute if score #global fl_captured matches 3 run tp @s -189 64 -139
execute if score #global fl_captured matches 4 run tp @s -387 63 -321
execute if score #global fl_captured matches 5 run tp @s -439 64 42
execute if score #global fl_captured matches 6 run tp @s -153 63 114

# ── ПОДСКАЗКА ПРО ЛОДКИ ────────────────────────
# Показываем только пока система лодок активна (до захвата A1).
# Игрок видит это при каждой смерти — не пропустит.
# Кнопка [СТАТУС ЛОДОК] запускает /trigger fl_boat_status.
execute if score #global fl_captured matches 0 run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Нажмите табличку в порту или кликните: ","color":"gray"},{"text":"[СТАТУС ЛОДОК]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_boat_status"},"hoverEvent":{"action":"show_text","contents":"Проверить доступные лодки и расстояние до них"}}]