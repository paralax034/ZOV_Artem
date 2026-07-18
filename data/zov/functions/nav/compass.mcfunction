# ================================================
# ZOV — КОМПАС: дистанция до активной точки
# Вызывается из tick_logic раз в 20 тиков
# ТОЛЬКО при zone_state=0 и наличии тега fl_holds_compass
#
# Три диапазона: далеко (200+), средне (50..199), рядом (..49)
# Направление показывает лодестоун-стрелка компаса — дублировать не нужно
# at @s обязателен: positioned считает дистанцию от точки до игрока,
# для этого нужно знать где игрок (позиция выполнения = позиция игрока)
# ================================================

# --- ЗОНА A1 ---
execute if score #global fl_active matches 1 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned 37 72 -406 if entity @s[distance=200..] run title @s actionbar [{"text":"A1: далеко","color":"red","bold":true}]
execute if score #global fl_active matches 1 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned 37 72 -406 if entity @s[distance=50..199] run title @s actionbar [{"text":"A1: ~200 блоков","color":"yellow","bold":true}]
execute if score #global fl_active matches 1 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned 37 72 -406 if entity @s[distance=..49] run title @s actionbar [{"text":"A1: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A2 ---
execute if score #global fl_active matches 2 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -5 81 -280 if entity @s[distance=200..] run title @s actionbar [{"text":"A2: далеко","color":"red","bold":true}]
execute if score #global fl_active matches 2 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -5 81 -280 if entity @s[distance=50..199] run title @s actionbar [{"text":"A2: ~200 блоков","color":"yellow","bold":true}]
execute if score #global fl_active matches 2 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -5 81 -280 if entity @s[distance=..49] run title @s actionbar [{"text":"A2: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A3 ---
execute if score #global fl_active matches 3 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -186 64 -164 if entity @s[distance=200..] run title @s actionbar [{"text":"A3: далеко","color":"red","bold":true}]
execute if score #global fl_active matches 3 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -186 64 -164 if entity @s[distance=50..199] run title @s actionbar [{"text":"A3: ~200 блоков","color":"yellow","bold":true}]
execute if score #global fl_active matches 3 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -186 64 -164 if entity @s[distance=..49] run title @s actionbar [{"text":"A3: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A4 ---
execute if score #global fl_active matches 4 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -404 65 -286 if entity @s[distance=200..] run title @s actionbar [{"text":"A4: далеко","color":"red","bold":true}]
execute if score #global fl_active matches 4 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -404 65 -286 if entity @s[distance=50..199] run title @s actionbar [{"text":"A4: ~200 блоков","color":"yellow","bold":true}]
execute if score #global fl_active matches 4 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -404 65 -286 if entity @s[distance=..49] run title @s actionbar [{"text":"A4: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A5 ---
execute if score #global fl_active matches 5 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -412 65 58 if entity @s[distance=200..] run title @s actionbar [{"text":"A5: далеко","color":"red","bold":true}]
execute if score #global fl_active matches 5 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -412 65 58 if entity @s[distance=50..199] run title @s actionbar [{"text":"A5: ~200 блоков","color":"yellow","bold":true}]
execute if score #global fl_active matches 5 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -412 65 58 if entity @s[distance=..49] run title @s actionbar [{"text":"A5: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A6 ---
execute if score #global fl_active matches 6 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -171 64 122 if entity @s[distance=200..] run title @s actionbar [{"text":"A6: далеко","color":"red","bold":true}]
execute if score #global fl_active matches 6 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -171 64 122 if entity @s[distance=50..199] run title @s actionbar [{"text":"A6: ~200 блоков","color":"yellow","bold":true}]
execute if score #global fl_active matches 6 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned -171 64 122 if entity @s[distance=..49] run title @s actionbar [{"text":"A6: РЯДОМ!","color":"green","bold":true}]

# --- ЗОНА A7 ---
execute if score #global fl_active matches 7 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned 312 100 211 if entity @s[distance=200..] run title @s actionbar [{"text":"A7-ЗАВОД: далеко","color":"red","bold":true}]
execute if score #global fl_active matches 7 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned 312 100 211 if entity @s[distance=50..199] run title @s actionbar [{"text":"A7-ЗАВОД: ~200 блоков","color":"yellow","bold":true}]
execute if score #global fl_active matches 7 as @a[team=red,tag=!fl_waiting,tag=fl_holds_compass] at @s positioned 312 100 211 if entity @s[distance=..49] run title @s actionbar [{"text":"A7-ЗАВОД: РЯДОМ!","color":"green","bold":true}]