# ЗОНА A4 (-407 64 -289 -> -401 67 -283)

execute store result score #red_here fl_math run execute if entity @a[team=red,x=-407,y=64,z=-289,dx=6,dy=3,dz=6]
execute store result score #blue_here fl_math run execute if entity @a[team=blue,x=-407,y=64,z=-289,dx=6,dy=3,dz=6]

scoreboard players set #zone_state fl_math 0
execute if score #red_here fl_math matches 1.. if score #blue_here fl_math matches 1.. run scoreboard players set #zone_state fl_math 2
execute if score #red_here fl_math matches 1.. unless score #blue_here fl_math matches 1.. run scoreboard players set #zone_state fl_math 1

execute if score #zone_state fl_math matches 1 run scoreboard players add #global fl_progress 1
execute if score #zone_state fl_math matches 0 if score #global fl_progress matches 1.. run scoreboard players remove #global fl_progress 1
execute if score #global fl_progress matches ..0 run scoreboard players set #global fl_progress 0

function zov:zone/effects

execute if score #global fl_progress matches 300.. run function zov:zone/capture