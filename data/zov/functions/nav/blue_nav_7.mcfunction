# ================================================
# ZOV — НАВИГАЦИЯ СИНИХ: ЗОНА A7 (Завод)
# П-1: x/dx/dy/dz перенесены в основной селектор @a[...]
# at @s убран — title @s actionbar не требует позиции выполнения
# ================================================

execute if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=310,y=99,z=208,dx=5,dy=2,dz=6] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"ЗАВОД A7","color":"red","bold":true}]
execute if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=310,y=99,z=208,dx=5,dy=2,dz=6] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ЗАВОД ","color":"red","bold":true},{"text":"A7","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] unless entity @s[x=310,y=99,z=208,dx=5,dy=2,dz=6] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"ЗАВОД A7","color":"red","bold":true}]