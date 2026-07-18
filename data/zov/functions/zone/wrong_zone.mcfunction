# ================================================
# ZOV — ПОДСКАЗКА ДЛЯ КРАСНЫХ ВНЕ АКТИВНОЙ ЗОНЫ
# Не показывать: ждущим (fl_waiting) и держащим компас (fl_holds_compass)
# at @s обязателен: dx/dz проверяются от позиции игрока
# ================================================

# --- ЗОНА A1: уже захвачена ---
execute if score #global fl_active matches 2..7 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=27,y=68,z=-409,dx=21,dy=8,dz=5] run title @s actionbar [{"text":"A1 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A2: ещё не открыта ---
execute if score #global fl_active matches 1 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=-11,y=72,z=-289,dx=11,dy=18,dz=17] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]
# --- ЗОНА A2: уже захвачена ---
execute if score #global fl_active matches 3..7 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=-11,y=72,z=-289,dx=11,dy=18,dz=17] run title @s actionbar [{"text":"A2 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A3: ещё не открыта ---
execute if score #global fl_active matches 1..2 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=-192,y=63,z=-169,dx=11,dy=3,dz=9] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]
# --- ЗОНА A3: уже захвачена ---
execute if score #global fl_active matches 4..7 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=-192,y=63,z=-169,dx=11,dy=3,dz=9] run title @s actionbar [{"text":"A3 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A4: ещё не открыта ---
execute if score #global fl_active matches 1..3 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=-407,y=64,z=-289,dx=6,dy=3,dz=6] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]
# --- ЗОНА A4: уже захвачена ---
execute if score #global fl_active matches 5..7 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=-407,y=64,z=-289,dx=6,dy=3,dz=6] run title @s actionbar [{"text":"A4 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A5: ещё не открыта ---
execute if score #global fl_active matches 1..4 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=-423,y=63,z=48,dx=21,dy=5,dz=21] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]
# --- ЗОНА A5: уже захвачена ---
execute if score #global fl_active matches 6..7 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=-423,y=63,z=48,dx=21,dy=5,dz=21] run title @s actionbar [{"text":"A5 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A6: ещё не открыта ---
execute if score #global fl_active matches 1..5 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=-174,y=63,z=119,dx=6,dy=3,dz=6] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]
# --- ЗОНА A6: уже захвачена ---
execute if score #global fl_active matches 7 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=-174,y=63,z=119,dx=6,dy=3,dz=6] run title @s actionbar [{"text":"A6 захвачена. Идите к A","color":"green"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]

# --- ЗОНА A7: ещё не открыта ---
execute if score #global fl_active matches 1..6 as @a[team=red,tag=!fl_waiting,tag=!fl_holds_compass] at @s if entity @s[x=310,y=99,z=208,dx=5,dy=2,dz=6] run title @s actionbar [{"text":"Сначала захватите A","color":"gray"},{"score":{"name":"#global","objective":"fl_active"},"color":"yellow","bold":true}]