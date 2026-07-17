# ================================================
# ZOV — БЛОКИРОВКА ПОЗИЦИИ СПЕКА (runs as @s)
# Вызывается каждые 20 тиков — щадит слабый интернет
# Возвращает улетевшего спека обратно на точку ожидания
# ================================================

execute if entity @s[team=red] run function zov:spawn/wait_red
execute if entity @s[team=blue] run function zov:spawn/wait_blue