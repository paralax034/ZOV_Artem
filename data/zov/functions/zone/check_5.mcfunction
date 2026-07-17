# ЗОНА A5 (-423 63 48 -> -402 68 69)

execute store result score #red_here fl_math run execute if entity @a[team=red,x=-423,y=63,z=48,dx=21,dy=5,dz=21]
execute store result score #blue_here fl_math run execute if entity @a[team=blue,x=-423,y=63,z=48,dx=21,dy=5,dz=21]

scoreboard players set #zone_state fl_math 0
execute if score #red_here fl_math matches 1.. if score #blue_here fl_math matches 1.. run scoreboard players set #zone_state fl_math 2
execute if score #red_here fl_math matches 1.. unless score #blue_here fl_math matches 1.. run scoreboard players set #zone_state fl_math 1

execute if score #zone_state fl_math matches 1 run scoreboard players add #global fl_progress 1
execute if score #zone_state fl_math matches 0 if score #global fl_progress matches 1.. run scoreboard players remove #global fl_progress 1
execute if score #global fl_progress matches ..0 run scoreboard players set #global fl_progress 0

function zov:zone/effects

execute if score #global fl_progress matches 300.. run function zov:zone/capture