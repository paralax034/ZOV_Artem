# ================================================
# ZOV — НАВИГАЦИЯ СИНИХ: ЗОНА A2
# ================================================

execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=-11,y=72,z=-289,dx=11,dy=18,dz=17] if score #zone_state fl_math matches 0 run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A2","color":"yellow","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=-11,y=72,z=-289,dx=11,dy=18,dz=17] if score #zone_state fl_math matches 1 run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A2","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] at @s unless entity @s[x=-11,y=72,z=-289,dx=11,dy=18,dz=17] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A2","color":"yellow","bold":true}]