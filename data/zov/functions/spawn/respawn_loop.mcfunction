# ================================================
# ZOV — ТАЙМЕР РЕСПАУНА (runs as @s = fl_waiting игрок)
# Показывает: состояние зоны + секунды до респауна
# Вычисляет секунды через fl_dead / 20 (константа #20)
# ================================================

scoreboard players remove @s fl_dead 1

# Вычисляем секунды до респауна (fl_dead / 20)
scoreboard players operation #respawn_sec fl_math = @s fl_dead
scoreboard players operation #respawn_sec fl_math /= #20 fl_math

# --- Idle: только таймер ---
execute if score #zone_state fl_math matches 0 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"Респаун через ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score #zone_state fl_math matches 0 if score #respawn_sec fl_math matches ..0 run title @s actionbar [{"text":"Респаун...","color":"red","bold":true}]

# --- Захват идёт: полоска + таймер ---
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 1..30 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"|","color":"red","bold":true},{"text":"|||||||||  ","color":"dark_gray","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 31..60 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"||","color":"red","bold":true},{"text":"||||||||  ","color":"dark_gray","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 61..90 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"|||","color":"red","bold":true},{"text":"|||||||  ","color":"dark_gray","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 91..120 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"||||","color":"red","bold":true},{"text":"||||||  ","color":"dark_gray","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 121..150 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"|||||","color":"red","bold":true},{"text":"|||||  ","color":"dark_gray","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 151..180 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"||||||","color":"red","bold":true},{"text":"||||  ","color":"dark_gray","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 181..210 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"|||||||","color":"red","bold":true},{"text":"|||  ","color":"dark_gray","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 211..240 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"||||||||","color":"red","bold":true},{"text":"||  ","color":"dark_gray","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 241..270 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"|||||||||","color":"red","bold":true},{"text":"|  ","color":"dark_gray","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 271..300 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"||||||||||  ","color":"red","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]

# --- Оспаривается: текст + таймер ---
execute if score #zone_state fl_math matches 2 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"⚠ ОСПАРИВАЕТСЯ  ","color":"yellow","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]

execute if score @s fl_dead matches ..0 run function zov:spawn/do_respawn