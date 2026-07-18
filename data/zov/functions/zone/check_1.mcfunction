# ================================================
# ЗОНА A1 (27 68 -409 -> 48 76 -404)
# Порог захвата: 200 (40 сек) или 1 (мгновенно при #instant_capture=1)
# П-2: if entity без run execute
# ================================================

execute store result score #red_here fl_math if entity @a[team=red,tag=!fl_waiting,x=27,y=68,z=-409,dx=21,dy=8,dz=5]
execute store result score #blue_here fl_math if entity @a[team=blue,tag=!fl_waiting,x=27,y=68,z=-409,dx=21,dy=8,dz=5]

scoreboard players set #zone_state fl_math 0
execute if score #red_here fl_math matches 1.. if score #blue_here fl_math matches 1.. run scoreboard players set #zone_state fl_math 2
execute if score #red_here fl_math matches 1.. unless score #blue_here fl_math matches 1.. run scoreboard players set #zone_state fl_math 1

execute if score #zone_state fl_math matches 1 run scoreboard players add #global fl_progress 1
execute if score #zone_state fl_math matches 0 if score #global fl_progress matches 1.. run scoreboard players remove #global fl_progress 1
execute if score #global fl_progress matches ..0 run scoreboard players set #global fl_progress 0

function zov:zone/effects

# Стандартный порог
execute unless score #instant_capture fl_math matches 1 if score #global fl_progress matches 200.. run function zov:zone/capture
# Мгновенный захват (тест)
execute if score #instant_capture fl_math matches 1 if score #zone_state fl_math matches 1 run function zov:zone/capture