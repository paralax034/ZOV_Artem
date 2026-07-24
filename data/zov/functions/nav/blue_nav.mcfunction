# 
# ZOV — НАВИГАЦИЯ СИНИХ: диспетчер
# Вызывается из tick_logic каждые 4 тика
# Только 1 условие срабатывает — вызывает нужный файл зоны
# 20 команд из оригинала полностью исключены из тика
# 

execute if score #global fl_active matches 1 run function zov:nav/blue_nav_1
execute if score #global fl_active matches 2 run function zov:nav/blue_nav_2
execute if score #global fl_active matches 3 run function zov:nav/blue_nav_3
execute if score #global fl_active matches 4 run function zov:nav/blue_nav_4
execute if score #global fl_active matches 5 run function zov:nav/blue_nav_5
execute if score #global fl_active matches 6 run function zov:nav/blue_nav_6
execute if score #global fl_active matches 7 run function zov:nav/blue_nav_7