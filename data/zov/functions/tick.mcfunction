# ================================================
# ZOV — TICK (каждый тик, ~20 раз/сек)
#
# Что происходит каждый тик:
#   1. death_check  — мгновенная реакция на смерть
#   2. respawn_loop — только декремент fl_dead + триггер респауна
#   3. speclock     — принудительный TP спека (раз в 20 тиков)
#   4. tick_logic   — вся игровая логика (раз в 4 тика)
#
# respawn_hud (визуализация мёртвых) — в tick_logic каждые 4 тика
# compass_timer — инкремент здесь, вызов и сброс в tick_logic
# ================================================

# --- Детект смерти: каждый тик, только во время игры ---
execute if score #global fl_state matches 1 as @a run function zov:spawn/death_check

# --- Таймер мёртвых: каждый тик (только декремент + триггер) ---
execute as @a[tag=fl_waiting] run function zov:spawn/respawn_loop

# --- Блокировка позиции спека: раз в 20 тиков ---
scoreboard players add #speclock_timer fl_math 1
execute if score #speclock_timer fl_math matches 20.. as @a[tag=fl_waiting] run function zov:spawn/spec_lock
execute if score #speclock_timer fl_math matches 20.. run scoreboard players set #speclock_timer fl_math 0

# --- Инкремент таймера компаса: вызов и сброс в tick_logic ---
scoreboard players add #compass_timer fl_math 1

# --- Основная логика: раз в 4 тика ---
scoreboard players add #global fl_timer 1
execute if score #global fl_state matches 1 if score #global fl_timer matches 4.. run function zov:tick_logic
execute if score #global fl_timer matches 4.. run scoreboard players set #global fl_timer 0