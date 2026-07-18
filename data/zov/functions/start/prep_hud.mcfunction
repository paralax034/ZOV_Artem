# Вычисление и отображение времени в секундах
scoreboard players operation #temp fl_math = #prep_timer fl_math
scoreboard players operation #temp fl_math /= #200 fl_math

title @a[team=red] actionbar [{"text":"⛔ Рубеж Z=-770  ","color":"red","bold":true},{"text":"Наступление через ","color":"white"},{"score":{"name":"#temp","objective":"fl_math"},"color":"yellow","bold":true},{"text":" сек.","color":"white"}]
title @a[team=blue] actionbar [{"text":"🔨 Стройте оборону!  ","color":"aqua","bold":true},{"text":"Атака через ","color":"white"},{"score":{"name":"#temp","objective":"fl_math"},"color":"yellow","bold":true},{"text":" сек.","color":"white"}]