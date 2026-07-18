# ================================================
# ZOV — ВОЗВРАТ ЛОДКИ НА БАЗУ (по клику [ВЕРНУТЬ])
# runs as @s = красный игрок нажавший кнопку
#
# Логика занятой лодки:
#   Лодку УБИВАЕМ → пассажир выходит на месте (не тпшится!).
#   Затем спавним новую на базе. Счётчик #boat_count
#   не трогаем вручную — boat_spawn сам пересчитает через
#   if entity @e[tag=fl_boat] при следующем вызове.
#
# Почему kill безопасен:
#   /kill на entity с пассажиром убивает только entity.
#   Пассажир dismount'ится в своей текущей позиции — живой.
# ================================================

# ── ГУАРД ──────────────────────────────────────
# Система лодок неактивна после захвата A1
execute unless score #global fl_captured matches 0 run return 0

# ── ВЫБОР ЛОДКИ ────────────────────────────────
# Назначаем временный тег fl_selected нужной лодке
execute if score @s fl_tp_boat matches 1 run tag @e[type=minecraft:boat,tag=fl_b1,limit=1] add fl_selected
execute if score @s fl_tp_boat matches 2 run tag @e[type=minecraft:boat,tag=fl_b2,limit=1] add fl_selected

# ── ОШИБКА: ЛОДКА НЕ НАЙДЕНА ───────────────────
# fl_b1/fl_b2 назначаются в boat_status — если с момента
# последнего нажатия статуса лодка исчезла, сообщаем об этом
execute unless entity @e[type=minecraft:boat,tag=fl_selected] run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Лодка не найдена. Обновите статус — нажмите табличку ещё раз.","color":"red"}]
execute unless entity @e[type=minecraft:boat,tag=fl_selected] run scoreboard players set @s fl_tp_boat 0
execute unless entity @e[type=minecraft:boat,tag=fl_selected] run return 0

# ── ВЕТКА: ЛОДКА ЗАНЯТА ─────────────────────────
# Убиваем лодку — пассажир ОСТАЁТСЯ на месте (dismount без тп).
# После kill entity с тегом fl_selected нет → спавним замену.
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=fl_occupied] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка была занята — пассажир высажен, лодка возвращена на базу.","color":"yellow"}]
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=fl_occupied] run kill @e[type=minecraft:boat,tag=fl_selected,limit=1]

# Спавним замену только если лодка действительно была убита
# (проверяем что fl_selected больше нет — kill прошёл)
# fl_tp_boat=1 → спавним с тегом fl_b1, =2 → fl_b2
# Тег fl_boat обязателен для всех счётчиков системы
execute if score @s fl_tp_boat matches 1 unless entity @e[type=minecraft:boat,tag=fl_selected] run summon minecraft:boat 32 63 -801 {Type:"oak",Tags:["fl_boat","fl_b1"]}
execute if score @s fl_tp_boat matches 2 unless entity @e[type=minecraft:boat,tag=fl_selected] run summon minecraft:boat 32 63 -801 {Type:"oak",Tags:["fl_boat","fl_b2"]}

# Разброс новой лодки (2..10 блоков от причала)
execute unless entity @e[type=minecraft:boat,tag=fl_selected] if score @s fl_tp_boat matches 1 run spreadplayers 32 -801 2 10 false @e[type=minecraft:boat,tag=fl_b1,limit=1,sort=nearest]
execute unless entity @e[type=minecraft:boat,tag=fl_selected] if score @s fl_tp_boat matches 2 run spreadplayers 32 -801 2 10 false @e[type=minecraft:boat,tag=fl_b2,limit=1,sort=nearest]

# ── ВЕТКА: ЛОДКА СВОБОДНА ──────────────────────
# Просто телепортируем существующую лодку на базу
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=!fl_occupied] run tp @e[type=minecraft:boat,tag=fl_selected,limit=1] 32 63 -801
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=!fl_occupied] run spreadplayers 32 -801 2 10 false @e[type=minecraft:boat,tag=fl_selected,limit=1]
execute if entity @e[type=minecraft:boat,tag=fl_selected,tag=!fl_occupied] run tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Лодка успешно возвращена на базу!","color":"green"}]

# ── ОЧИСТКА ────────────────────────────────────
# Снимаем fl_selected (если лодка жива — была свободной)
tag @e[type=minecraft:boat,tag=fl_selected] remove fl_selected

# Сбрасываем триггер
scoreboard players set @s fl_tp_boat 0