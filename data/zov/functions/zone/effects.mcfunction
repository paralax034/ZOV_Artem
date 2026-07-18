# ================================================
# ZOV — ЭФФЕКТЫ ЗОНЫ: полоска захвата + звук
# Вызывается из check_N (каждые 4 тика)
# Пишет actionbar только живым (tag=!fl_waiting)
#
# A1 → макс 200 (40 сек), шаг 20 на сегмент
# A2..A7 → макс 300 (60 сек), шаг 30 на сегмент
#
# Приоритет actionbar: этот файл вызывается из check_N
# ПОСЛЕ blue_nav и wrong_zone → перекрывает оба
# ================================================

# --- Шкала A1 (макс 200, 10 сегментов по 20) ---
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 1 if score #global fl_progress matches 1..20 run title @a[tag=!fl_waiting] actionbar [{"text":"|","color":"red","bold":true},{"text":"|||||||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 1 if score #global fl_progress matches 21..40 run title @a[tag=!fl_waiting] actionbar [{"text":"||","color":"red","bold":true},{"text":"||||||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 1 if score #global fl_progress matches 41..60 run title @a[tag=!fl_waiting] actionbar [{"text":"|||","color":"red","bold":true},{"text":"|||||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 1 if score #global fl_progress matches 61..80 run title @a[tag=!fl_waiting] actionbar [{"text":"||||","color":"red","bold":true},{"text":"||||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 1 if score #global fl_progress matches 81..100 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||","color":"red","bold":true},{"text":"|||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 1 if score #global fl_progress matches 101..120 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||","color":"red","bold":true},{"text":"||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 1 if score #global fl_progress matches 121..140 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||","color":"red","bold":true},{"text":"|||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 1 if score #global fl_progress matches 141..160 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||","color":"red","bold":true},{"text":"||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 1 if score #global fl_progress matches 161..180 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||||","color":"red","bold":true},{"text":"|","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 1 if score #zone_state fl_math matches 1 if score #global fl_progress matches 181..200 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||||","color":"red","bold":true}]

# --- Шкала A2..A7 (макс 300, 10 сегментов по 30) ---
execute if score #global fl_active matches 2..7 if score #zone_state fl_math matches 1 if score #global fl_progress matches 1..30 run title @a[tag=!fl_waiting] actionbar [{"text":"|","color":"red","bold":true},{"text":"|||||||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 2..7 if score #zone_state fl_math matches 1 if score #global fl_progress matches 31..60 run title @a[tag=!fl_waiting] actionbar [{"text":"||","color":"red","bold":true},{"text":"||||||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 2..7 if score #zone_state fl_math matches 1 if score #global fl_progress matches 61..90 run title @a[tag=!fl_waiting] actionbar [{"text":"|||","color":"red","bold":true},{"text":"|||||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 2..7 if score #zone_state fl_math matches 1 if score #global fl_progress matches 91..120 run title @a[tag=!fl_waiting] actionbar [{"text":"||||","color":"red","bold":true},{"text":"||||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 2..7 if score #zone_state fl_math matches 1 if score #global fl_progress matches 121..150 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||","color":"red","bold":true},{"text":"|||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 2..7 if score #zone_state fl_math matches 1 if score #global fl_progress matches 151..180 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||","color":"red","bold":true},{"text":"||||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 2..7 if score #zone_state fl_math matches 1 if score #global fl_progress matches 181..210 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||","color":"red","bold":true},{"text":"|||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 2..7 if score #zone_state fl_math matches 1 if score #global fl_progress matches 211..240 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||","color":"red","bold":true},{"text":"||","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 2..7 if score #zone_state fl_math matches 1 if score #global fl_progress matches 241..270 run title @a[tag=!fl_waiting] actionbar [{"text":"|||||||||","color":"red","bold":true},{"text":"|","color":"dark_gray","bold":true}]
execute if score #global fl_active matches 2..7 if score #zone_state fl_math matches 1 if score #global fl_progress matches 271..300 run title @a[tag=!fl_waiting] actionbar [{"text":"||||||||||","color":"red","bold":true}]

# --- Оспаривается (для всех зон) ---
execute if score #zone_state fl_math matches 2 run title @a[tag=!fl_waiting] actionbar [{"text":"ОСПАРИВАЕТСЯ","color":"yellow","bold":true}]

# --- Звук захвата: каждые 5 вызовов (20 тиков) пока идёт захват ---
execute if score #zone_state fl_math matches 1 run scoreboard players add #sound_timer fl_math 1
execute unless score #zone_state fl_math matches 1 run scoreboard players set #sound_timer fl_math 0
execute if score #sound_timer fl_math matches 5.. run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.2 1.8
execute if score #sound_timer fl_math matches 5.. run scoreboard players set #sound_timer fl_math 0