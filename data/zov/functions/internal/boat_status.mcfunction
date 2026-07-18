# ================================================
# ZOV — СТАТУС ЛОДОК (вызывается по клику таблички)
# runs as @s = красный игрок на базе
#
# Гуард: только до захвата A1 (fl_captured=0)
# Дистанции считаются от точки базы 32 63 -801
# через positioned — не от позиции игрока.
#
# Занятость: on vehicle → тег fl_occupied на лодке.
# Это единственный способ без NBT в 1.20.1.
# ================================================

# ── ГУАРД ──────────────────────────────────────
# Система лодок умирает вместе с захватом A1
execute unless score #global fl_captured matches 0 run return 0

# ── СБРОС ВРЕМЕННЫХ ТЕГОВ ──────────────────────
# Чистим прошлый снимок перед новым
tag @e[type=minecraft:boat,tag=fl_boat] remove fl_occupied
tag @e[type=minecraft:boat,tag=fl_boat] remove fl_b1
tag @e[type=minecraft:boat,tag=fl_boat] remove fl_b2

# ── ПРОВЕРКА ЗАНЯТОСТИ ─────────────────────────
# Если у игрока vehicle и этот vehicle — наша лодка:
# отмечаем лодку как занятую
# (NBT-проверка не нужна — теговая быстрее)
execute as @a on vehicle if entity @s[tag=fl_boat] run tag @s add fl_occupied

# ── ИНДЕКСАЦИЯ ─────────────────────────────────
# fl_b1 — первая найденная лодка
# fl_b2 — вторая (если есть)
tag @e[type=minecraft:boat,tag=fl_boat,limit=1] add fl_b1
tag @e[type=minecraft:boat,tag=fl_boat,tag=!fl_b1,limit=1] add fl_b2

# ── ПОДСЧЁТ ────────────────────────────────────
execute store result score #boat_count fl_math if entity @e[type=minecraft:boat,tag=fl_boat]

# ── СООБЩЕНИЕ: НЕТ ЛОДОК ───────────────────────
execute if score #boat_count fl_math matches 0 run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Лодок на карте нет. Следующая доставка через ~60 сек.","color":"gray"}]

# ── СТАТУС ЛОДКИ #1 ─────────────────────────────────────────────────────────
# Все distance=.. считаются от positioned 32 63 -801 (точка причала базы),
# а не от позиции игрока — так логичнее для понятия "далеко от базы".

# · Свободна · В порту
execute positioned 32 63 -801 if entity @e[tag=fl_b1,tag=!fl_occupied,distance=..15] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #1: ","color":"yellow"},{"text":"СВОБОДНА","color":"green","bold":true},{"text":" | ","color":"dark_gray"},{"text":"В порту (<15м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 1"},"hoverEvent":{"action":"show_text","contents":"Вернуть лодку #1 на базу"}}]

# · Свободна · Близко
execute positioned 32 63 -801 if entity @e[tag=fl_b1,tag=!fl_occupied,distance=15..100] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #1: ","color":"yellow"},{"text":"СВОБОДНА","color":"green","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Близко (15-100м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 1"},"hoverEvent":{"action":"show_text","contents":"Вернуть лодку #1 на базу"}}]

# · Свободна · Далеко
execute positioned 32 63 -801 if entity @e[tag=fl_b1,tag=!fl_occupied,distance=100..300] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #1: ","color":"yellow"},{"text":"СВОБОДНА","color":"green","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Далеко (100-300м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 1"},"hoverEvent":{"action":"show_text","contents":"Вернуть лодку #1 на базу"}}]

# · Свободна · Очень далеко
execute positioned 32 63 -801 if entity @e[tag=fl_b1,tag=!fl_occupied,distance=300..] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #1: ","color":"yellow"},{"text":"СВОБОДНА","color":"green","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Очень далеко (>300м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 1"},"hoverEvent":{"action":"show_text","contents":"Вернуть лодку #1 на базу"}}]

# · Занята · В порту
execute positioned 32 63 -801 if entity @e[tag=fl_b1,tag=fl_occupied,distance=..15] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #1: ","color":"yellow"},{"text":"ЗАНЯТА","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"text":"В порту (<15м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 1"},"hoverEvent":{"action":"show_text","contents":"Лодка занята — пассажир будет высажен, лодка возвращена"}}]

# · Занята · Близко
execute positioned 32 63 -801 if entity @e[tag=fl_b1,tag=fl_occupied,distance=15..100] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #1: ","color":"yellow"},{"text":"ЗАНЯТА","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Близко (15-100м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 1"},"hoverEvent":{"action":"show_text","contents":"Лодка занята — пассажир будет высажен, лодка возвращена"}}]

# · Занята · Далеко
execute positioned 32 63 -801 if entity @e[tag=fl_b1,tag=fl_occupied,distance=100..300] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #1: ","color":"yellow"},{"text":"ЗАНЯТА","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Далеко (100-300м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 1"},"hoverEvent":{"action":"show_text","contents":"Лодка занята — пассажир будет высажен, лодка возвращена"}}]

# · Занята · Очень далеко
execute positioned 32 63 -801 if entity @e[tag=fl_b1,tag=fl_occupied,distance=300..] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #1: ","color":"yellow"},{"text":"ЗАНЯТА","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Очень далеко (>300м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 1"},"hoverEvent":{"action":"show_text","contents":"Лодка занята — пассажир будет высажен, лодка возвращена"}}]

# ── СТАТУС ЛОДКИ #2 ─────────────────────────────────────────────────────────

# · Свободна · В порту
execute positioned 32 63 -801 if entity @e[tag=fl_b2,tag=!fl_occupied,distance=..15] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #2: ","color":"yellow"},{"text":"СВОБОДНА","color":"green","bold":true},{"text":" | ","color":"dark_gray"},{"text":"В порту (<15м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 2"},"hoverEvent":{"action":"show_text","contents":"Вернуть лодку #2 на базу"}}]

# · Свободна · Близко
execute positioned 32 63 -801 if entity @e[tag=fl_b2,tag=!fl_occupied,distance=15..100] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #2: ","color":"yellow"},{"text":"СВОБОДНА","color":"green","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Близко (15-100м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 2"},"hoverEvent":{"action":"show_text","contents":"Вернуть лодку #2 на базу"}}]

# · Свободна · Далеко
execute positioned 32 63 -801 if entity @e[tag=fl_b2,tag=!fl_occupied,distance=100..300] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #2: ","color":"yellow"},{"text":"СВОБОДНА","color":"green","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Далеко (100-300м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 2"},"hoverEvent":{"action":"show_text","contents":"Вернуть лодку #2 на базу"}}]

# · Свободна · Очень далеко
execute positioned 32 63 -801 if entity @e[tag=fl_b2,tag=!fl_occupied,distance=300..] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #2: ","color":"yellow"},{"text":"СВОБОДНА","color":"green","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Очень далеко (>300м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 2"},"hoverEvent":{"action":"show_text","contents":"Вернуть лодку #2 на базу"}}]

# · Занята · В порту
execute positioned 32 63 -801 if entity @e[tag=fl_b2,tag=fl_occupied,distance=..15] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #2: ","color":"yellow"},{"text":"ЗАНЯТА","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"text":"В порту (<15м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 2"},"hoverEvent":{"action":"show_text","contents":"Лодка занята — пассажир будет высажен, лодка возвращена"}}]

# · Занята · Близко
execute positioned 32 63 -801 if entity @e[tag=fl_b2,tag=fl_occupied,distance=15..100] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #2: ","color":"yellow"},{"text":"ЗАНЯТА","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Близко (15-100м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 2"},"hoverEvent":{"action":"show_text","contents":"Лодка занята — пассажир будет высажен, лодка возвращена"}}]

# · Занята · Далеко
execute positioned 32 63 -801 if entity @e[tag=fl_b2,tag=fl_occupied,distance=100..300] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #2: ","color":"yellow"},{"text":"ЗАНЯТА","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Далеко (100-300м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 2"},"hoverEvent":{"action":"show_text","contents":"Лодка занята — пассажир будет высажен, лодка возвращена"}}]

# · Занята · Очень далеко
execute positioned 32 63 -801 if entity @e[tag=fl_b2,tag=fl_occupied,distance=300..] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка #2: ","color":"yellow"},{"text":"ЗАНЯТА","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"text":"Очень далеко (>300м) ","color":"white"},{"text":"[ВЕРНУТЬ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_tp_boat set 2"},"hoverEvent":{"action":"show_text","contents":"Лодка занята — пассажир будет высажен, лодка возвращена"}}]