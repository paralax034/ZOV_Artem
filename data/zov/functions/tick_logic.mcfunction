# ================================================
# ZOV — TICK LOGIC (каждые 4 тика = 5 раз/сек)
# ================================================

# --- 1. Таймер раунда ---
scoreboard players remove #global fl_round 4

# --- 1a. Оповещения: чат + обратный отсчёт ---
function zov:internal/time_announce

# --- 2. Победа синих если время вышло ---
execute if score #global fl_round matches ..0 run function zov:win/blue

# --- 3. HUD мёртвых (каждые 4 тика) — до навигации ---
execute as @a[tag=fl_waiting] run function zov:spawn/respawn_hud

# --- 4. Навигация синих — низший приоритет actionbar ---
function zov:nav/blue_nav

# --- 5. Подсказка красным вне зоны ---
function zov:zone/wrong_zone

# --- 6. Инкремент объединенного таймера (вызывается каждые 4 тика) ---
scoreboard players add #timer_20 fl_math 1

# --- 7. Пакет 20-тиковых задач (выполняется за раз, только когда таймер равен 5) ---
execute if score #timer_20 fl_math matches 5.. run function zov:internal/update_compass_tag
execute if score #global fl_state matches 1 if score #zone_state fl_math matches 0 if score #timer_20 fl_math matches 5.. run function zov:nav/compass
execute if score #timer_20 fl_math matches 5.. run function zov:hud/bossbar
execute if score #timer_20 fl_math matches 5.. as @a[tag=fl_waiting] run function zov:spawn/spec_lock
execute if score #timer_20 fl_math matches 5.. run scoreboard players set #timer_20 fl_math 0

# --- 8. Проверка зоны + effects внутри (высший приоритет actionbar) ---
scoreboard players set #zone_state fl_math 0
execute if score #global fl_active matches 1 run function zov:zone/check_1
execute if score #global fl_active matches 2 run function zov:zone/check_2
execute if score #global fl_active matches 3 run function zov:zone/check_3
execute if score #global fl_active matches 4 run function zov:zone/check_4
execute if score #global fl_active matches 5 run function zov:zone/check_5
execute if score #global fl_active matches 6 run function zov:zone/check_6
execute if score #global fl_active matches 7 run function zov:zone/check_7

# --- 9. Лодки: раз в 60 секунд (настоящие 1200 тиков, шаг 4) ---
scoreboard players add #boat_timer fl_math 4
execute if score #boat_timer fl_math matches 1200.. run function zov:internal/boat_spawn
execute if score #boat_timer fl_math matches 1200.. run scoreboard players set #boat_timer fl_math 0