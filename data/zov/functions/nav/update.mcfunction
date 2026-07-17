# ================================================
# ZOV — НАВИГАЦИЯ: LODESTONE + КОМПАС
# Вызывается из zone/next (после increment fl_active)
# и из start (инициализация)
# Lodestone ставится на Y-10 от центра зоны
# ================================================

# --- ЗОНА A1: убрать если переходим с неё, поставить если это старт ---
execute if score #global fl_active matches 1 run setblock 37 62 -406 minecraft:lodestone
execute if score #global fl_active matches 1 run clear @a[team=red] minecraft:compass
execute if score #global fl_active matches 1 run give @a[team=red,limit=1,sort=random] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:37,Y:62,Z:-406},LodestoneTracked:1b}

# --- ПЕРЕХОД НА A2: убрать A1, поставить A2 ---
execute if score #global fl_active matches 2 run setblock 37 62 -406 minecraft:stone
execute if score #global fl_active matches 2 run setblock -5 71 -280 minecraft:lodestone
execute if score #global fl_active matches 2 run clear @a[team=red] minecraft:compass
execute if score #global fl_active matches 2 run give @a[team=red,limit=1,sort=random] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-5,Y:71,Z:-280},LodestoneTracked:1b}

# --- ПЕРЕХОД НА A3: убрать A2, поставить A3 ---
execute if score #global fl_active matches 3 run setblock -5 71 -280 minecraft:stone
execute if score #global fl_active matches 3 run setblock -186 54 -164 minecraft:lodestone
execute if score #global fl_active matches 3 run clear @a[team=red] minecraft:compass
execute if score #global fl_active matches 3 run give @a[team=red,limit=1,sort=random] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-186,Y:54,Z:-164},LodestoneTracked:1b}

# --- ПЕРЕХОД НА A4: убрать A3, поставить A4 ---
execute if score #global fl_active matches 4 run setblock -186 54 -164 minecraft:stone
execute if score #global fl_active matches 4 run setblock -404 55 -286 minecraft:lodestone
execute if score #global fl_active matches 4 run clear @a[team=red] minecraft:compass
execute if score #global fl_active matches 4 run give @a[team=red,limit=1,sort=random] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-404,Y:55,Z:-286},LodestoneTracked:1b}

# --- ПЕРЕХОД НА A5: убрать A4, поставить A5 ---
execute if score #global fl_active matches 5 run setblock -404 55 -286 minecraft:stone
execute if score #global fl_active matches 5 run setblock -412 55 58 minecraft:lodestone
execute if score #global fl_active matches 5 run clear @a[team=red] minecraft:compass
execute if score #global fl_active matches 5 run give @a[team=red,limit=1,sort=random] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-412,Y:55,Z:58},LodestoneTracked:1b}

# --- ПЕРЕХОД НА A6: убрать A5, поставить A6 ---
execute if score #global fl_active matches 6 run setblock -412 55 58 minecraft:stone
execute if score #global fl_active matches 6 run setblock -171 54 122 minecraft:lodestone
execute if score #global fl_active matches 6 run clear @a[team=red] minecraft:compass
execute if score #global fl_active matches 6 run give @a[team=red,limit=1,sort=random] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-171,Y:54,Z:122},LodestoneTracked:1b}

# --- ПЕРЕХОД НА A7: убрать A6, поставить A7 ---
execute if score #global fl_active matches 7 run setblock -171 54 122 minecraft:stone
execute if score #global fl_active matches 7 run setblock 312 90 211 minecraft:lodestone
execute if score #global fl_active matches 7 run clear @a[team=red] minecraft:compass
execute if score #global fl_active matches 7 run give @a[team=red,limit=1,sort=random] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:312,Y:90,Z:211},LodestoneTracked:1b}