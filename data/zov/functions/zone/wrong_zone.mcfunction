# 
# ZOV — ПОДСКАЗКА ДЛЯ КРАСНЫХ ВНЕ АКТИВНОЙ ЗОНЫ (Y expanded +-15)
# 

# --- ЗОНА A1 (Вариант 0: Здание 1 и Вариант 1: Здание 2) ---
execute if score #global fl_active matches 2..7 if score #a1_variant fl_math matches 0 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=27,y=53,z=-409,dx=21,dy=38,dz=5] run title @s actionbar [{"text":"A1 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]
execute if score #global fl_active matches 2..7 if score #a1_variant fl_math matches 1 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=-61,y=70,z=-424,dx=8,dy=7,dz=20] run title @s actionbar [{"text":"A1 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A2 ---
execute if score #global fl_active matches 1 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=-11,y=57,z=-289,dx=11,dy=48,dz=17] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]
execute if score #global fl_active matches 3..7 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=-11,y=57,z=-289,dx=11,dy=48,dz=17] run title @s actionbar [{"text":"A2 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A3 ---
execute if score #global fl_active matches 1..2 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=-192,y=48,z=-169,dx=11,dy=33,dz=9] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]
execute if score #global fl_active matches 4..7 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=-192,y=48,z=-169,dx=11,dy=33,dz=9] run title @s actionbar [{"text":"A3 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A4 ---
execute if score #global fl_active matches 1..3 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=-407,y=49,z=-289,dx=6,dy=33,dz=6] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]
execute if score #global fl_active matches 5..7 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=-407,y=49,z=-289,dx=6,dy=33,dz=6] run title @s actionbar [{"text":"A4 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A5 ---
execute if score #global fl_active matches 1..4 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=-423,y=48,z=48,dx=21,dy=35,dz=21] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]
execute if score #global fl_active matches 6..7 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=-423,y=48,z=48,dx=21,dy=35,dz=21] run title @s actionbar [{"text":"A5 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A6 ---
execute if score #global fl_active matches 1..5 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=-174,y=48,z=119,dx=6,dy=33,dz=6] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]
execute if score #global fl_active matches 7 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=-174,y=48,z=119,dx=6,dy=33,dz=6] run title @s actionbar [{"text":"A6 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A7 ---
execute if score #global fl_active matches 1..6 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass,x=310,y=84,z=208,dx=5,dy=32,dz=6] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]