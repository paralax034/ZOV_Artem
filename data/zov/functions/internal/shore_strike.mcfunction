# 
# ZOV — СКРИПТОВОЕ СОБЫТИЕ: АРТПОДДЕРЖКА БЕРЕГА (НАПРАВЛЕННАЯ)
# 

scoreboard players set #shore_strike_done fl_math 1

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Запрошена береговая артиллерия из тыла! Снаряды заходят с юга!","color":"red","bold":true}]

# 120 снарядов, разброс 150б, шаг 40т, GAUSSIAN, залп 3, азимут 160°-200° (с юга), дистанция 350б
sbwt strike raw 46.18 67.00 -453.37 120 150 40 GAUSSIAN 3 160 200 350