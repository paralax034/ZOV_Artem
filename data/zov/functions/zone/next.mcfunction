# 
# ZOV — СЛЕДУЮЩАЯ ТОЧКА (Обновлено: Сброс застоя артудара)
# 

# --- 1. Начисление динамического времени на основе переходов ---
# А1 -> А2 (~133 м): +5 минут (6000 тиков)
execute if score #global fl_active matches 1 run scoreboard players add #global fl_round 6000

# А2 -> А3 (~215 м): +6 минут (7200 тиков)
execute if score #global fl_active matches 2 run scoreboard players add #global fl_round 7200

# А3 -> А4 (~250 м): +7 минут (8400 тиков)
execute if score #global fl_active matches 3 run scoreboard players add #global fl_round 8400

# А4 -> А5 (~344 м): +10 минут (12000 тиков) — длинный мост
execute if score #global fl_active matches 4 run scoreboard players add #global fl_round 12000

# А5 -> А6 (~249 м): +7 минут (8400 тиков)
execute if score #global fl_active matches 5 run scoreboard players add #global fl_round 8400

# А6 -> А7 (~491 м): +12 минут (14400 тиков) — гигантский переход через всю карту к заводу
execute if score #global fl_active matches 6 run scoreboard players add #global fl_round 14400

# Ограничиваем максимальный запас времени раунда в 20 минут (24000 тиков)
execute if score #global fl_round matches 24001.. run scoreboard players set #global fl_round 24000

# Сообщение о бонусном времени
execute as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.5
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Точка захвачена! Добавлено дополнительное время на переход!","color":"green","bold":true}]


# --- 1b. Пополнение командирского целеуказателя при штурме A4 или A5 ---
execute if score #global fl_active matches 4..5 as @a[team=red,tag=fl_navigator] run sbwt strike reload @s 1


# --- 2. Сброс таймера застоя и статуса артудара для НОВОЙ точки ---
scoreboard players set #zone_stall fl_math 0
scoreboard players set #strike_fired fl_math 0


# --- 3. Запуск минутного кулдауна на захват следующей точки ---
# 1 минута = 1200 тиков
scoreboard players set #capture_cooldown fl_math 1200


# --- 4. Переключение активной зоны ---
scoreboard players add #global fl_active 1
scoreboard players set #global fl_progress 0
scoreboard players set #sound_timer fl_math 0


# --- 5. Принудительный выбор резервной точки перед телепортацией ---
scoreboard players set #zone_state fl_math 1


# --- 6. Телепортация Синей команды на новую точку по случайным спавнам ---
execute as @a[team=blue,tag=!fl_waiting] run function zov:spawn/tp_blue


# --- 7. Возврат нормального состояния точек ---
scoreboard players set #zone_state fl_math 0


# --- 8. Выдача оборонительного снаряжения Синим ---
execute as @a[team=blue,tag=!fl_waiting] run function zov:zone/blue_resupply


# --- 9. Обновление элементов навигации и интерфейса ---
function zov:nav/update
function zov:hud/bossbar_name
function zov:hud/bossbar