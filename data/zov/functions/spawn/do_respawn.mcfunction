# ================================================
# ZOV — ТЕЛЕПОРТ НА СПАВН (runs as @s)
# ================================================

tag @s remove fl_waiting

# Убираем эффекты заморозки
effect clear @s minecraft:resistance
effect clear @s minecraft:slowness
effect clear @s minecraft:mining_fatigue

# Телепортируем по команде
execute if entity @s[team=red] run function zov:spawn/tp_red
execute if entity @s[team=blue] run function zov:spawn/tp_blue

# Звук возрождения
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 1.0

# Базовое пополнение на респауне
give @s superbwarfare:rifle_ammo_box 2
give @s superbwarfare:armor_plate 2
give @s minecraft:bread 6