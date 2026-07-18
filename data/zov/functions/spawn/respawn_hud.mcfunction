# ================================================
# ZOV — HUD МЁРТВОГО ИГРОКА (runs as @s = fl_waiting)
# П-6: шкалы вынесены в respawn_hud_a1 и respawn_hud_a2_7
# Этот файл — диспетчер + idle + оспаривание
# Вызывается каждые 4 тика из tick_logic
# ================================================

# Вычисляем секунды до респауна
scoreboard players operation #respawn_sec fl_math = @s fl_dead
scoreboard players operation #respawn_sec fl_math /= #20 fl_math

# --- Idle (захвата нет) ---
execute if score #zone_state fl_math matches 0 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"Респаун через ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score #zone_state fl_math matches 0 if score #respawn_sec fl_math matches ..0 run title @s actionbar [{"text":"Респаун...","color":"red","bold":true}]

# --- Захват: диспетчер по зоне ---
execute if score #zone_state fl_math matches 1 if score #global fl_active matches 1 run function zov:spawn/respawn_hud_a1
execute if score #zone_state fl_math matches 1 if score #global fl_active matches 2..7 run function zov:spawn/respawn_hud_a2_7

# --- Оспаривается ---
execute if score #zone_state fl_math matches 2 if score #respawn_sec fl_math matches 1.. run title @s actionbar [{"text":"⚠ ОСПАРИВАЕТСЯ  ","color":"yellow","bold":true},{"text":"Респаун ","color":"white"},{"score":{"name":"#respawn_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":"с","color":"white"}]