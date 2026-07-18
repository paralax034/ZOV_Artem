# ================================================
# ZOV — НАВИГАЦИЯ СИНИХ: ЗОНА A5
# П-1: x/dx/dy/dz перенесены в основной селектор @a[...]
# at @s убран — title @s actionbar не требует позиции выполнения
# ================================================

execute if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=-423,y=63,z=48,dx=21,dy=5,dz=21] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A5","color":"yellow","bold":true}]
execute if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=-423,y=63,z=48,dx=21,dy=5,dz=21] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A5","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]
execute as @a[team=blue,tag=!fl_waiting] unless entity @s[x=-423,y=63,z=48,dx=21,dy=5,dz=21] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A5","color":"yellow","bold":true}]