# ================================================
# ZOV — ЦИКЛ РАСПРЕДЕЛЕНИЯ
# Использует fl_assign (отдельный скорборд)
# ================================================

# Если нераспределённых нет — стоп
execute unless entity @a[tag=fl_unassigned] run return 0

# Чётный ход (0) → red
execute if score #assign_turn fl_assign matches 0 run tag @a[tag=fl_unassigned,limit=1,sort=random] add fl_to_red
execute as @a[tag=fl_to_red] run team join red @s
# Сразу снимаем fl_unassigned — чтобы следующий блок не взял того же игрока
execute as @a[tag=fl_to_red] run tag @s remove fl_unassigned
tag @a remove fl_to_red
execute if score #assign_turn fl_assign matches 0 run scoreboard players set #assign_turn fl_assign 1

# Нечётный ход (1) → blue
execute if score #assign_turn fl_assign matches 1 run tag @a[tag=fl_unassigned,limit=1,sort=random] add fl_to_blue
execute as @a[tag=fl_to_blue] run team join blue @s
# Сразу снимаем fl_unassigned
execute as @a[tag=fl_to_blue] run tag @s remove fl_unassigned
tag @a remove fl_to_blue
execute if score #assign_turn fl_assign matches 1 run scoreboard players set #assign_turn fl_assign 0

# Рекурсия — следующий игрок
execute if entity @a[tag=fl_unassigned] run function zov:assign_loop