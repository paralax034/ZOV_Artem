# 
# ZOV — BOSSBAR: обновление значения (таймер)
# Вызывается из tick_logic каждые 20 тиков
# Название и цвет НЕ обновляются здесь —
# они меняются только при смене зоны (hud/bossbar_name)
# 

# Обновляем значение полоски = оставшееся время в тиках
execute store result bossbar zov:progress value run scoreboard players get #global fl_round