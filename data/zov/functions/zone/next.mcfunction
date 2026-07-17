# ================================================
# ZOV — СЛЕДУЮЩАЯ ТОЧКА
# ================================================

scoreboard players add #global fl_active 1
scoreboard players set #global fl_progress 0
scoreboard players set #sound_timer fl_math 0

# --- +5 минут за захват (6000 тиков) ---
scoreboard players add #global fl_round 6000
execute if score #global fl_round matches 24001.. run scoreboard players set #global fl_round 24000

# Сообщение о бонусном времени
execute as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.5
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"+5 минут за захват точки!","color":"green","bold":true}]

# Обновляем навигацию
function zov:nav/update

function zov:hud/bossbar