# ================================================
# ZOV — НАСТРОЙКА: мгновенный захват включить (тест)
# /function zov:settings/instant_capture_on
# Порог захвата = 1 тик — любое присутствие красных захватывает
# ================================================

scoreboard players set #instant_capture fl_math 1
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Мгновенный захват: ","color":"gray"},{"text":"ВКЛ (тест)","color":"green","bold":true}]