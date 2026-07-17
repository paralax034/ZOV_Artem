# ================================================
# ZOV — ПОПОЛНЕНИЕ ПРИ ЗАХВАТЕ ТОЧКИ
# x2 патронов (10 коробок), 5 пластин, 20 хлеба
# ================================================

give @a superbwarfare:rifle_ammo_box 10
give @a superbwarfare:armor_plate 5
give @a minecraft:bread 20

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Пополнение боеприпасов выдано всем!","color":"green"}]