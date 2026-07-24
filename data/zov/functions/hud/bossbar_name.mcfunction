# 
# ZOV — BOSSBAR: обновление названия и цвета
# Вызывается ТОЛЬКО при смене зоны:
#   - из start.mcfunction (начало игры)
#   - из zone/next.mcfunction (захват точки)
# НЕ вызывается каждые 20 тиков — это ключевая оптимизация
# 

# Обновляем список игроков на случай новых входов
bossbar set zov:progress players @a

# Название: текущая точка (7 вариантов, выполняется только нужный)
execute if score #global fl_active matches 1 run bossbar set zov:progress name [{"text":"ТОЧКА A1","color":"yellow","bold":true},{"text":" | Захвачено: ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"}]
execute if score #global fl_active matches 2 run bossbar set zov:progress name [{"text":"ТОЧКА A2","color":"yellow","bold":true},{"text":" | Захвачено: ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"}]
execute if score #global fl_active matches 3 run bossbar set zov:progress name [{"text":"ТОЧКА A3","color":"yellow","bold":true},{"text":" | Захвачено: ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"}]
execute if score #global fl_active matches 4 run bossbar set zov:progress name [{"text":"ТОЧКА A4","color":"yellow","bold":true},{"text":" | Захвачено: ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"}]
execute if score #global fl_active matches 5 run bossbar set zov:progress name [{"text":"ТОЧКА A5","color":"yellow","bold":true},{"text":" | Захвачено: ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"}]
execute if score #global fl_active matches 6 run bossbar set zov:progress name [{"text":"ТОЧКА A6","color":"yellow","bold":true},{"text":" | Захвачено: ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"}]
execute if score #global fl_active matches 7 run bossbar set zov:progress name [{"text":"⚡ ЗАВОД A7","color":"red","bold":true},{"text":" | Захвачено: ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"}]

# Цвет полоски по зоне
execute if score #global fl_active matches 1..6 run bossbar set zov:progress color yellow
execute if score #global fl_active matches 7 run bossbar set zov:progress color red