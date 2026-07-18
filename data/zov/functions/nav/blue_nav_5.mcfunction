# ================================================
# ZOV — НАВИГАЦИЯ СИНИХ: ЗОНА A5
# ================================================

execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=-423,y=63,z=48,dx=21,dy=5,dz=21] if score #zone_state fl_math matches 0 run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A5","color":"yellow","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=-423,y=63,z=48,dx=21,dy=5,dz=21] if score #zone_state fl_math matches 1 run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A5","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] at @s unless entity @s[x=-423,y=63,z=48,dx=21,dy=5,dz=21] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A5","color":"yellow","bold":true}]