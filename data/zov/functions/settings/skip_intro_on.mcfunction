# ================================================
# ZOV — НАСТРОЙКА: пропуск начальной заставки включить
# /function zov:settings/skip_intro_on
# ================================================

scoreboard players set #skip_intro fl_math 1
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Пропуск заставки: ","color":"gray"},{"text":"ВКЛ","color":"green","bold":true}]