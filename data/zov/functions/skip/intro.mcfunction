# ================================================
# ZOV — ПРОПУСК ЗАСТАВКИ (вызов в рантайме)
# /function zov:skip/intro
#
# Работает только пока идёт заставка:
#   fl_state=2 — фаза подготовки активна
#   prep_timer ≤ 0 — phase_3 ещё не запустилась
#                    (она устанавливает prep_timer=24000)
#
# Почему двойного BMP больше нет:
#   После вызова phase_3 prep_timer становится > 0.
#   Когда через 8 сек сработает расписание phase_2,
#   Гуард A в phase_2 увидит prep_timer > 0 и выйдет.
#
# ⚠️ Не вызывать если prep уже идёт — используй skip/prep.
# ================================================

# Гуард: только во время активной фазы подготовки
execute unless score #global fl_state matches 2 run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Заставка не идёт.","color":"red"}]
execute unless score #global fl_state matches 2 run return 0

# Гуард: только пока заставка не закончилась
# prep_timer > 0 означает что phase_3 уже запустилась
execute unless score #prep_timer fl_math matches ..0 run tellraw @s [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Заставка уже закончилась — идёт подготовка. Используй /function zov:skip/prep","color":"red"}]
execute unless score #prep_timer fl_math matches ..0 run return 0

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Заставка пропущена.","color":"gray"}]

# Ставим флаг и вызываем phase_3 напрямую.
# phase_2 ещё висит в расписании — Гуард A в phase_2
# заблокирует её по prep_timer > 0 после выхода phase_3.
scoreboard players set #skip_intro fl_math 1
function zov:start/phase_3