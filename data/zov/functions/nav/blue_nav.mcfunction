# ================================================
# ZOV — НАВИГАЦИЯ СИНИХ
# На активной точке (zone_state=0): "Защищайте AN"
# На активной точке (zone_state=1): "ОТБЕЙТЕ!"
# Не на активной точке: "Идите к AN"
# Не показывать fl_waiting
# ================================================

# --- Синие на активной точке A1 ---
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=27,y=68,z=-409,dx=21,dy=8,dz=5] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A1","color":"yellow","bold":true}]
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=27,y=68,z=-409,dx=21,dy=8,dz=5] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A1","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]

# --- Синие не на точке A1 ---
execute if score #global fl_active matches 1 as @a[team=blue,tag=!fl_waiting] unless entity @s[x=27,y=68,z=-409,dx=21,dy=8,dz=5] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A1","color":"yellow","bold":true}]

# --- Синие на активной точке A2 ---
execute if score #global fl_active matches 2 if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=-11,y=72,z=-289,dx=11,dy=18,dz=17] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A2","color":"yellow","bold":true}]
execute if score #global fl_active matches 2 if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=-11,y=72,z=-289,dx=11,dy=18,dz=17] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A2","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]

# --- Синие не на точке A2 ---
execute if score #global fl_active matches 2 as @a[team=blue,tag=!fl_waiting] unless entity @s[x=-11,y=72,z=-289,dx=11,dy=18,dz=17] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A2","color":"yellow","bold":true}]

# --- Синие на активной точке A3 ---
execute if score #global fl_active matches 3 if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=-192,y=63,z=-169,dx=11,dy=3,dz=9] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A3","color":"yellow","bold":true}]
execute if score #global fl_active matches 3 if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=-192,y=63,z=-169,dx=11,dy=3,dz=9] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A3","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]

# --- Синие не на точке A3 ---
execute if score #global fl_active matches 3 as @a[team=blue,tag=!fl_waiting] unless entity @s[x=-192,y=63,z=-169,dx=11,dy=3,dz=9] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A3","color":"yellow","bold":true}]

# --- Синие на активной точке A4 ---
execute if score #global fl_active matches 4 if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=-407,y=64,z=-289,dx=6,dy=3,dz=6] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A4","color":"yellow","bold":true}]
execute if score #global fl_active matches 4 if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=-407,y=64,z=-289,dx=6,dy=3,dz=6] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A4","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]

# --- Синие не на точке A4 ---
execute if score #global fl_active matches 4 as @a[team=blue,tag=!fl_waiting] unless entity @s[x=-407,y=64,z=-289,dx=6,dy=3,dz=6] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A4","color":"yellow","bold":true}]

# --- Синие на активной точке A5 ---
execute if score #global fl_active matches 5 if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=-423,y=63,z=48,dx=21,dy=5,dz=21] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A5","color":"yellow","bold":true}]
execute if score #global fl_active matches 5 if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=-423,y=63,z=48,dx=21,dy=5,dz=21] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A5","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]

# --- Синие не на точке A5 ---
execute if score #global fl_active matches 5 as @a[team=blue,tag=!fl_waiting] unless entity @s[x=-423,y=63,z=48,dx=21,dy=5,dz=21] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A5","color":"yellow","bold":true}]

# --- Синие на активной точке A6 ---
execute if score #global fl_active matches 6 if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=-174,y=63,z=119,dx=6,dy=3,dz=6] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"A6","color":"yellow","bold":true}]
execute if score #global fl_active matches 6 if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=-174,y=63,z=119,dx=6,dy=3,dz=6] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ТОЧКУ ","color":"red","bold":true},{"text":"A6","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]

# --- Синие не на точке A6 ---
execute if score #global fl_active matches 6 as @a[team=blue,tag=!fl_waiting] unless entity @s[x=-174,y=63,z=119,dx=6,dy=3,dz=6] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"A6","color":"yellow","bold":true}]

# --- Синие на активной точке A7 ---
execute if score #global fl_active matches 7 if score #zone_state fl_math matches 0 as @a[team=blue,tag=!fl_waiting,x=310,y=99,z=208,dx=5,dy=2,dz=6] run title @s actionbar [{"text":"⚑ Защищайте ","color":"aqua"},{"text":"ЗАВОД A7","color":"red","bold":true}]
execute if score #global fl_active matches 7 if score #zone_state fl_math matches 1 as @a[team=blue,tag=!fl_waiting,x=310,y=99,z=208,dx=5,dy=2,dz=6] run title @s actionbar [{"text":"⚠ ОТБЕЙТЕ ЗАВОД ","color":"red","bold":true},{"text":"A7","color":"yellow","bold":true},{"text":"!","color":"red","bold":true}]

# --- Синие не на точке A7 ---
execute if score #global fl_active matches 7 as @a[team=blue,tag=!fl_waiting] unless entity @s[x=310,y=99,z=208,dx=5,dy=2,dz=6] run title @s actionbar [{"text":"Идите защищать ","color":"gray"},{"text":"ЗАВОД A7","color":"red","bold":true}]