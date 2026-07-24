# 
# ZOV — ВЫДАЧА ТАБЛИЧКИ «СТАТУС ЛОДОК»
# /function zov:give/boat_sign
#
# Запускает от имени оператора.
# Выдаёт дубовую табличку с кликабельным текстом.
# Игрок ставит её, после чего любой красный
# жмёт ПКМ → срабатывает /trigger fl_boat_status.
#
# Почему trigger не требует OP:
#   scoreboard objectives add fl_boat_status trigger
#   позволяет игрокам самостоятельно активировать
#   триггер через /trigger без прав оператора.
# 

give @s minecraft:oak_sign{BlockEntityTag:{front_text:{messages:['{"text":"⚓ ПОРТ КРАСНЫХ","color":"red","bold":true}','{"text":"[СТАТУС ЛОДОК]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/trigger fl_boat_status"}}','{"text":"ПКМ — проверить лодки","color":"gray"}','{"text":"и вернуть на базу","color":"gray"}'],has_glowing_text:0b,color:"white"}}} 1

tellraw @s [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Табличка выдана. Поставьте её на базе красных в удобном месте.","color":"gray"}]