# ================================================
# ZOV — НАВИГАЦИЯ СИНИХ: ЗОНА A1
# П-1: x/dx/dy/dz перенесены в основной селектор @a[...]
# at @s убран — title @s actionbar не требует позиции выполнения
# zone_state=0 → "Защищайте", =1 → "ОТБЕЙТЕ!", вне зоны → "Идите"
# ================================================

# На точке, захвата нет — защита идёт штатно
execute if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=27,y=68,z=-409,dx=21,dy=8,dz=5] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A1","color":"yellow","bold":true}]

# На точке, идёт захват красными
execute if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=27,y=68,z=-409,dx=21,dy=8,dz=5] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A1","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]

# Вне точки — идти туда
execute as @a[team=blue,tag=!fl_waiting] unless entity @s[x=27,y=68,z=-409,dx=21,dy=8,dz=5] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A1","color":"yellow","bold":true}]