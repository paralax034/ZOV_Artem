# ================================================
# ZOV — НАСТРОЙКА: пропуск начальной заставки выключить
# /function zov:settings/skip_intro_off
# ================================================

scoreboard players set #skip_intro fl_math 0
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Пропуск заставки: ","color":"gray"},{"text":"ВЫКЛ","color":"red","bold":true}]