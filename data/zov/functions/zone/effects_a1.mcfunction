# 
# ZOV — ШКАЛА ЗАХВАТА A1 (макс 200, 10 сегментов по 20)
# Вызывается только из effects при fl_active=1 и zone_state=1
# 

execute if score #global fl_progress matches 1..20 run title @a[tag=!fl_waiting] actionbar [{"text":"|","color":"red","bold":true},{"text":"|||||||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 21..40 run title @a[tag=!fl_waiting] actionbar [{"text":"||","color":"red","bold":true},{"text":"||||||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 41..60 run title @a[tag=!fl_waiting] actionbar [{"text":"|||","color":"red","bold":true},{"text":"|||||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 61..80 run title @a[tag=!fl_waiting] actionbar [{"text":"||||","color":"red","bold":true},{"text":"||||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 81..100 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||","color":"red","bold":true},{"text":"|||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 101..120 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||","color":"red","bold":true},{"text":"||||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 121..140 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||","color":"red","bold":true},{"text":"|||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 141..160 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||","color":"red","bold":true},{"text":"||","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 161..180 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||||","color":"red","bold":true},{"text":"|","color":"dark_gray","bold":true}]
execute if score #global fl_progress matches 181..200 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||||","color":"red","bold":true}]