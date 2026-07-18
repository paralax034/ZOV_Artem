# ================================================
# ZOV — НАВИГАЦИЯ СИНИХ: ЗОНА A4
# ================================================

execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=-407,y=64,z=-289,dx=6,dy=3,dz=6] if score #zone_state fl_math matches 0 run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A4","color":"yellow","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=-407,y=64,z=-289,dx=6,dy=3,dz=6] if score #zone_state fl_math matches 1 run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A4","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] at @s unless entity @s[x=-407,y=64,z=-289,dx=6,dy=3,dz=6] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A4","color":"yellow","bold":true}]