# ================================================
# ZOV — HUD ПОДГОТОВКИ: обратный отсчёт в actionbar
# Вызывается раз в 20 тиков из prep_tick
# #prep_timer в масштабе 24000..0
# Секунды = #prep_timer / 200 (24000/200 = 120 сек = 2 мин)
# ================================================

scoreboard players operation #prep_sec fl_math = #prep_timer fl_math
scoreboard players operation #prep_sec fl_math /= #200 fl_math

# Красные: рубеж + обратный отсчёт
title @a[team=red] actionbar [{"text":"⛔ Рубеж Z=-770  ","color":"red","bold":true},{"text":"Наступление через ","color":"white"},{"score":{"name":"#prep_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":" сек.","color":"white"}]

# Синие: строй оборону + обратный отсчёт
title @a[team=blue] actionbar [{"text":"🔨 Стройте оборону!  ","color":"aqua","bold":true},{"text":"Атака через ","color":"white"},{"score":{"name":"#prep_sec","objective":"fl_math"},"color":"yellow","bold":true},{"text":" сек.","color":"white"}]
