# 
# ZOV — TICK LOGIC (каждые 4 тика = 5 раз/сек)
# 

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

# --- 8. Проверка зоны + effects внутри ---
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

# 
# ZOV — КУЛДАУН ЗАХВАТА ТОЧЕК (1 МИНУТА)
# 
execute if score #capture_cooldown fl_math matches 1.. run scoreboard players remove #capture_cooldown fl_math 4

execute if score #capture_cooldown fl_math matches 1200 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Следующая точка заблокирована на ","color":"yellow"},{"text":"60 секунд!","color":"red","bold":true},{"text":" Подготовьте оборону.","color":"gray"}]
execute if score #capture_cooldown fl_math matches 1000 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"До разблокировки следующей точки: ","color":"yellow"},{"text":"50 секунд","color":"red","bold":true}]
execute if score #capture_cooldown fl_math matches 800 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"До разблокировки следующей точки: ","color":"yellow"},{"text":"40 секунд","color":"red","bold":true}]
execute if score #capture_cooldown fl_math matches 600 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"До разблокировки следующей точки: ","color":"yellow"},{"text":"30 секунд","color":"red","bold":true}]
execute if score #capture_cooldown fl_math matches 400 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"До разблокировки следующей точки: ","color":"yellow"},{"text":"20 секунд","color":"red","bold":true}]
execute if score #capture_cooldown fl_math matches 200 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"До разблокировки следующей точки: ","color":"yellow"},{"text":"10 секунд!","color":"red","bold":true}]
execute if score #capture_cooldown fl_math matches 4 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Следующая точка ","color":"yellow"},{"text":"РАЗБЛОКИРОВАНА!","color":"green","bold":true},{"text":" Начинайте штурм!","color":"white"}]

# 
# ZOV — СКРИПТОВОЕ СОБЫТИЕ: АРТПОДДЕРЖКА ПО ТЕКУЩЕЙ ТОЧКЕ
# 
# Накапливаем таймер застоя (4 тика за вызов), если на текущей точке удар еще не наносился
execute if score #strike_fired fl_math matches 0 run scoreboard players add #zone_stall fl_math 4

# Если штурм затянулся на 10 минут (12000 тиков), вызываем артудар
execute if score #strike_fired fl_math matches 0 if score #zone_stall fl_math matches 12000.. run function zov:internal/zone_strike