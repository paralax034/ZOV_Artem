# ================================================
# ZOV — ПОПОЛНЕНИЕ ПРИ ЗАХВАТЕ ТОЧКИ
# Вызывается из zone/capture при каждом захвате
# ================================================

give @a superbwarfare:rifle_ammo_box 4
give @a superbwarfare:armor_plate 4
give @a minecraft:bread 12

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Пополнение боеприпасов выдано всем!","color":"green"}]