# 
# ZOV — СКРИПТОВОЕ СОБЫТИЕ: АРТПОДДЕРЖКА ПО ТЕКУЩЕЙ ТОЧКЕ (ВКОСЬ)
# 

scoreboard players set #strike_fired fl_math 1

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Штурм затянулся! Тяжёлая гаубичная батарея открыла огонь!","color":"red","bold":true}]

# Точка A1: Берег (прилёт с моря / с запада, 250°-290°, дистанция 350)
execute if score #global fl_active matches 1 run sbwt strike raw 46.18 67.00 -453.37 120 180 40 GAUSSIAN 3 250 290 350

# Точка A2: (прилёт с тыла Красных / с юга, 160°-200°, дистанция 300)
execute if score #global fl_active matches 2 run sbwt strike raw -5 71 -280 60 40 100 GAUSSIAN 2 160 200 300

# Точка A3: (прилёт с юго-запада, 200°-230°, дистанция 320)
execute if score #global fl_active matches 3 run sbwt strike raw -186 54 -164 60 40 100 GAUSSIAN 2 200 230 320

# Точка A4: Укреплённый рубеж (массированный залп с юга, 170°-190°, дистанция 400)
execute if score #global fl_active matches 4 run sbwt strike raw -404 55 -286 80 50 80 GAUSSIAN 4 170 190 400

# Точка A5: Мост (прилёт вдоль линии моста с запада, 260°-280°, дистанция 350)
execute if score #global fl_active matches 5 run sbwt strike raw -412 55 58 80 50 80 SECTOR 3 260 280 350

# Точка A6: (прилёт с юго-востока, 120°-150°, дистанция 300)
execute if score #global fl_active matches 6 run sbwt strike raw -171 54 122 60 40 100 GAUSSIAN 2 120 150 300

# Точка A7: Финальный штурм Завода (огромный залп со всех направлений тыла, 140°-220°, дистанция 450)
execute if score #global fl_active matches 7 run sbwt strike raw 312 90 211 100 60 60 GAUSSIAN 4 140 220 450