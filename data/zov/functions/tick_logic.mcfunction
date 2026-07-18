# ================================================
# ZOV — TICK LOGIC (каждые 4 тика = 5 раз/сек)
#
# Порядок выполнения:
#   1. Таймер раунда + оповещения о времени
#   2. Проверка победы синих (время вышло)
#   3. Проверка активной зоны захвата
#   4. HUD мёртвых (каждые 4 тика)
#   5. Навигация синих
#   6. Тег компаса (раз в 20 тиков)
#   7. Подсказка красным вне зоны
#   8. Компас красным (раз в 20 тиков)
#   9. zone/effects — высший приоритет (из check_N)
#  10. Bossbar (раз в 20 тиков)
#  11. Лодки (раз в 60 сек)
# ================================================

# --- 1. Таймер раунда ---
scoreboard players remove #global fl_round 4

# --- 1a. Оповещения: чат + обратный отсчёт ---
function zov:internal/time_announce

# --- 2. Победа синих если время вышло ---
execute if score #global fl_round matches ..0 run function zov:win/blue

# --- 3. Проверка активной зоны ---
scoreboard players set #zone_state fl_math 0
execute if score #global fl_active matches 1 run function zov:zone/check_1
execute if score #global fl_active matches 2 run function zov:zone/check_2
execute if score #global fl_active matches 3 run function zov:zone/check_3
execute if score #global fl_active matches 4 run function zov:zone/check_4
execute if score #global fl_active matches 5 run function zov:zone/check_5
execute if score #global fl_active matches 6 run function zov:zone/check_6
execute if score #global fl_active matches 7 run function zov:zone/check_7

# --- 4. HUD мёртвых (каждые 4 тика) ---
execute as @a[tag=fl_waiting] run function zov:spawn/respawn_hud

# --- 5. Навигация синих (низший приоритет actionbar) ---
function zov:nav/blue_nav

# --- 6. Тег компаса раз в 20 тиков (ДО wrong_zone и compass) ---
execute if score #compass_timer fl_math matches 20.. run function zov:internal/update_compass_tag

# --- 7. Подсказка красным вне зоны ---
function zov:zone/wrong_zone

# --- 8. Компас раз в 20 тиков ---
execute if score #global fl_state matches 1 if score #zone_state fl_math matches 0 if score #compass_timer fl_math matches 20.. run function zov:nav/compass
execute if score #compass_timer fl_math matches 20.. run scoreboard players set #compass_timer fl_math 0

# --- 9. zone/effects — вызван внутри check_N ---

# --- 10. Bossbar: раз в 20 тиков ---
scoreboard players add #hud_timer fl_math 1
execute if score #hud_timer fl_math matches 5.. run function zov:hud/bossbar
execute if score #hud_timer fl_math matches 5.. run scoreboard players set #hud_timer fl_math 0

# --- 11. Лодки: раз в 60 секунд (300 вызовов × 4 тика = 1200 тиков) ---
scoreboard players add #boat_timer fl_math 1
execute if score #boat_timer fl_math matches 300.. run function zov:internal/boat_spawn
execute if score #boat_timer fl_math matches 300.. run scoreboard players set #boat_timer fl_math 0