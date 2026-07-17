# ================================================
# ZOV — ПОПОЛНЕНИЕ ПРИ ЗАХВАТЕ ТОЧКИ
# Выдаётся всем без ограничений (бонус за захват)
# ================================================

give @a superbwarfare:rifle_ammo_box 5
give @a superbwarfare:armor_plate 5
give @a minecraft:bread 20

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Пополнение боеприпасов выдано всем!","color":"green"}]