# ================================================
# ZOV — ОЧИСТКА КАРТЫ
# ================================================

kill @e[type=superbwarfare:bmp_2]
kill @e[type=superbwarfare:a_10a]
kill @e[type=superbwarfare:rpg_rocket_tbg]
kill @e[type=superbwarfare:smoke_decoy]
kill @e[type=superbwarfare:hand_grenade]
kill @e[type=superbwarfare:tow]
kill @e[type=superbwarfare:tm_62]
kill @e[type=superbwarfare:blu_43]
kill @e[type=item]
kill @e[type=corpse:corpse]

# Полная очистка инвентаря + патроны (rifle_ammo накапливается из коробок)
clear @a
clear @a superbwarfare:rifle_ammo

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Карта очищена от техники и предметов.","color":"gray"}]