# ================================================
# ZOV — ТЕЛО ВОЗВРАТА ЛОДКИ НА БАЗУ
# runs as @s = красный живой игрок (tag=!fl_waiting)
#
# Три независимые ветки (без /return — не существует в 1.20.1):
#   А) Лодка не найдена → сообщение, сброс триггера
#   Б) Лодка занята     → kill + замена через временный тег
#   В) Лодка свободна   → tp + spread по тегу fl_selected
#
# Почему #boat_need_respawn вместо проверки entity после kill:
#   После kill @e[tag=fl_selected] entity исчезает в этом же тике.
#   Проверить "была ли занята" через entity selector уже нельзя.
#   Флаг ставится ДО kill — после него однозначно известно нужна замена.
#
# Почему временный тег fl_boat_spawning:
#   spreadplayers без sort работает на первой найденной entity.
#   Временный тег гарантирует что двигается именно новая лодка,
#   а не уже существующая (с пассажиром).
# ================================================

# Сброс флага замены
scoreboard players set #boat_need_respawn fl_math 0

# ── ВЫБОР ЛОДКИ ────────────────────────────────
execute if score @s fl_tp_boat matches 1 run tag @e[type=minecraft:boat,tag=fl_b1,limit=1] add fl_selected
execute if score @s fl_tp_boat matches 2 run tag @e[type=minecraft:boat,tag=fl_b2,limit=1] add fl_selected

# ── ВЕТКА А: ЛОДКА НЕ НАЙДЕНА ──────────────────
# fl_b1/fl_b2 назначаются в boat_status — если с момента
# последнего статуса лодка исчезла, сообщаем и выходим.
execute unless entity @e[type=minecraft:boat,tag=fl_selected] run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Лодка не найдена. Нажмите табличку ещё раз для обновления статуса.","color":"red"}]
execute unless entity @e[type=minecraft:boat,tag=fl_selected] run scoreboard players set @s fl_tp_boat 0

# ── ВЕТКА Б: ЛОДКА ЗАНЯТА ──────────────────────
# Помечаем что нужна замена ДО kill (после kill проверить нельзя).
# kill высаживает пассажира на месте — он НЕ телепортируется.
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=fl_occupied] run scoreboard players set #boat_need_respawn fl_math 1
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=fl_occupied] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка была занята — пассажир высажен, лодка возвращена на базу.","color":"yellow"}]
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=fl_occupied] run kill @e[type=minecraft:boat,tag=fl_selected,limit=1]

# Спавн замены: временный тег чтобы spreadplayers двигал
# именно новую лодку, а не случайную существующую.
execute if score #boat_need_respawn fl_math matches 1 run summon minecraft:boat 32 63 -801 {Type:"oak",Tags:["fl_boat","fl_boat_spawning"]}
execute if score #boat_need_respawn fl_math matches 1 run spreadplayers 32 -801 2 10 false @e[type=minecraft:boat,tag=fl_boat_spawning,limit=1]
execute if score #boat_need_respawn fl_math matches 1 run tag @e[type=minecraft:boat,tag=fl_boat_spawning] remove fl_boat_spawning

# ── ВЕТКА В: ЛОДКА СВОБОДНА ────────────────────
# fl_selected — уникальный тег → limit=1 берёт ровно нашу лодку.
# Сначала tp на базу, потом spread от базы — порядок важен.
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=!fl_occupied] run tp @e[type=minecraft:boat,tag=fl_selected,limit=1] 32 63 -801
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=!fl_occupied] run spreadplayers 32 -801 2 10 false @e[type=minecraft:boat,tag=fl_selected,limit=1]
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=!fl_occupied] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка успешно возвращена на базу!","color":"green"}]

# ── ОЧИСТКА ────────────────────────────────────
# fl_selected снимается если лодка пережила (была свободна).
# Если занятая — уже убита, тег удалился вместе с entity.
tag @e[type=minecraft:boat,tag=fl_selected] remove fl_selected
scoreboard players set @s fl_tp_boat 0