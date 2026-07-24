# 
# ZOV — HUD МЁРТВОГО ИГРОКА (Runs as @s = fl_waiting)
# 

# Расчет времени до респауна (в секундах)
scoreboard players operation #temp fl_math = @s fl_dead
scoreboard players operation #temp fl_math /= #20 fl_math

# Фиксация секунд для под-функций HUD шкал
scoreboard players operation #respawn_sec fl_math = #temp fl_math

# --- Свободный статус ---
execute if score #zone_state fl_math matches 0 if score #temp fl_math matches 1.. run title @s actionbar [{"text":"Респаун через ","color":"white"},{"score":{"name":"#temp","objective":"fl_math"},"color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score #zone_state fl_math matches 0 if score #temp fl_math matches ..0 run title @s actionbar [{"text":"Респаун...","color":"red","bold":true}]

# --- Захват точки ---
execute if score #zone_state fl_math matches 1 if score #global fl_active matches 1 run function zov:spawn/respawn_hud_a1
execute if score #zone_state fl_math matches 1 if score #global fl_active matches 2..7 run function zov:spawn/respawn_hud_a2_7

# --- Оспаривание зоны ---
execute if score #zone_state fl_math matches 2 if score #temp fl_math matches 1.. run title @s actionbar [{"text":"⚠ ОСПАРИВАЕТСЯ  ","color":"yellow","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#temp","objective":"fl_math"},"color":"yellow","bold":true},{"text":"сек","color":"white"}]