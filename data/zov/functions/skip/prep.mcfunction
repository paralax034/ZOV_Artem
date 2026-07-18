# ================================================
# ZOV — ПРОПУСК ПОДГОТОВКИ
# /function zov:skip/prep
# Работает только во время fl_state=2 при prep_timer > 0
# ================================================

# Гуард: только во время подготовки
execute unless score #global fl_state matches 2 run tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Подготовка не идёт.","color":"red"}]
execute unless score #global fl_state matches 2 run return 0
execute if score #prep_timer fl_math matches ..0 run tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Подготовка ещё не началась — идёт заставка.","color":"red"}]
execute if score #prep_timer fl_math matches ..0 run return 0

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Подготовка пропущена.","color":"gray"}]

# Обнуляем таймер — prep_tick сам вызовет prep_end в следующем тике
scoreboard players set #prep_timer fl_math 1