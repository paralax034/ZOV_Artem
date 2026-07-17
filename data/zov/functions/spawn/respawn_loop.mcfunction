# ================================================
# ZOV — ТАЙМЕР РЕСПАУНА (runs as @s = fl_waiting игрок)
# ================================================

# Уменьшаем таймер
scoreboard players remove @s fl_dead 1

# Показываем обратный отсчёт каждые 20 тиков (1 сек)
execute if score @s fl_dead matches 280..299 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"14","color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 260..279 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"13","color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 240..259 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"12","color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 220..239 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"11","color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 200..219 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"10","color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 180..199 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"9","color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 160..179 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"8","color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 140..159 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"7","color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 120..139 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"6","color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 100..119 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"5","color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 80..99 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"4","color":"yellow","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 60..79 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"3","color":"red","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 40..59 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"2","color":"red","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 20..39 run title @s actionbar [{"text":"Респаун через ","color":"white"},{"text":"1","color":"red","bold":true},{"text":" сек.","color":"white"}]
execute if score @s fl_dead matches 1..19 run title @s actionbar [{"text":"Респаун...","color":"red","bold":true}]

# --- ВРЕМЯ ВЫШЛО: РЕСПАУН ---
execute if score @s fl_dead matches ..0 run function zov:spawn/do_respawn