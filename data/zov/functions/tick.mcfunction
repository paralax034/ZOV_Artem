# ================================================
# ZOV — TICK (Каждый игровой тик, ~20 раз в секунду)
# ================================================

# --- Детект смерти: только во время боя ---
execute if score #global fl_state matches 1 as @a run function zov:spawn/death_check

# --- Таймер мёртвых: каждый тик ---
execute as @a[tag=fl_waiting] run function zov:spawn/respawn_loop

# --- Фаза подготовки ---
execute if score #global fl_state matches 2 run function zov:start/prep_tick

# --- Основная логика: раз в 4 тика ---
scoreboard players add #global fl_timer 1
execute if score #global fl_state matches 1 if score #global fl_timer matches 4.. run function zov:tick_logic
execute if score #global fl_timer matches 4.. run scoreboard players set #global fl_timer 0

# ================================================
# ТРИГГЕР: СТАТУС ЛОДОК (fl_boat_status)
#
# Enable и обработка — только красным живым игрокам
# (tag=!fl_waiting). Спектаторы в ожидании респавна
# не могут вызвать статус и двигать лодки.
# Статус автоматически показывается при респавне
# из do_respawn — триггер нужен только для таблички.
# ================================================
execute if score #global fl_captured matches 0 as @a[team=red,tag=!fl_waiting] run scoreboard players enable @s fl_boat_status

execute if score #global fl_captured matches 0 as @a[team=red,tag=!fl_waiting,scores={fl_boat_status=1..}] run function zov:internal/boat_status
execute as @a[scores={fl_boat_status=1..}] run scoreboard players set @s fl_boat_status 0

# ================================================
# ТРИГГЕР: ВОЗВРАТ ЛОДКИ (fl_tp_boat)
#
# Только красным живым игрокам (tag=!fl_waiting).
# Спектатор в ожидании не должен двигать лодки —
# это сломало бы позицию лодки пока другой едет на ней.
# ================================================
execute if score #global fl_captured matches 0 as @a[team=red,tag=!fl_waiting] run scoreboard players enable @s fl_tp_boat

execute as @a[scores={fl_tp_boat=1..}] run function zov:internal/tp_boat_trigger