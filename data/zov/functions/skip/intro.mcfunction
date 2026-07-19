# ================================================
# ZOV — ПРОПУСК ЗАСТАВКИ
# /function zov:skip/intro
# Работает только во время fl_state=2 пока prep_timer=0
# (заставка идёт — phase_3 ещё не запустился)
# ================================================

# Гуард: только во время заставки
execute unless score #global fl_state matches 2 run tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Заставка не идёт.","color":"red"}]
execute unless score #global fl_state matches 2 run return 0
execute unless score #prep_timer fl_math matches ..0 run tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Заставка уже закончилась — идёт подготовка.","color":"red"}]
execute unless score #prep_timer fl_math matches ..0 run return 0

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Заставка пропущена.","color":"gray"}]

# Отменяем запланированные фазы и запускаем phase_3 немедленно
# schedule нельзя отменить в 1.20.1 — используем флаг
# phase_2 и phase_3 проверят #skip_intro перед выполнением
scoreboard players set #skip_intro fl_math 1
function zov:start/phase_3
