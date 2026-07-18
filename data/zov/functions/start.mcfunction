# ================================================
# ZOV — START
# ================================================

scoreboard players set #canstart fl_math 1

execute if score #global fl_state matches 1 run scoreboard players set #canstart fl_math 0
execute if score #global fl_state matches 1 run tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Игра уже идёт! ","color":"red"},{"text":"/function zov:reset","color":"yellow"},{"text":" для сброса.","color":"gray"}]

execute if score #canstart fl_math matches 0 run tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Запуск отменён.","color":"red"}]
execute unless score #canstart fl_math matches 1 run return 0

function zov:cleanup

gamerule keepInventory true
gamerule doImmediateRespawn true
gamerule naturalRegeneration true

gamemode survival @a

team modify red nametagVisibility hideForOtherTeams
team modify blue nametagVisibility hideForOtherTeams
team modify red deathMessageVisibility hideForOtherTeams
team modify blue deathMessageVisibility hideForOtherTeams

scoreboard players operation @a fl_prev_deaths = @a fl_deaths
scoreboard players set @a fl_dead 0
tag @a remove fl_waiting
tag @a remove fl_navigator

effect clear @a minecraft:resistance
effect clear @a minecraft:slowness
effect clear @a minecraft:mining_fatigue

effect give @a minecraft:regeneration 5 255 true
effect give @a minecraft:saturation 5 255 true

weather clear
time set 0

spawnpoint @a[team=red] 18 64 -817
execute as @a[team=red] run tp @s 18 64 -817 0 0

function zov:spawn/set_blue_1
execute as @a[team=blue] run spawnpoint @s 37 72 -406
execute as @a[team=blue] run tp @s 37 72 -406

scoreboard players set #global fl_state 1
scoreboard players set #global fl_active 1
scoreboard players set #global fl_progress 0
scoreboard players set #global fl_captured 0
scoreboard players set #global fl_round 24000
scoreboard players set #sound_timer fl_math 0
scoreboard players set #zone_state fl_math 0

bossbar set zov:progress visible true
bossbar set zov:progress value 24000

# ================================================
# ВЫДАЧА ВЕЩЕЙ
# ================================================

give @a[team=red] superbwarfare:ru_helmet_6b47{Unbreakable:1b} 1
give @a[team=red] superbwarfare:ru_chest_6b43{Unbreakable:1b} 1
give @a[team=blue] superbwarfare:us_helmet_pasgt{Unbreakable:1b} 1
give @a[team=blue] superbwarfare:us_chest_iotv{Unbreakable:1b} 1

give @a[team=red] superbwarfare:ak_12 1
give @a[team=blue] superbwarfare:m_4 1

# x2 патронов коробок
give @a superbwarfare:rifle_ammo_box 14
give @a superbwarfare:armor_plate 4
give @a superbwarfare:medical_kit 3
give @a superbwarfare:rpg 1
give @a superbwarfare:rpg_rocket_tbg 2
give @a superbwarfare:hand_grenade 2
give @a superbwarfare:knife 1
give @a minecraft:bread 12

# Тепловизоры/ПНВ — только если включены в настройках
execute if score #goggles_enabled fl_math matches 1 run give @a superbwarfare:thermal_imaging_goggles 1

give @a[team=red] superbwarfare:m18_smoke_grenade 2
give @a[team=blue] superbwarfare:m18_smoke_grenade 2

give @a[team=blue] superbwarfare:sandbag 16
give @a[team=blue] superbwarfare:blu_43_mine 6
give @a[team=blue] superbwarfare:barbed_wire 4
give @a[team=blue] superbwarfare:dragon_teeth 3
give @a[team=blue] superbwarfare:tm_62 2
give @a[team=blue] superbwarfare:edd 1

tag @a[team=blue,limit=1,sort=random] add fl_tow_operator
give @a[tag=fl_tow_operator] superbwarfare:tow_deployer 1
give @a[tag=fl_tow_operator] superbwarfare:medium_anti_ground_missile 1
tag @a remove fl_tow_operator

# Компасы: навигатор красных + все синие (через nav/update)
tag @a[team=red,limit=1,sort=random] add fl_navigator
function zov:nav/update

summon superbwarfare:bmp_2 24 64 -819 {WeaponState:{Missile:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},Cannon:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG1:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG3:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG2:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MainMachineGun:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},"@MG":{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG5:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG4:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}},MG6:{Count:1b,tag:{Perks:{},GunData:{},Attachments:{}}}},PropellerRot:0.0f,LeftWheelHealth:50.0f,ChargeProgress:0.0f,Invulnerable:0b,MainEngineHealth:50.0f,IsWreck:0b,PortalCooldown:0,TurretHealth:50.0f,RightWheelDamaged:0b,GearUp:0b,SelectedWeapon:[I;0,0,0,0,0,0,0],FallDistance:0.0f,MainEngineDamaged:0b,CanUpdate:1b,Energy:5000000,GearRot:0.0f,SubEngineHealth:50.0f,DecoyReady:1b,Health:300.0f,Air:300s,OnGround:1b,TurretBurnTimer:0,SubEngineDamaged:0b,TurretBurned:0b,SympatheticDetonated:0b,RightWheelHealth:50.0f,LeftWheelDamaged:0b,Fire:-1s,TurretDamaged:0b,Power:0.0f,Inventory:{Size:54,Items:[{Slot:0,id:"superbwarfare:small_shell_ap",Count:64b},{Slot:1,id:"superbwarfare:small_shell_gs",Count:64b},{Slot:2,id:"superbwarfare:small_shell_he",Count:64b},{Slot:3,id:"superbwarfare:small_shell_he",Count:64b},{Slot:4,id:"superbwarfare:large_battery_pack",Count:1b,tag:{Energy:20000000}},{Slot:5,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:6,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:7,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:8,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:9,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:10,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:11,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:12,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:13,id:"superbwarfare:rifle_ammo",Count:64b},{Slot:14,id:"minecraft:bread",Count:1b}]}}

tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"БМП-2 готова на базе!","color":"green"}]

# Название ставим один раз при старте, значение — из tick_logic
function zov:hud/bossbar_name
function zov:hud/bossbar

title @a times 20 60 20
title @a title [{"text":"БОЙ НАЧАЛСЯ","color":"red","bold":true}]
title @a subtitle [{"text":"Красные атакуют  •  Синие защищают","color":"white"}]
tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Первая цель: ","color":"white"},{"text":"ТОЧКА A1","color":"yellow","bold":true}]
tellraw @a[team=red,tag=fl_navigator] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Ты навигатор — держи компас в руке!","color":"yellow"}]
tellraw @a[team=blue] [{"text":"[ZOV] ","color":"aqua","bold":true},{"text":"Компас ведёт к вашей точке защиты.","color":"aqua"}]

# Начальное объявление времени
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"До конца раунда: ","color":"white"},{"text":"20 минут","color":"green","bold":true}]

# Сброс таймера лодок — первая лодка появится через 60 сек
scoreboard players set #boat_timer fl_math 0