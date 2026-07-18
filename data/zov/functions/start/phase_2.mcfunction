# ================================================
# ZOV — СТАРТ ФАЗА 2: вид с позиции синих (8 сек)
#
# ГУАРДЫ (два независимых, порядок важен):
#
# Гуард A — «skip/intro уже вызвали вручную»:
#   Если prep_timer > 0, phase_3 уже запущена через skip/intro.
#   Расписание phase_2 всё равно сработает через 8 сек —
#   без этого гуарда она снова вызовет phase_3 → двойной BMP.
#
# Гуард Б — «settings/skip_intro_on был активен до start»:
#   skip_intro=1 означает "пропустить заставку автоматически".
#   В этом случае phase_2 сама вызывает phase_3 и выходит.
#   Без вызова phase_3 здесь — игра зависала в fl_state=2.
# ================================================

# Гуард A: phase_3 уже запущена (skip/intro был вызван вручную)
# prep_timer устанавливается в phase_3 → если он > 0, уже работаем
execute unless score #prep_timer fl_math matches ..0 run return 0

# Гуард Б: авто-пропуск через settings/skip_intro_on
# Вызываем phase_3 сами и выходим — иначе она никогда не запустится
execute if score #skip_intro fl_math matches 1 run function zov:start/phase_3
execute if score #skip_intro fl_math matches 1 run return 0

# ── ЗАСТАВКА ───────────────────────────────────
execute in minecraft:overworld run tp @a 82.35 98.76 -425.23 -596.76 33.50

title @a times 10 80 10
title @a title [{"text":"БРИФИНГ","color":"gold","bold":true}]
title @a subtitle [{"text":"Синие защищают порт","color":"aqua"}]
tellraw @a[team=blue] [{"text":"[ZOV] ","color":"aqua","bold":true},{"text":"Это ваш порт. Удержите его любой ценой!","color":"white"}]
tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Запомните ориентиры — скоро атака.","color":"white"}]

schedule function zov:start/phase_3 8s