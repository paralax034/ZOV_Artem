# 
# ZOV — ПОБЕДА КРАСНЫХ
# Звук достижения убран, молния оставлена
# 

scoreboard players set #global fl_state 2

playsound minecraft:entity.lightning_bolt.thunder master @a 312 100 211 3.0 0.8
particle minecraft:end_rod 312 100 211 5 10 5 0.3 200 force @a

bossbar set zov:progress name [{"text":"КРАСНЫЕ ПОБЕДИЛИ!","color":"red","bold":true}]
bossbar set zov:progress color red
bossbar set zov:progress value 0

title @a times 20 100 20
title @a title [{"text":"ПОБЕДА!","color":"red","bold":true}]
title @a subtitle [{"text":"Красные захватили завод.","color":"white"}]

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Все 7 точек захвачены! Красные победили!","color":"red","bold":true}]

schedule function zov:reset 200t