# ================================================
# ZOV — НАВИГАЦИЯ СИНИХ: ЗОНА A7 (Завод)
# Финальная точка — особое название и цвет
# ================================================

execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=310,y=99,z=208,dx=5,dy=2,dz=6] if score #zone_state fl_math matches 0 run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"ЗАВОД A7","color":"red","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=310,y=99,z=208,dx=5,dy=2,dz=6] if score #zone_state fl_math matches 1 run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ЗАВОД ","color":"red","bold":true},{"text":"A7","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] at @s unless entity @s[x=310,y=99,z=208,dx=5,dy=2,dz=6] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"ЗАВОД A7","color":"red","bold":true}]