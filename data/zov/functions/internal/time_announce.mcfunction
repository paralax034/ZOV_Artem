# 
# ZOV — ОПОВЕЩЕНИЯ О ВРЕМЕНИ + ОБРАТНЫЙ ОТСЧЁТ
# Вызывается из tick_logic каждые 4 тика
#
# fl_round кратен 4 — все проверки попадают точно
# При бонусе +5 мин таймер может повторно пройти отметку —
# это нормально, игрокам полезно знать обновлённое время
# 

#  МИНУТНЫЕ ОТМЕТКИ В ЧАТ 

# 20 минут = 24000 тиков (старт или после бонуса до капа)
execute if score #global fl_round matches 24000 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"До конца раунда: ","color":"white"},{"text":"20 минут","color":"green","bold":true}]

# 15 минут = 18000 тиков
execute if score #global fl_round matches 18000 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Осталось ","color":"white"},{"text":"15 минут","color":"yellow","bold":true}]

# 12 минут = 14400 (до половины — последнее спокойное)
execute if score #global fl_round matches 14400 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Осталось ","color":"white"},{"text":"12 минут","color":"yellow","bold":true}]

# 10 минут = 12000 тиков — ПОЛОВИНА ВРЕМЕНИ
execute if score #global fl_round matches 12000 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"═══ ПОЛОВИНА ВРЕМЕНИ ═══","color":"gold","bold":true}]
execute if score #global fl_round matches 12000 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Осталось ","color":"white"},{"text":"10 минут!","color":"yellow","bold":true}]
execute if score #global fl_round matches 12000 as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.5 1.2

# 5 минут = 6000 тиков
execute if score #global fl_round matches 6000 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Осталось ","color":"white"},{"text":"5 минут!","color":"red","bold":true}]

# 2 минуты = 2400 тиков
execute if score #global fl_round matches 2400 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Осталось ","color":"white"},{"text":"2 минуты!","color":"red","bold":true}]

# 1 минута = 1200 тиков
execute if score #global fl_round matches 1200 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Осталось ","color":"white"},{"text":"1 минута!","color":"dark_red","bold":true}]

# 30 секунд = 600 тиков
execute if score #global fl_round matches 600 run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"⚠ Осталось ","color":"red"},{"text":"30 секунд!","color":"dark_red","bold":true}]

#  10-СЕКУНДНЫЙ ОБРАТНЫЙ ОТСЧЁТ 

# Настройка title: мгновенно, 25 тиков показ, 5 затухание
execute if score #global fl_round matches 200 run title @a times 0 25 5
execute if score #global fl_round matches 200 run title @a subtitle [{"text":"ВРЕМЯ ИСТЕКАЕТ!","color":"red"}]

# 10..6 секунд — жёлтый
execute if score #global fl_round matches 200 run title @a title [{"text":"10","color":"yellow","bold":true}]
execute if score #global fl_round matches 180 run title @a title [{"text":"9","color":"yellow","bold":true}]
execute if score #global fl_round matches 160 run title @a title [{"text":"8","color":"yellow","bold":true}]
execute if score #global fl_round matches 140 run title @a title [{"text":"7","color":"yellow","bold":true}]
execute if score #global fl_round matches 120 run title @a title [{"text":"6","color":"yellow","bold":true}]

# 5..2 секунды — красный
execute if score #global fl_round matches 100 run title @a title [{"text":"5","color":"red","bold":true}]
execute if score #global fl_round matches 80 run title @a title [{"text":"4","color":"red","bold":true}]
execute if score #global fl_round matches 60 run title @a title [{"text":"3","color":"red","bold":true}]
execute if score #global fl_round matches 40 run title @a title [{"text":"2","color":"red","bold":true}]

# 1 секунда — тёмно-красный
execute if score #global fl_round matches 20 run title @a title [{"text":"1","color":"dark_red","bold":true}]

# Звук каждую секунду в последние 10 секунд
scoreboard players operation #cd_mod fl_math = #global fl_round
scoreboard players operation #cd_mod fl_math %= #20 fl_math
execute if score #global fl_round matches 1..200 if score #cd_mod fl_math matches 0 as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 1.0
# Бас на последних 5 секундах
execute if score #global fl_round matches 1..100 if score #cd_mod fl_math matches 0 as @a at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.3 0.5