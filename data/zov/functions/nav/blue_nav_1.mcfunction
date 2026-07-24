# 
# ZOV — НАВИГАЦИЯ СИНИХ: ЗОНА A1
# 

# --- Вариант 0 (Здание 1) ---
execute if score #a1_variant fl_math matches 0 if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=27,y=53,z=-409,dx=21,dy=38,dz=5] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A1","color":"yellow","bold":true}]
execute if score #a1_variant fl_math matches 0 if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=27,y=53,z=-409,dx=21,dy=38,dz=5] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A1","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]
execute if score #a1_variant fl_math matches 0 as @a[team=blue,tag=!fl_waiting] unless entity @s[x=27,y=53,z=-409,dx=21,dy=38,dz=5] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A1","color":"yellow","bold":true}]

# --- Вариант 1 (Здание 2) ---
execute if score #a1_variant fl_math matches 1 if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=-61,y=70,z=-424,dx=8,dy=7,dz=20] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A1","color":"yellow","bold":true}]
execute if score #a1_variant fl_math matches 1 if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=-61,y=70,z=-424,dx=8,dy=7,dz=20] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A1","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]
execute if score #a1_variant fl_math matches 1 as @a[team=blue,tag=!fl_waiting] unless entity @s[x=-61,y=70,z=-424,dx=8,dy=7,dz=20] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A1","color":"yellow","bold":true}]