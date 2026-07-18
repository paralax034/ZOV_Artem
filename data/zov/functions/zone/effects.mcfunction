# ================================================
# ZOV — ЭФФЕКТЫ ЗОНЫ: диспетчер шкал + звук + оспаривание
# Вызывается из check_N (каждые 4 тика)
#
# П-6: шкалы разнесены по файлам — выполняется только нужная
# П-7: playsound исправлен: as @a at @s → звук слышат все игроки
# П-11: вызывается ПОСЛЕ blue_nav в tick_logic → перекрывает навигацию
# ================================================

# --- Шкала захвата: только при zone_state=1 ---
execute if score #zone_state fl_math matches 1 if score #global fl_active matches 1 run function zov:zone/effects_a1
execute if score #zone_state fl_math matches 1 if score #global fl_active matches 2..7 run function zov:zone/effects_a2_7

# --- Оспаривается (для всех зон) ---
execute if score #zone_state fl_math matches 2 run title @a[tag=!fl_waiting] actionbar [{"text":"ОСПАРИВАЕТСЯ","color":"yellow","bold":true}]

# --- Звук захвата: каждые 5 вызовов (20 тиков) пока идёт захват ---
# П-7: at @s → звук воспроизводится у позиции каждого игрока
execute if score #zone_state fl_math matches 1 run scoreboard players add #sound_timer fl_math 1
execute unless score #zone_state fl_math matches 1 run scoreboard players set #sound_timer fl_math 0
execute if score #sound_timer fl_math matches 5.. as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 0.2 1.8
execute if score #sound_timer fl_math matches 5.. run scoreboard players set #sound_timer fl_math 0