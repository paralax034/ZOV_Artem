# 
# ZOV — СНАБЖЕНИЕ СИНИХ ПРИ ОТСТУПЛЕНИИ
# runs as @s = живой синий игрок
# 

# Тяжелые ракеты (на 1 больше везде)
give @s superbwarfare:rpg_rocket_tbg 3

# Выдаем базовый инженерный комплект (определен в blue_give_base)
function zov:zone/blue_give_base

# На укрепленных рубежах A4 и A5 удваиваем инженерные блоки, вызвав базовый комплект повторно
execute if score #global fl_active matches 4..5 run function zov:zone/blue_give_base

# Раздача аптечек обороне (+3 шт. при отступлении)
give @s superbwarfare:medical_kit 3

give @a[tag=fl_tow_operator] superbwarfare:medium_anti_ground_missile 1

# Оповещение
tellraw @s [{"text":"[ZOV] ","color":"aqua","bold":true},{"text":"Вы успешно отступили! Вам выдано тяжелое вооружение, аптечки и материалы для новой линии обороны.","color":"white"}]