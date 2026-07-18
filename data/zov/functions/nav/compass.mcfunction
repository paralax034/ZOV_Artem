# ================================================
# ZOV — КОМПАС: направление + дистанция
# Вызывается из tick_logic раз в 20 тиков (1 сек)
# ТОЛЬКО при zone_state=0 и наличии тега fl_holds_compass
#
# Тег fl_holds_compass обновляется в internal/update_compass_tag
# до вызова этой функции — NBT-проверка там, не здесь
#
# at @s обязателен: все позиционные проверки (dx/dz, distance)
# считаются от позиции выполнения, а не от позиции игрока
# ================================================

# --- ЗОНА A1 ---
# Игрок южнее точки (z < -406): выполнение перемещается на игрока, затем на точку
execute if score #global fl_active matches 1 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=4593] positioned 37 72 -406 if entity @s[distance=200..] run title @s actionbar [{"text":"A1: далеко >> Юг","color":"red"}]
# Игрок севернее точки (z > -406)
execute if score #global fl_active matches 1 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-405,dx=10000,dy=500,dz=5405] positioned 37 72 -406 if entity @s[distance=200..] run title @s actionbar [{"text":"A1: далеко >> Север","color":"red"}]
# Средняя дистанция, южнее
execute if score #global fl_active matches 1 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=4593] positioned 37 72 -406 if entity @s[distance=50..199] run title @s actionbar [{"text":"A1: ~200 бл >> Юг","color":"yellow"}]
# Средняя дистанция, севернее
execute if score #global fl_active matches 1 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-405,dx=10000,dy=500,dz=5405] positioned 37 72 -406 if entity @s[distance=50..199] run title @s actionbar [{"text":"A1: ~200 бл >> Север","color":"yellow"}]
# Рядом — полуплоскость не нужна, просто дистанция
execute if score #global fl_active matches 1 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned 37 72 -406 if entity @s[distance=..49] run title @s actionbar [{"text":"A1: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A2 ---
execute if score #global fl_active matches 2 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=4719] positioned -5 81 -280 if entity @s[distance=200..] run title @s actionbar [{"text":"A2: далеко >> Юг","color":"red"}]
execute if score #global fl_active matches 2 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-279,dx=10000,dy=500,dz=5279] positioned -5 81 -280 if entity @s[distance=200..] run title @s actionbar [{"text":"A2: далеко >> Север","color":"red"}]
execute if score #global fl_active matches 2 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=4719] positioned -5 81 -280 if entity @s[distance=50..199] run title @s actionbar [{"text":"A2: ~200 бл >> Юг","color":"yellow"}]
execute if score #global fl_active matches 2 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-279,dx=10000,dy=500,dz=5279] positioned -5 81 -280 if entity @s[distance=50..199] run title @s actionbar [{"text":"A2: ~200 бл >> Север","color":"yellow"}]
execute if score #global fl_active matches 2 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -5 81 -280 if entity @s[distance=..49] run title @s actionbar [{"text":"A2: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A3 ---
execute if score #global fl_active matches 3 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=4835] positioned -186 64 -164 if entity @s[distance=200..] run title @s actionbar [{"text":"A3: далеко >> Юг","color":"red"}]
execute if score #global fl_active matches 3 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-163,dx=10000,dy=500,dz=5163] positioned -186 64 -164 if entity @s[distance=200..] run title @s actionbar [{"text":"A3: далеко >> Север","color":"red"}]
execute if score #global fl_active matches 3 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=4835] positioned -186 64 -164 if entity @s[distance=50..199] run title @s actionbar [{"text":"A3: ~200 бл >> Юг","color":"yellow"}]
execute if score #global fl_active matches 3 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-163,dx=10000,dy=500,dz=5163] positioned -186 64 -164 if entity @s[distance=50..199] run title @s actionbar [{"text":"A3: ~200 бл >> Север","color":"yellow"}]
execute if score #global fl_active matches 3 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -186 64 -164 if entity @s[distance=..49] run title @s actionbar [{"text":"A3: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A4 ---
execute if score #global fl_active matches 4 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=4713] positioned -404 65 -286 if entity @s[distance=200..] run title @s actionbar [{"text":"A4: далеко >> Юг","color":"red"}]
execute if score #global fl_active matches 4 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-285,dx=10000,dy=500,dz=5285] positioned -404 65 -286 if entity @s[distance=200..] run title @s actionbar [{"text":"A4: далеко >> Север","color":"red"}]
execute if score #global fl_active matches 4 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=4713] positioned -404 65 -286 if entity @s[distance=50..199] run title @s actionbar [{"text":"A4: ~200 бл >> Юг","color":"yellow"}]
execute if score #global fl_active matches 4 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-285,dx=10000,dy=500,dz=5285] positioned -404 65 -286 if entity @s[distance=50..199] run title @s actionbar [{"text":"A4: ~200 бл >> Север","color":"yellow"}]
execute if score #global fl_active matches 4 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -404 65 -286 if entity @s[distance=..49] run title @s actionbar [{"text":"A4: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A5 ---
execute if score #global fl_active matches 5 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=5057] positioned -412 65 58 if entity @s[distance=200..] run title @s actionbar [{"text":"A5: далеко >> Юг","color":"red"}]
execute if score #global fl_active matches 5 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=59,dx=10000,dy=500,dz=4941] positioned -412 65 58 if entity @s[distance=200..] run title @s actionbar [{"text":"A5: далеко >> Север","color":"red"}]
execute if score #global fl_active matches 5 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=5057] positioned -412 65 58 if entity @s[distance=50..199] run title @s actionbar [{"text":"A5: ~200 бл >> Юг","color":"yellow"}]
execute if score #global fl_active matches 5 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=59,dx=10000,dy=500,dz=4941] positioned -412 65 58 if entity @s[distance=50..199] run title @s actionbar [{"text":"A5: ~200 бл >> Север","color":"yellow"}]
execute if score #global fl_active matches 5 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -412 65 58 if entity @s[distance=..49] run title @s actionbar [{"text":"A5: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A6 ---
execute if score #global fl_active matches 6 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=5121] positioned -171 64 122 if entity @s[distance=200..] run title @s actionbar [{"text":"A6: далеко >> Юг","color":"red"}]
execute if score #global fl_active matches 6 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=123,dx=10000,dy=500,dz=4877] positioned -171 64 122 if entity @s[distance=200..] run title @s actionbar [{"text":"A6: далеко >> Север","color":"red"}]
execute if score #global fl_active matches 6 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=5121] positioned -171 64 122 if entity @s[distance=50..199] run title @s actionbar [{"text":"A6: ~200 бл >> Юг","color":"yellow"}]
execute if score #global fl_active matches 6 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=123,dx=10000,dy=500,dz=4877] positioned -171 64 122 if entity @s[distance=50..199] run title @s actionbar [{"text":"A6: ~200 бл >> Север","color":"yellow"}]
execute if score #global fl_active matches 6 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -171 64 122 if entity @s[distance=..49] run title @s actionbar [{"text":"A6: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A7 (Завод) ---
execute if score #global fl_active matches 7 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=5210] positioned 312 100 211 if entity @s[distance=200..] run title @s actionbar [{"text":"A7: далеко >> Юг","color":"red"}]
execute if score #global fl_active matches 7 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=212,dx=10000,dy=500,dz=4788] positioned 312 100 211 if entity @s[distance=200..] run title @s actionbar [{"text":"A7: далеко >> Север","color":"red"}]
execute if score #global fl_active matches 7 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=-5000,dx=10000,dy=500,dz=5210] positioned 312 100 211 if entity @s[distance=50..199] run title @s actionbar [{"text":"A7: ~200 бл >> Юг","color":"yellow"}]
execute if score #global fl_active matches 7 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s if entity @s[x=-5000,y=0,z=212,dx=10000,dy=500,dz=4788] positioned 312 100 211 if entity @s[distance=50..199] run title @s actionbar [{"text":"A7: ~200 бл >> Север","color":"yellow"}]
execute if score #global fl_active matches 7 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned 312 100 211 if entity @s[distance=..49] run title @s actionbar [{"text":"A7-ЗАВОД: РЯДОМ!","color":"green","bold":true}]