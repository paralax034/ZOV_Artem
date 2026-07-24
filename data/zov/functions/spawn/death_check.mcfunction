# 
# ZOV — ДЕТЕКТ СМЕРТИ (runs as @s = каждый игрок)
#
# ВНИМАНИЕ: /reload во время игры (fl_state=1) сбрасывает
# fl_prev_deaths в 0. При следующем тике fl_deaths > fl_prev_deaths
# станет true для всех игроков с хотя бы одной смертью —
# каждый получит ложный on_death. Защита: fl_state matches 1.
# Не используйте /reload во время активного раунда.
# 

# Если количество смертей увеличилось → умер
execute if score @s fl_deaths > @s fl_prev_deaths unless entity @s[tag=fl_waiting] run function zov:spawn/on_death

# Обновляем предыдущее значение
scoreboard players operation @s fl_prev_deaths = @s fl_deaths