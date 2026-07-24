# 
# ZOV — СНАБЖЕНИЕ КРАСНЫХ ПРИ ШТУРМЕ
# runs as @s = живой красный игрок
# 

# Выдаем базовый штурмовой комплект (определен в red_give_base)
function zov:zone/red_give_base

# На укрепленных точках A4 и A5 удваиваем награду (вызываем базовый комплект повторно)
execute if score #global fl_active matches 4..5 run function zov:zone/red_give_base

# Оповещение игрока в чат
tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Рубеж взят! Получено штурмовое снаряжение, аптечки и бронепластины.","color":"white"}]