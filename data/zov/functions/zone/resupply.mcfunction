# ================================================
# ZOV — ПОПОЛНЕНИЕ ПРИ ЗАХВАТЕ ТОЧКИ
#
# Патроны: +800 rifle через ammo-систему мода (не коробки).
# execute as @a нужен — команда ammo работает только через @s.
# Броня и хлеб — как предметы, без изменений.
# ================================================

superbwarfare ammo add @a rifle 800
give @a superbwarfare:armor_plate 5
give @a minecraft:bread 20

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Пополнение боеприпасов выдано всем!","color":"green"}]