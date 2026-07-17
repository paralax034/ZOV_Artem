# ================================================
# ZOV — ОБРАБОТКА СМЕРТИ (runs as @s)
# Игрок остаётся в survival, неуязвим и заморожен
# ================================================

tag @s add fl_waiting
scoreboard players set @s fl_dead 300

# Неуязвимость (resistance 255, без частиц)
effect give @s minecraft:resistance 301 255 true

# Заморозка движения (slowness 255, без частиц)
effect give @s minecraft:slowness 301 255 true

# Нельзя атаковать (mining_fatigue, без частиц)
effect give @s minecraft:mining_fatigue 301 255 true