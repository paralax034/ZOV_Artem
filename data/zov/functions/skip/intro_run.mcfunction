# ================================================
# ZOV — ТЕЛО ПРОПУСКА ЗАСТАВКИ
# ================================================

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Заставка пропущена.","color":"gray"}]

scoreboard players set #skip_intro fl_math 1
function zov:start/phase_3