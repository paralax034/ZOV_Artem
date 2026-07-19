# ================================================
# ZOV — СТАРТ ФАЗА 3: Выдача вещей, Подготовка
#
# fl_special (снайпер) удалён — все получают одинаковое снаряжение.
#
# Патронная система:
#   Лимит rifle = 1000 (глобально, раз за старт)
#   Начальный запас = 480 rifle через ammo set
#   Коробки rifle_ammo_box не выдаются — используем ammo-систему мода
#
# ⚠️ #skip_intro НЕ сбрасывается здесь намеренно.
#    Причина: phase_3 вызывается ИЗ start_run после проверки
#    skip_intro. Если сбросить флаг внутри phase_3 — start_run
#    увидит skip_intro=0 на следующей строке и запустит phase_1
#    поверх уже выполненной phase_3 (gamemode spectator перебьёт
#    gamemode survival, игрок застрянет в спектаторе).
#    skip_intro — постоянная настройка, выключается только
#    вручную через /function zov:settings/skip_intro_off.
# ================================================

gamemode survival @a

# Эффекты на подготовку
effect give @a minecraft:resistance 130 4 true
effect give @a minecraft:regeneration 10 255 true
effect give @a minecraft:saturation 5 255 true

# Сетки спавнов
spawnpoint @a[team=red] 18 64 -817
execute as @a[team=red] run tp @s 18 64 -817 0 0

function zov:spawn/set_blue_1
execute as @a[team=blue] run spawnpoint @s 37 72 -406
execute as @a[team=blue] run tp @s 37 72 -406

# --- Выдача брони ---
give @a[team=red] superbwarfare:ru_helmet_6b47{Unbreakable:1b} 1
give @a[team=red] superbwarfare:ru_chest_6b43{Unbreakable:1b} 1
give @a[team=blue] superbwarfare:us_helmet_pasgt{Unbreakable:1b} 1
give @a[team=blue] superbwarfare:us_chest_iotv{Unbreakable:1b} 1

# --- Выдача оружия ---
# АК-12 для красных (с НБТ: магазин 30, насадка ствол + прицел)
give @a[team=red] superbwarfare:ak_12{GeckoLibID:274L,Perks:{},GunData:{Ammo:30,CloseStrike:1b,UUID:[I;-1284710730,-873443600,-1644711148,1156431446]},Attachments:{Barrel:1,Grip:0,Scope:1,Magazine:0,Stock:1}} 1

# M4 для синих (с НБТ: магазин 31, насадка ствол + прицел, VirtualAmmo)
give @a[team=blue] superbwarfare:m_4{GeckoLibID:277L,Perks:{},GunData:{Ammo:31,CloseStrike:1b,UUID:[I;866436241,66014490,-1714218689,29966386],VirtualAmmo:1},Attachments:{Barrel:1,Scope:1,Stock:0}} 1

# --- Расходники (без rifle_ammo_box — патроны через ammo-систему) ---
give @a superbwarfare:armor_plate 4
give @a superbwarfare:medical_kit 3
give @a superbwarfare:rpg 1
give @a superbwarfare:rpg_rocket_tbg 2
give @a superbwarfare:hand_grenade 2
give @a superbwarfare:knife 1
give @a minecraft:bread 12

execute if score #goggles_enabled fl_math matches 1 run give @a superbwarfare:thermal_imaging_goggles 1

give @a[team=red] superbwarfare:m18_smoke_grenade 2
give @a[team=blue] superbwarfare:m18_smoke_grenade 2

give @a[team=blue] superbwarfare:sandbag 16
give @a[team=blue] superbwarfare:blu_43_mine 6
give @a[team=blue] superbwarfare:barbed_wire 4
give @a[team=blue] superbwarfare:dragon_teeth 3
give @a[team=blue] superbwarfare:tm_62 2
give @a[team=blue] superbwarfare:edd 1

# --- Патронная система ---
# Лимит rifle на 1500 (глобальная настройка, один раз за старт)
superbwarfare ammo limit ammo set rifle 1500

# Начальный запас: 400 патронов rifle каждому
execute as @a run superbwarfare ammo set @s rifle 400

# --- Назначение технических ролей ---
tag @r[team=blue] add fl_tow_operator
give @a[tag=fl_tow_operator] superbwarfare:tow_deployer 1
give @a[tag=fl_tow_operator] superbwarfare:medium_anti_ground_missile 1
tag @a remove fl_tow_operator

tag @r[team=red] add fl_navigator

function zov:nav/update

# Спавн БМП
summon superbwarfare:bmp_2 24 64 -819 {WeaponState:{Missile:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},Cannon:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG1:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG3:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG2:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MainMachineGun:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},"@MG":{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG5:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG4:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG6:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}}},PropellerRot:0.0f,LeftWheelHealth:50.0f,ChargeProgress:0.0f,Invulnerable:0b,MainEngineHealth:50.0f,IsWreck:0b,PortalCooldown:0,TurretHealth:50.0f,RightWheelDamaged:0b,GearUp:0b,SelectedWeapon:[I;0,0,0,0,0,0,0],FallDistance:0.0f,MainEngineDamaged:0b,CanUpdate:1b,Energy:5000000,GearRot:0.0f,SubEngineHealth:50.0f,DecoyReady:1b,Health:300.0f,Air:300s,OnGround:1b,TurretBurnTimer:0,SubEngineDamaged:0b,TurretBurned:0b,SympatheticDetonated:0b,RightWheelHealth:50.0f,LeftWheelDamaged:0b,Fire:-1s,TurretDamaged:0b,Power:0.0f,Inventory:{Size:54,Items:[{Slot:0,id:"superbwarfare:small_shell_ap",Count:64b},{Slot:1,id:"superbwarfare:small_shell_gs",Count:64b},{Slot:2,id:"superbwarfare:small_shell_he",Count:64b},{Slot:3,id:"superbwarfare:small_shell_he",Count:64b},{Slot:4,id:"superbwarfare:large_battery_pack",Count:1b,tag:{Energy:20000000}},{Slot:5,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:6,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:7,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:8,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:9,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:10,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:11,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:12,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:13,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:14,id:"minecraft:bread",Count:1b}]}}

tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"БМП-2 готова на базе!","color":"green"}]

# Боссбар подготовки
bossbar set zov:progress players @a
bossbar set zov:progress visible true
bossbar set zov:progress color yellow
bossbar set zov:progress max 24000
bossbar set zov:progress value 24000
bossbar set zov:progress name {"text":"⏳ Подготовка к бою...","color":"yellow","bold":true}

title @a times 10 70 10
title @a title [{"text":"ПОДГОТОВКА","color":"yellow","bold":true}]
title @a[team=red] subtitle [{"text":"Наступление через 2 минуты!","color":"red"}]
title @a[team=blue] subtitle [{"text":"2 минуты на подготовку обороны!","color":"aqua"}]

tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Наступление через 2 минуты. Не пересекайте рубеж!","color":"yellow"}]
tellraw @a[team=blue] [{"text":"[ZOV] ","color":"aqua","bold":true},{"text":"2 минуты на подготовку обороны. Стройте укрепления!","color":"white"}]

scoreboard players set #prep_timer fl_math 24000
scoreboard players set #prep_hud_timer fl_math 0

execute if score #skip_prep fl_math matches 1 run scoreboard players set #prep_timer fl_math 10