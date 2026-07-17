# ================================================
# ЗОНА A1 (27 68 -409 -> 48 76 -404)
# ================================================

execute store result score #red_here fl_math run execute if entity @a[team=red,x=27,y=68,z=-409,dx=21,dy=8,dz=5]
execute store result score #blue_here fl_math run execute if entity @a[team=blue,x=27,y=68,z=-409,dx=21,dy=8,dz=5]

scoreboard players set #zone_state fl_math 0
execute if score #red_here fl_math matches 1.. if score #blue_here fl_math matches 1.. run scoreboard players set #zone_state fl_math 2
execute if score #red_here fl_math matches 1.. unless score #blue_here fl_math matches 1.. run scoreboard players set #zone_state fl_math 1

execute if score #zone_state fl_math matches 1 run scoreboard players add #global fl_progress 1
execute if score #zone_state fl_math matches 0 if score #global fl_progress matches 1.. run scoreboard players remove #global fl_progress 1
execute if score #global fl_progress matches ..0 run scoreboard players set #global fl_progress 0

function zov:zone/effects

execute if score #global fl_progress matches 300.. run function zov:zone/capture