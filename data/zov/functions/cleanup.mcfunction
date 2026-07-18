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
# Лодки у базы красных (1.20.1: type=boat, не oak_boat)
kill @e[type=minecraft:boat,x=22,y=64,z=-807,distance=..100]

# Очистка обычного инвентаря
clear @a
# Очистка раскрытых патронов-предметов
clear @a superbwarfare:rifle_ammo
clear @a superbwarfare:rifle_ammo_box
# Curios: RESET (не clear!) — официальный API
execute as @a run curios reset @s
# Патроны мода — данные на игроке, не предметы
execute as @a run superbwarfare ammo set @s rifle 0
execute as @a run superbwarfare ammo set @s handgun 0
execute as @a run superbwarfare ammo set @s sniper 0
execute as @a run superbwarfare ammo set @s shotgun 0
execute as @a run superbwarfare ammo set @s heavy 0

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Карта очищена от техники и предметов.","color":"gray"}]