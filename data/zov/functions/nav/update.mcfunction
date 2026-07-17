# ================================================
# ZOV — НАВИГАЦИЯ: LODESTONE + КОМПАС
# Красный: fl_navigator — один игрок, имя "→ AN | Захватить"
# Синие: все, имя "→ AN | Защищать"
# Вызывается из start и zone/next
# ================================================

# --- A1 ---
execute if score #global fl_active matches 1 run setblock 37 62 -406 minecraft:lodestone
execute if score #global fl_active matches 1 run clear @a[tag=fl_navigator] minecraft:compass
execute if score #global fl_active matches 1 run give @a[tag=fl_navigator] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:37,Y:62,Z:-406},LodestoneTracked:1b,display:{Name:'{"text":"→ A1 | Захватить","color":"red","bold":true,"italic":false}'}}
execute if score #global fl_active matches 1 run clear @a[team=blue] minecraft:compass
execute if score #global fl_active matches 1 run give @a[team=blue] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:37,Y:62,Z:-406},LodestoneTracked:1b,display:{Name:'{"text":"→ A1 | Защищать","color":"aqua","bold":true,"italic":false}'}}

# --- A2 ---
execute if score #global fl_active matches 2 run setblock 37 62 -406 minecraft:stone
execute if score #global fl_active matches 2 run setblock -5 71 -280 minecraft:lodestone
execute if score #global fl_active matches 2 run clear @a[tag=fl_navigator] minecraft:compass
execute if score #global fl_active matches 2 run give @a[tag=fl_navigator] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-5,Y:71,Z:-280},LodestoneTracked:1b,display:{Name:'{"text":"→ A2 | Захватить","color":"red","bold":true,"italic":false}'}}
execute if score #global fl_active matches 2 run clear @a[team=blue] minecraft:compass
execute if score #global fl_active matches 2 run give @a[team=blue] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-5,Y:71,Z:-280},LodestoneTracked:1b,display:{Name:'{"text":"→ A2 | Защищать","color":"aqua","bold":true,"italic":false}'}}

# --- A3 ---
execute if score #global fl_active matches 3 run setblock -5 71 -280 minecraft:stone
execute if score #global fl_active matches 3 run setblock -186 54 -164 minecraft:lodestone
execute if score #global fl_active matches 3 run clear @a[tag=fl_navigator] minecraft:compass
execute if score #global fl_active matches 3 run give @a[tag=fl_navigator] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-186,Y:54,Z:-164},LodestoneTracked:1b,display:{Name:'{"text":"→ A3 | Захватить","color":"red","bold":true,"italic":false}'}}
execute if score #global fl_active matches 3 run clear @a[team=blue] minecraft:compass
execute if score #global fl_active matches 3 run give @a[team=blue] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-186,Y:54,Z:-164},LodestoneTracked:1b,display:{Name:'{"text":"→ A3 | Защищать","color":"aqua","bold":true,"italic":false}'}}

# --- A4 ---
execute if score #global fl_active matches 4 run setblock -186 54 -164 minecraft:stone
execute if score #global fl_active matches 4 run setblock -404 55 -286 minecraft:lodestone
execute if score #global fl_active matches 4 run clear @a[tag=fl_navigator] minecraft:compass
execute if score #global fl_active matches 4 run give @a[tag=fl_navigator] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-404,Y:55,Z:-286},LodestoneTracked:1b,display:{Name:'{"text":"→ A4 | Захватить","color":"red","bold":true,"italic":false}'}}
execute if score #global fl_active matches 4 run clear @a[team=blue] minecraft:compass
execute if score #global fl_active matches 4 run give @a[team=blue] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-404,Y:55,Z:-286},LodestoneTracked:1b,display:{Name:'{"text":"→ A4 | Защищать","color":"aqua","bold":true,"italic":false}'}}

# --- A5 ---
execute if score #global fl_active matches 5 run setblock -404 55 -286 minecraft:stone
execute if score #global fl_active matches 5 run setblock -412 55 58 minecraft:lodestone
execute if score #global fl_active matches 5 run clear @a[tag=fl_navigator] minecraft:compass
execute if score #global fl_active matches 5 run give @a[tag=fl_navigator] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-412,Y:55,Z:58},LodestoneTracked:1b,display:{Name:'{"text":"→ A5 | Захватить","color":"red","bold":true,"italic":false}'}}
execute if score #global fl_active matches 5 run clear @a[team=blue] minecraft:compass
execute if score #global fl_active matches 5 run give @a[team=blue] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-412,Y:55,Z:58},LodestoneTracked:1b,display:{Name:'{"text":"→ A5 | Защищать","color":"aqua","bold":true,"italic":false}'}}

# --- A6 ---
execute if score #global fl_active matches 6 run setblock -412 55 58 minecraft:stone
execute if score #global fl_active matches 6 run setblock -171 54 122 minecraft:lodestone
execute if score #global fl_active matches 6 run clear @a[tag=fl_navigator] minecraft:compass
execute if score #global fl_active matches 6 run give @a[tag=fl_navigator] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-171,Y:54,Z:122},LodestoneTracked:1b,display:{Name:'{"text":"→ A6 | Захватить","color":"red","bold":true,"italic":false}'}}
execute if score #global fl_active matches 6 run clear @a[team=blue] minecraft:compass
execute if score #global fl_active matches 6 run give @a[team=blue] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:-171,Y:54,Z:122},LodestoneTracked:1b,display:{Name:'{"text":"→ A6 | Защищать","color":"aqua","bold":true,"italic":false}'}}

# --- A7 ---
execute if score #global fl_active matches 7 run setblock -171 54 122 minecraft:stone
execute if score #global fl_active matches 7 run setblock 312 90 211 minecraft:lodestone
execute if score #global fl_active matches 7 run clear @a[tag=fl_navigator] minecraft:compass
execute if score #global fl_active matches 7 run give @a[tag=fl_navigator] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:312,Y:90,Z:211},LodestoneTracked:1b,display:{Name:'{"text":"→ ЗАВОД A7 | Захватить","color":"red","bold":true,"italic":false}'}}
execute if score #global fl_active matches 7 run clear @a[team=blue] minecraft:compass
execute if score #global fl_active matches 7 run give @a[team=blue] minecraft:compass{LodestoneDimension:"minecraft:overworld",LodestonePos:{X:312,Y:90,Z:211},LodestoneTracked:1b,display:{Name:'{"text":"→ ЗАВОД A7 | Защищать","color":"aqua","bold":true,"italic":false}'}}