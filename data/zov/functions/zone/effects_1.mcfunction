# ================================================
# ZOV — ЭФФЕКТЫ ЗОНЫ A1 (макс прогресс 200)
# Отдельный файл — своя шкала делений (10 сегментов из 200)
# ================================================

execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 1..20 run title @a[tag=!fl_waiting] actionbar [{"text":"|","color":"red","bold":true},{"text":"|||||||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 21..40 run title @a[tag=!fl_waiting] actionbar [{"text":"||","color":"red","bold":true},{"text":"||||||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 41..60 run title @a[tag=!fl_waiting] actionbar [{"text":"|||","color":"red","bold":true},{"text":"|||||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 61..80 run title @a[tag=!fl_waiting] actionbar [{"text":"||||","color":"red","bold":true},{"text":"||||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 81..100 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||","color":"red","bold":true},{"text":"|||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 101..120 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||","color":"red","bold":true},{"text":"||||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 121..140 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||","color":"red","bold":true},{"text":"|||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 141..160 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||","color":"red","bold":true},{"text":"||","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 161..180 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||||","color":"red","bold":true},{"text":"|","color":"dark_gray","bold":true}]
execute if score #zone_state fl_math matches 1 if score #global fl_progress matches 181..200 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||||","color":"red","bold":true}]
execute if score #zone_state fl_math matches 2 run title @a[tag=!fl_waiting] actionbar [{"text":"ОСПАРИВАЕТСЯ","color":"yellow","bold":true}]

execute if score #zone_state fl_math matches 1 run scoreboard players add #sound_timer fl_math 1
execute unless score #zone_state fl_math matches 1 run scoreboard players set #sound_timer fl_math 0
execute if score #sound_timer fl_math matches 5.. run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.2 1.8
execute if score #sound_timer fl_math matches 5.. run scoreboard players set #sound_timer fl_math 0