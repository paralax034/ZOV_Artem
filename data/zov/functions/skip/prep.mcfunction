# ================================================
# ZOV — ПРОПУСК ПОДГОТОВКИ (вызов в рантайме)
# /function zov:skip/prep
#
# Работает только пока идёт подготовка:
#   fl_state=2 — фаза подготовки активна
#   prep_timer > 0 — phase_3 уже запустила таймер подготовки
#
# Механика:
#   Ставим prep_timer=1. При следующем вызове prep_tick
#   (каждые 10 тиков шага) декремент уведёт таймер в ≤0
#   → prep_tick сам вызовет prep_end в том же тике.
#
# Совместимость с settings/skip_prep_on:
#   settings/skip_prep_on устанавливает флаг до старта.
#   phase_3 видит флаг → ставит prep_timer=10 сразу.
#   Этот файл нужен только для ручного пропуска в рантайме.
# ================================================

# Гуард: только во время фазы подготовки
execute unless score #global fl_state matches 2 run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Подготовка не идёт.","color":"red"}]
execute unless score #global fl_state matches 2 run return 0

# Гуард: заставка ещё идёт (prep_timer=0), подготовка не началась
# В этом случае нужен skip/intro, а не skip/prep
execute if score #prep_timer fl_math matches ..0 run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Подготовка ещё не началась — идёт заставка. Используй /function zov:skip/intro","color":"red"}]
execute if score #prep_timer fl_math matches ..0 run return 0

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Подготовка пропущена.","color":"gray"}]

# Ставим prep_timer=1 — prep_tick в следующем цикле
# уведёт его в ≤0 и вызовет prep_end автоматически
scoreboard players set #prep_timer fl_math 1