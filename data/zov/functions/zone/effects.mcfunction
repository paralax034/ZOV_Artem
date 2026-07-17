# ================================================
# ZOV — ЭФФЕКТЫ ЗОНЫ
# Пишет actionbar только живым (tag=!fl_waiting)
# fl_waiting сам рисует состояние зоны в respawn_loop
# ================================================

execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 1..30 run title @a[tag=!fl_waiting] actionbar [{"text":"|","color":"red","bold":true},{"text":"|||||||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 31..60 run title @a[tag=!fl_waiting] actionbar [{"text":"||","color":"red","bold":true},{"text":"||||||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 61..90 run title @a[tag=!fl_waiting] actionbar [{"text":"|||","color":"red","bold":true},{"text":"|||||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 91..120 run title @a[tag=!fl_waiting] actionbar [{"text":"||||","color":"red","bold":true},{"text":"||||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 121..150 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||","color":"red","bold":true},{"text":"|||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 151..180 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||","color":"red","bold":true},{"text":"||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 181..210 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||","color":"red","bold":true},{"text":"|||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 211..240 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||","color":"red","bold":true},{"text":"||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 241..270 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||||","color":"red","bold":true},{"text":"|","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 271..300 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||||","color":"red","bold":true}]
execute if score #zone_state fl_math matches 2 run title @a[tag=!fl_waiting] actionbar [{"text":"ОСПАРИВАЕТСЯ","color":"yellow","bold":true}]

execute if score #zone_state fl_math matches 1 run scoreboard players add #sound_timer fl_math 1
execute unless score #zone_state fl_math matches 1 run scoreboard players set #sound_timer fl_math 0
execute if score #sound_timer fl_math matches 5.. run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.2 1.8
execute if score #sound_timer fl_math matches 5.. run scoreboard players set #sound_timer fl_math 0