# ================================================
# ZOV — ТЕЛО ЦИКЛА РАСПРЕДЕЛЕНИЯ (вызывается из assign_loop)
# Назначает ОДНОГО игрока за вызов
# Вызывается только если есть fl_unassigned (гуард в assign_loop)
# ================================================

# Шаг 1: Фиксируем текущий ход до любых изменений
# #assign_prev = снимок #assign_turn на этой итерации
scoreboard players operation #assign_prev fl_assign = #assign_turn fl_assign

# Шаг 2: Берём одного случайного нераспределённого игрока
tag @a[tag=fl_unassigned,limit=1,sort=random] add fl_to_assign

# Шаг 3: Назначаем команду по СНИМКУ (не по текущему значению)
# Это исключает баг, когда смена хода влияет на тот же вызов
execute if score #assign_prev fl_assign matches 0 as @a[tag=fl_to_assign] run team join red @s
execute if score #assign_prev fl_assign matches 1 as @a[tag=fl_to_assign] run team join blue @s

# Снимаем оба тега — игрок распределён
execute as @a[tag=fl_to_assign] run tag @s remove fl_unassigned
tag @a remove fl_to_assign

# Шаг 4: Переключаем ход ТОЛЬКО ПОСЛЕ завершения назначения
# Следующий вызов получит противоположный ход
execute if score #assign_prev fl_assign matches 0 run scoreboard players set #assign_turn fl_assign 1
execute if score #assign_prev fl_assign matches 1 run scoreboard players set #assign_turn fl_assign 0

# Шаг 5: Рекурсия — assign_loop проверит наличие следующего игрока
function zov:assign_loop