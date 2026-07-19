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
# Только наши лодки по тегу — не трогаем чужие
kill @e[type=minecraft:boat,tag=fl_boat]

# Очистка инвентарей
clear @a
clear @a superbwarfare:rifle_ammo
clear @a superbwarfare:rifle_ammo_box
execute as @a run curios reset @s

# Патроны мода
execute as @a run superbwarfare ammo set @s rifle 0
execute as @a run superbwarfare ammo set @s handgun 0
execute as @a run superbwarfare ammo set @s sniper 0
execute as @a run superbwarfare ammo set @s shotgun 0
execute as @a run superbwarfare ammo set @s heavy 0

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Карта очищена от техники и предметов.","color":"gray"}]