# ================================================
# ZOV — НАВИГАЦИЯ СИНИХ: ЗОНА A1
# zone_state=0 → "Защищайте", =1 → "ОТБЕЙТЕ!", вне зоны → "Идите"
# at @s обязателен: dx/dz проверяются от позиции игрока
# ================================================

# На точке, захвата нет — защита идёт штатно
execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=27,y=68,z=-409,dx=21,dy=8,dz=5] if score #zone_state fl_math matches 0 run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A1","color":"yellow","bold":true}]

# На точке, идёт захват красными
execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[x=27,y=68,z=-409,dx=21,dy=8,dz=5] if score #zone_state fl_math matches 1 run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A1","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]

# Вне точки — идти туда
execute as @a[team=blue,tag=!fl_waiting] at @s unless entity @s[x=27,y=68,z=-409,dx=21,dy=8,dz=5] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A1","color":"yellow","bold":true}]