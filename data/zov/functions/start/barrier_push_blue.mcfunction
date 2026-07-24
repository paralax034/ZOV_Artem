# 
# ZOV — БАРЬЕР СИНИХ: Z <= -525
# runs as @s = синий игрок нарушивший рубеж обороны
# 

execute if score #a1_variant fl_math matches 0 run tp @s 37 72 -406 0 0
execute if score #a1_variant fl_math matches 1 run tp @s -57 71 -414 0 0

# Слепота — визуальное наказание за нарушение рубежа
effect give @s minecraft:blindness 10 255 true

# Только чат — actionbar занят таймером подготовки
tellraw @s [{"text":"[ZOV] ","color":"aqua","bold":true},{"text":"⛔ Не покидайте зону обороны во время подготовки!","color":"red"}]