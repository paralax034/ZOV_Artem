# ================================================
# ZOV — НАВИГАЦИЯ СИНИХ: ЗОНА A3
# ================================================

execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=-192,y=63,z=-169,dx=11,dy=3,dz=9] if score #zone_state fl_math matches 0 run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A3","color":"yellow","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=-192,y=63,z=-169,dx=11,dy=3,dz=9] if score #zone_state fl_math matches 1 run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A3","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] at @s unless entity @s[x=-192,y=63,z=-169,dx=11,dy=3,dz=9] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A3","color":"yellow","bold":true}]