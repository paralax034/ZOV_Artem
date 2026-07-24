# 
# ZOV — ПОПОЛНЕНИЕ ПРИ ЗАХВАТЕ ТОЧКИ
# Вызывается автоматически при захвате любой зоны
# 

# --- 1. Выдача общих припасов только живой пехоте ---
superbwarfare ammo add @a[tag=!fl_waiting] rifle 400
give @a[tag=!fl_waiting] superbwarfare:armor_plate 2
give @a[tag=!fl_waiting] superbwarfare:medical_kit 4
give @a[tag=!fl_waiting] minecraft:bread 20

# --- 1a. Выдача персонального штурмового комплекта Красным ---
execute as @a[team=red,tag=!fl_waiting] run function zov:zone/red_resupply

# --- 2. Логика выбора получателя боекомплекта БМП ---
tag @a remove fl_recipient
execute at @e[type=superbwarfare:bmp_2,limit=1] run tag @p[team=red,tag=!fl_waiting] add fl_recipient
execute unless entity @a[tag=fl_recipient] run tag @s add fl_recipient

# --- 3. Выдача тяжелого БК помеченному игроку (сжатие количества стаков) ---

# ОБЫЧНЫЕ ТОЧКИ ЗАХВАТА (x2 БК)
execute unless score #global fl_active matches 4..5 run give @a[tag=fl_recipient] superbwarfare:small_shell_ap 128
execute unless score #global fl_active matches 4..5 run give @a[tag=fl_recipient] superbwarfare:small_shell_gs 128
execute unless score #global fl_active matches 4..5 run give @a[tag=fl_recipient] superbwarfare:small_shell_he 128
execute unless score #global fl_active matches 4..5 run give @a[tag=fl_recipient] superbwarfare:large_battery_pack{Energy:20000000} 2
execute unless score #global fl_active matches 4..5 run give @a[tag=fl_recipient] superbwarfare:rifle_ammo 256

# УКРЕПЛЕННЫЕ ТОЧКИ ЗАХВАТА A4 И A5 (x3 БК)
execute if score #global fl_active matches 4..5 run give @a[tag=fl_recipient] superbwarfare:small_shell_ap 192
execute if score #global fl_active matches 4..5 run give @a[tag=fl_recipient] superbwarfare:small_shell_gs 192
execute if score #global fl_active matches 4..5 run give @a[tag=fl_recipient] superbwarfare:small_shell_he 192
execute if score #global fl_active matches 4..5 run give @a[tag=fl_recipient] superbwarfare:large_battery_pack{Energy:20000000} 3
execute if score #global fl_active matches 4..5 run give @a[tag=fl_recipient] superbwarfare:rifle_ammo 384

# --- УНИКАЛЬНАЯ НАГРАДА ТОЧКИ A3: РЕМОНТНЫЙ ИНСТРУМЕНТ ---
execute if score #global fl_active matches 3 run give @a[tag=fl_recipient] superbwarfare:repair_tool{GeckoLibID:300L,Perks:{},Energy:50000,GunData:{UUID:[I;422527153,1217022748,-1627284349,-405812130],CloseStrike:1b},Attachments:{}} 1

# --- 4. Оповещения в чат ---
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Пополнение припасов выдано всей пехоте!","color":"green"}]
tellraw @a[tag=fl_recipient] [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Вы получили боекомплект для БМП-2!","color":"green"}]
execute if score #global fl_active matches 3 run tellraw @a[tag=fl_recipient] [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Вы также получили ремонтный инструмент для БМП-2!","color":"green"}]
execute if entity @a[tag=fl_recipient] run tellraw @a[tag=!fl_recipient] [{"text":"[ZOV] ","color":"gold","bold":true},{"selector":"@a[tag=fl_recipient,limit=1]","color":"yellow","bold":true},{"text":" получил танковый БК для БМП-2!","color":"green"}]

# --- 5. Очистка временного тега получателя ---
tag @a remove fl_recipient