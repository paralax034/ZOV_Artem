# ================================================
# ZOV — ТАЙМЕР РЕСПАУНА (runs as @s = fl_waiting игрок)
# Вызывается каждый тик из tick.mcfunction
#
# Только 3 операции:
#   1. Декремент таймера смерти
#   2. Триггер респауна при достижении нуля
#
# Вся визуализация (actionbar, прогресс-бар) —
# в spawn/respawn_hud, вызывается каждые 4 тика
# ================================================

# Декремент: -1 тик за вызов
scoreboard players remove @s fl_dead 1

# Триггер респауна: fl_dead достиг нуля
execute if score @s fl_dead matches ..0 run function zov:spawn/do_respawn