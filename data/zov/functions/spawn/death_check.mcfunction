# ================================================
# ZOV — ДЕТЕКТ СМЕРТИ (runs as @s = каждый игрок)
# ================================================

# Если количество смертей увеличилось → умер
execute if score @s fl_deaths > @s fl_prev_deaths unless entity @s[tag=fl_waiting] run function zov:spawn/on_death

# Обновляем предыдущее значение
scoreboard players operation @s fl_prev_deaths = @s fl_deaths