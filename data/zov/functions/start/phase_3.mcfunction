# 
# ZOV — СТАРТ ФАЗА 3: Выдача вещей, Подготовка
# 

gamemode survival @a

# Эффекты на подготовку
effect give @a minecraft:resistance 130 4 true
effect give @a minecraft:regeneration 10 255 true
effect give @a minecraft:saturation 5 255 true

# Сетки спавнов
spawnpoint @a[team=red] 18 64 -817
execute as @a[team=red] run tp @s 18 64 -817 0 0

function zov:spawn/set_blue_1
execute as @a[team=blue] run function zov:spawn/tp_blue

# --- Выдача брони ---
give @a[team=red] superbwarfare:ru_helmet_6b47{Unbreakable:1b} 1
give @a[team=red] superbwarfare:ru_chest_6b43{Unbreakable:1b} 1
give @a[team=blue] superbwarfare:us_helmet_pasgt{Unbreakable:1b} 1
give @a[team=blue] superbwarfare:us_chest_iotv{Unbreakable:1b} 1

# --- Выдача оружия (СТРОГО ПО КОМАНДАМ) ---
give @a[team=red] superbwarfare:ak_12{GeckoLibID:274L,Perks:{},GunData:{Ammo:30,CloseStrike:1b,UUID:[I;-1284710730,-873443600,-1644711148,1156431446]},Attachments:{Barrel:1,Grip:0,Scope:1,Magazine:0,Stock:1}} 1
give @a[team=blue] superbwarfare:m_4{GeckoLibID:277L,Perks:{},GunData:{Ammo:31,CloseStrike:1b,UUID:[I;866436241,66014490,-1714218689,29966386],VirtualAmmo:1},Attachments:{Barrel:1,Scope:1,Stock:0}} 1

# --- Расходники общего типа ---
give @a superbwarfare:medical_kit 6
give @a superbwarfare:rpg 1
give @a superbwarfare:knife 1
give @a minecraft:bread 12
give @a minecraft:lantern 4

# --- Баланс Синей команды ---
give @a[team=blue] superbwarfare:armor_plate 2
give @a[team=blue] superbwarfare:hand_grenade 2
give @a[team=blue] superbwarfare:m18_smoke_grenade 2
give @a[team=blue] superbwarfare:rpg_rocket_tbg 3

# --- Баланс Красной команды ---
give @a[team=red] superbwarfare:armor_plate 3
give @a[team=red] superbwarfare:hand_grenade 4
give @a[team=red] superbwarfare:m18_smoke_grenade 3
give @a[team=red] superbwarfare:rpg_rocket_tbg 2

# --- Экипировка в Curios слоты ---
execute as @a run curios replace iff 0 @s with superbwarfare:iff
execute as @a if score #goggles_enabled fl_math matches 1 run curios replace head 0 @s with superbwarfare:thermal_imaging_goggles
execute as @a if score #goggles_enabled fl_math matches 0 run curios replace head 0 @s with minecraft:air

give @a[team=blue] superbwarfare:sandbag 16
give @a[team=blue] superbwarfare:blu_43_mine 6
give @a[team=blue] superbwarfare:barbed_wire 4
give @a[team=blue] superbwarfare:dragon_teeth 3
give @a[team=blue] superbwarfare:tm_62 2
give @a[team=blue] superbwarfare:edd 1

# --- Патронная система ---
superbwarfare ammo limit ammo set rifle 1500
execute as @a run superbwarfare ammo set @s rifle 400

# --- Назначение технических ролей ---
tag @r[team=blue] add fl_tow_operator
give @a[tag=fl_tow_operator] superbwarfare:container{BlockEntityTag:{EntityType:"superbwarfare:tow",Entity:{TowingUUID:"",LeftWheelHealth:50.0f,ChargeProgress:0.0f,Invulnerable:0b,MainEngineHealth:50.0f,RightWheelDamaged:0b,LastAttacker:"undefined",SelectedWeapon:[I;0],FallDistance:0.0f,CanUpdate:1b,GearRot:0.0f,id:"superbwarfare:tow",ServerYaw:-90.0f,TowedByUUID:"",DecoyReloadCoolDown:500,Air:300s,SubEngineDamaged:0b,TurretBurned:0b,RightWheelHealth:50.0f,LoiterR:400.0f,State:1b,TurretDamaged:0b,Roll:0.0f,LoiterX:0.0f,Inventory:{Size:0,Items:[]},LoiterZ:0.0f,LoiterY:318.0f,WeaponState:{Missile:{tag:{Perks:{},GunData:{Ammo:1},Attachments:{}}}},ReloadCoolDown:0,PropellerRot:0.0f,ServerPitch:0.0f,LastDriver:"undefined",IsWreck:0b,PortalCooldown:0,TurretHealth:50.0f,GearUp:0b,DogTagIcon:[[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[I;-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]],MainEngineDamaged:0b,Locked:0b,LoiterActive:0b,SubEngineHealth:50.0f,Motion:[0.0d,0.0d,0.0d],Health:60.0f,OnGround:1b,DecoyCount:0,TurretBurnTimer:0,Rotation:[-90.0f,0.0f],SympatheticDetonated:0b,LeftWheelDamaged:0b,Fire:-1s,Power:0.0f}}} 1
give @a[tag=fl_tow_operator] superbwarfare:medium_anti_ground_missile 1
give @a[tag=fl_tow_operator] superbwarfare:crowbar 1
tag @a remove fl_tow_operator

tag @r[team=red] add fl_navigator

# Выдача командирского целеуказателя
execute as @a[team=red,tag=fl_navigator] run give @s sbw_tweaks:strike_designator{SbwStrike:{shells:60,spread:100.0d,interval:80,max_uses:3,charge_ticks:120,cancel_ticks:60,lock_mode:"BARRAGE",pattern:"GAUSSIAN"},display:{Name:'{"text":"Командирский целеуказатель","color":"dark_red","bold":true,"italic":false}'}} 1

function zov:nav/update

# Спавн БМП-2
summon superbwarfare:bmp_2 24 64 -819 {WeaponState:{Missile:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},Cannon:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},ArmorPlate:{Count:1b},MG1:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG3:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG2:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MainMachineGun:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},"@MG":{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG5:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG4:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG6:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}}},PropellerRot:0.0f,LeftWheelHealth:50.0f,ChargeProgress:0.0f,Invulnerable:0b,MainEngineHealth:50.0f,IsWreck:0b,PortalCooldown:0,TurretHealth:50.0f,RightWheelDamaged:0b,GearUp:0b,SelectedWeapon:[I;0,0,0,0,0,0,0],FallDistance:0.0f,MainEngineDamaged:0b,CanUpdate:1b,Energy:5000000,GearRot:0.0f,SubEngineHealth:50.0f,DecoyReady:1b,Health:300.0f,Air:300s,OnGround:1b,TurretBurnTimer:0,SubEngineDamaged:0b,TurretBurned:0b,SympatheticDetonated:0b,RightWheelHealth:50.0f,LeftWheelDamaged:0b,Fire:-1s,TurretDamaged:0b,Power:0.0f,Inventory:{Size:54,Items:[{Slot:0,id:"superbwarfare:small_shell_ap",Count:64b},{Slot:1,id:"superbwarfare:small_shell_ap",Count:64b},{Slot:2,id:"superbwarfare:small_shell_gs",Count:64b},{Slot:3,id:"superbwarfare:small_shell_gs",Count:64b},{Slot:4,id:"superbwarfare:small_shell_he",Count:64b},{Slot:5,id:"superbwarfare:small_shell_he",Count:64b},{Slot:6,id:"superbwarfare:small_shell_he",Count:64b},{Slot:7,id:"superbwarfare:small_shell_he",Count:64b},{Slot:8,id:"superbwarfare:large_battery_pack",Count:1b,tag:{Energy:20000000}},{Slot:9,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:10,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:11,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:12,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:13,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:14,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:15,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:16,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:17,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:18,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:19,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:20,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:21,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:22,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:23,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:24,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:25,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:26,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:27,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:28,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:29,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:30,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:31,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:32,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:33,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:34,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:35,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:36,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:37,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:38,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:39,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:40,id:"superbwarfare:rifle_ammo",Count:16b},{Slot:41,id:"minecraft:bread",Count:1b}]}}

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