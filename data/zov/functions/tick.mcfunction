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
# Только красные, только до захвата A1 (fl_captured=0),
# только в зоне базы у таблички.
# ⚠️ dx/dy/dz подобраны под центр базы 32 63 -801.
#    Если табличка стоит в другом месте — замени x/y/z/dx/dy/dz
#    на координаты с запасом ~15 блоков в каждую сторону.
# ================================================

# Разрешаем триггер только красным в зоне базы до захвата A1
execute if score #global fl_captured matches 0 as @a[team=red,x=17,y=58,z=-816,dx=30,dy=15,dz=30] run scoreboard players enable @s fl_boat_status

# Если кто-то активировал триггер — вызываем статус от его имени
# at @s не нужен: boat_status использует positioned для дистанций
execute if score #global fl_captured matches 0 as @a[team=red,scores={fl_boat_status=1..}] run function zov:internal/boat_status

# Сброс триггера (даже если гуард не прошёл — чтобы не накапливалось)
execute as @a[scores={fl_boat_status=1..}] run scoreboard players set @s fl_boat_status 0

# ================================================
# ТРИГГЕР: ВОЗВРАТ ЛОДКИ (fl_tp_boat)
# ================================================

# Активируем триггер для всех (boat_status сам выдаёт кнопки только нужным)
scoreboard players enable @a fl_tp_boat

# Если кто-то кликнул [ВЕРНУТЬ] в чате
execute as @a[scores={fl_tp_boat=1..}] run function zov:internal/tp_boat_trigger