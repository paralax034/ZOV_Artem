# ================================================
# ЗОНА A7 (310 99 208 -> 315 101 214)
# П-2: run execute if entity → if entity (убран лишний контекст)
# ================================================

execute store result score #red_here fl_math if entity @a[team=red,tag=!fl_waiting,x=310,y=99,z=208,dx=5,dy=2,dz=6]
execute store result score #blue_here fl_math if entity @a[team=blue,tag=!fl_waiting,x=310,y=99,z=208,dx=5,dy=2,dz=6]

scoreboard players set #zone_state fl_math 0
execute if score #red_here fl_math matches 1.. if score #blue_here fl_math matches 1.. run scoreboard players set #zone_state fl_math 2
execute if score #red_here fl_math matches 1.. unless score #blue_here fl_math matches 1.. run scoreboard players set #zone_state fl_math 1

execute if score #zone_state fl_math matches 1 run scoreboard players add #global fl_progress 1
execute if score #zone_state fl_math matches 0 if score #global fl_progress matches 1.. run scoreboard players remove #global fl_progress 1
execute if score #global fl_progress matches ..0 run scoreboard players set #global fl_progress 0

function zov:zone/effects

execute if score #global fl_progress matches 300.. run function zov:zone/capture