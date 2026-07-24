# Начальный спавн синих — защита точки A1 в зависимости от выбранного здания
execute if score #a1_variant fl_math matches 0 run spawnpoint @a[team=blue] 37 72 -406
execute if score #a1_variant fl_math matches 1 run spawnpoint @a[team=blue] -61 70 -404