# ================================================
# ZOV — BOSSBAR: текст = инфо, полоска = таймер
# ================================================

# Всегда обновляем список игроков (на случай новых входов)
bossbar set zov:progress players @a

# Вычисляем минуты прямо здесь (не зависим от tick_logic)
scoreboard players operation #minutes fl_math = #global fl_round
scoreboard players operation #minutes fl_math /= #1200 fl_math

# Обновляем значение полоски таймера
execute store result bossbar zov:progress value run scoreboard players get #global fl_round

# Название по активной точке
execute if score #global fl_active matches 1 run bossbar set zov:progress name [{"text":"ТОЧКА A1","color":"yellow","bold":true},{"text":" | ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"},{"text":" | ","color":"dark_gray"},{"score":{"name":"#minutes","objective":"fl_math"},"color":"white"},{"text":" мин","color":"gray"}]
execute if score #global fl_active matches 2 run bossbar set zov:progress name [{"text":"ТОЧКА A2","color":"yellow","bold":true},{"text":" | ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"},{"text":" | ","color":"dark_gray"},{"score":{"name":"#minutes","objective":"fl_math"},"color":"white"},{"text":" мин","color":"gray"}]
execute if score #global fl_active matches 3 run bossbar set zov:progress name [{"text":"ТОЧКА A3","color":"yellow","bold":true},{"text":" | ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"},{"text":" | ","color":"dark_gray"},{"score":{"name":"#minutes","objective":"fl_math"},"color":"white"},{"text":" мин","color":"gray"}]
execute if score #global fl_active matches 4 run bossbar set zov:progress name [{"text":"ТОЧКА A4","color":"yellow","bold":true},{"text":" | ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"},{"text":" | ","color":"dark_gray"},{"score":{"name":"#minutes","objective":"fl_math"},"color":"white"},{"text":" мин","color":"gray"}]
execute if score #global fl_active matches 5 run bossbar set zov:progress name [{"text":"ТОЧКА A5","color":"yellow","bold":true},{"text":" | ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"},{"text":" | ","color":"dark_gray"},{"score":{"name":"#minutes","objective":"fl_math"},"color":"white"},{"text":" мин","color":"gray"}]
execute if score #global fl_active matches 6 run bossbar set zov:progress name [{"text":"ТОЧКА A6","color":"yellow","bold":true},{"text":" | ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"},{"text":" | ","color":"dark_gray"},{"score":{"name":"#minutes","objective":"fl_math"},"color":"white"},{"text":" мин","color":"gray"}]
execute if score #global fl_active matches 7 run bossbar set zov:progress name [{"text":"ЗАВОД A7!","color":"red","bold":true},{"text":" | ","color":"dark_gray"},{"score":{"name":"#global","objective":"fl_captured"},"color":"red"},{"text":"/7","color":"gray"},{"text":" | ","color":"dark_gray"},{"score":{"name":"#minutes","objective":"fl_math"},"color":"white"},{"text":" мин","color":"gray"}]

execute if score #global fl_active matches 1..6 run bossbar set zov:progress color yellow
execute if score #global fl_active matches 7 run bossbar set zov:progress color red