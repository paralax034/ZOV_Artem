# Шаг 1: Фиксируем текущий ход
scoreboard players operation #assign_prev fl_assign = #assign_turn fl_assign

# Шаг 2: Один случайный нераспределённый
tag @a[tag=fl_unassigned,limit=1,sort=random] add fl_to_assign

# Шаг 3: Назначаем команду по снимку
execute if score #assign_prev fl_assign matches 0 as @a[tag=fl_to_assign] run team join red @s
execute if score #assign_prev fl_assign matches 1 as @a[tag=fl_to_assign] run team join blue @s

# Снимаем теги — игрок распределён
execute as @a[tag=fl_to_assign] run tag @s remove fl_unassigned
tag @a[tag=fl_to_assign] remove fl_to_assign

# Шаг 4: Переключаем ход
execute if score #assign_prev fl_assign matches 0 run scoreboard players set #assign_turn fl_assign 1
execute if score #assign_prev fl_assign matches 1 run scoreboard players set #assign_turn fl_assign 0

# Шаг 5: Рекурсия
function zov:assign_loop