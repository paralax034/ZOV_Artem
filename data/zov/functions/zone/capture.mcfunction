# ================================================
# ZOV — ЗАХВАТ ТОЧКИ
# ================================================

scoreboard players set #global fl_progress 300
scoreboard players add #global fl_captured 1

# --- ЗВУК ЗАХВАТА ---
execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1.5 1.0

# --- ГРОМ (тише) + ЧАСТИЦЫ по зонам ---
execute if score #global fl_active matches 1 run playsound minecraft:entity.lightning_bolt.thunder master @a 37 72 -406 0.5 0.8
execute if score #global fl_active matches 1 run particle minecraft:explosion_emitter 37 72 -406 0 0 0 0 1 force @a
execute if score #global fl_active matches 1 run particle minecraft:large_smoke 37 72 -406 5 5 5 0.02 80 force @a

execute if score #global fl_active matches 2 run playsound minecraft:entity.lightning_bolt.thunder master @a -5 81 -280 0.5 0.8
execute if score #global fl_active matches 2 run particle minecraft:explosion_emitter -5 81 -280 0 0 0 0 1 force @a
execute if score #global fl_active matches 2 run particle minecraft:large_smoke -5 81 -280 5 5 5 0.02 80 force @a

execute if score #global fl_active matches 3 run playsound minecraft:entity.lightning_bolt.thunder master @a -186 64 -164 0.5 0.8
execute if score #global fl_active matches 3 run particle minecraft:explosion_emitter -186 64 -164 0 0 0 0 1 force @a
execute if score #global fl_active matches 3 run particle minecraft:large_smoke -186 64 -164 5 5 5 0.02 80 force @a

execute if score #global fl_active matches 4 run playsound minecraft:entity.lightning_bolt.thunder master @a -404 65 -286 0.5 0.8
execute if score #global fl_active matches 4 run particle minecraft:explosion_emitter -404 65 -286 0 0 0 0 1 force @a
execute if score #global fl_active matches 4 run particle minecraft:large_smoke -404 65 -286 5 5 5 0.02 80 force @a

execute if score #global fl_active matches 5 run playsound minecraft:entity.lightning_bolt.thunder master @a -412 65 58 0.5 0.8
execute if score #global fl_active matches 5 run particle minecraft:explosion_emitter -412 65 58 0 0 0 0 1 force @a
execute if score #global fl_active matches 5 run particle minecraft:large_smoke -412 65 58 5 5 5 0.02 80 force @a

execute if score #global fl_active matches 6 run playsound minecraft:entity.lightning_bolt.thunder master @a -171 64 122 0.5 0.8
execute if score #global fl_active matches 6 run particle minecraft:explosion_emitter -171 64 122 0 0 0 0 1 force @a
execute if score #global fl_active matches 6 run particle minecraft:large_smoke -171 64 122 5 5 5 0.02 80 force @a

execute if score #global fl_active matches 7 run function zov:win/red

# --- ПОПОЛНЕНИЕ ПРИ ЗАХВАТЕ ---
function zov:zone/resupply

# --- СПАВНЫ ---
function zov:spawn/update_after_capture

# --- СООБЩЕНИЯ В ЧАТ ---
execute if score #global fl_active matches 1 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"A1 захвачена!","color":"red","bold":true},{"text":" Следующая: ","color":"white"},{"text":"A2","color":"yellow","bold":true}]
execute if score #global fl_active matches 2 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"A2 захвачена!","color":"red","bold":true},{"text":" Следующая: ","color":"white"},{"text":"A3","color":"yellow","bold":true}]
execute if score #global fl_active matches 3 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"A3 захвачена!","color":"red","bold":true},{"text":" Следующая: ","color":"white"},{"text":"A4","color":"yellow","bold":true}]
execute if score #global fl_active matches 4 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"A4 захвачена!","color":"red","bold":true},{"text":" Следующая: ","color":"white"},{"text":"A5","color":"yellow","bold":true}]
execute if score #global fl_active matches 5 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"A5 захвачена!","color":"red","bold":true},{"text":" Следующая: ","color":"white"},{"text":"A6","color":"yellow","bold":true}]
execute if score #global fl_active matches 6 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"A6 захвачена!","color":"red","bold":true},{"text":" Последняя: ","color":"white"},{"text":"ЗАВОД A7!","color":"red","bold":true}]

# --- TITLE ---
title @a times 10 50 10
execute if score #global fl_active matches 1 run title @a title [{"text":"A1 ЗАХВАЧЕНА","color":"red","bold":true}]
execute if score #global fl_active matches 2 run title @a title [{"text":"A2 ЗАХВАЧЕНА","color":"red","bold":true}]
execute if score #global fl_active matches 3 run title @a title [{"text":"A3 ЗАХВАЧЕНА","color":"red","bold":true}]
execute if score #global fl_active matches 4 run title @a title [{"text":"A4 ЗАХВАЧЕНА","color":"red","bold":true}]
execute if score #global fl_active matches 5 run title @a title [{"text":"A5 ЗАХВАЧЕНА","color":"red","bold":true}]
execute if score #global fl_active matches 6 run title @a title [{"text":"A6 ЗАХВАЧЕНА","color":"red","bold":true}]

# --- СЛЕДУЮЩАЯ ТОЧКА ---
execute if score #global fl_active matches 1..6 run function zov:zone/next