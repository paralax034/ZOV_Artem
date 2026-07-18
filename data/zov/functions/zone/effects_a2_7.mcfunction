# ================================================
# ZOV — ШКАЛА ЗАХВАТА A2..A7 (макс 300, 10 сегментов по 30)
# Вызывается только из effects при fl_active=2..7 и zone_state=1
# ================================================

execute if score #global fl_progress matches 1..30 run title @a[tag=!fl_waiting] actionbar [{"text":"|","color":"red","bold":true},{"text":"|||||||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 31..60 run title @a[tag=!fl_waiting] actionbar [{"text":"||","color":"red","bold":true},{"text":"||||||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 61..90 run title @a[tag=!fl_waiting] actionbar [{"text":"|||","color":"red","bold":true},{"text":"|||||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 91..120 run title @a[tag=!fl_waiting] actionbar [{"text":"||||","color":"red","bold":true},{"text":"||||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 121..150 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||","color":"red","bold":true},{"text":"|||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 151..180 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||","color":"red","bold":true},{"text":"||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 181..210 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||","color":"red","bold":true},{"text":"|||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 211..240 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||","color":"red","bold":true},{"text":"||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 241..270 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||||","color":"red","bold":true},{"text":"|","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 271..300 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||||","color":"red","bold":true}]