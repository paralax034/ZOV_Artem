# ================================================
# ZOV — ПОБЕДА СИНИХ (таймер вышел)
# ================================================

scoreboard players set #global fl_state 2

bossbar set zov:progress name [{"text":"СИНИЕ УСТОЯЛИ!","color":"blue","bold":true}]
bossbar set zov:progress color blue
bossbar set zov:progress value 0

title @a times 20 100 20
title @a title [{"text":"ОБОРОНА!","color":"blue","bold":true}]
title @a subtitle [{"text":"Синие удержали линию фронта.","color":"white"}]

playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.5 1.2
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Время вышло! Синие удержали оборону!","color":"aqua","bold":true}]

schedule function zov:reset 200t