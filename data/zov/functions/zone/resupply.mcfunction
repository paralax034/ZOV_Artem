# ================================================
# ZOV — ПОПОЛНЕНИЕ ПРИ ЗАХВАТЕ ТОЧКИ
# Вызывается автоматически при захвате любой зоны
# ================================================

# --- 1. Выдача общих припасов всей пехоте ---
superbwarfare ammo add @a rifle 400
give @a superbwarfare:armor_plate 5
give @a minecraft:bread 20

# --- 2. Логика выбора получателя боекомплекта БМП ---
# Очищаем старые теги перед проверкой
tag @a remove fl_recipient

# ШАГ А: Если БМП жива и её чанк загружен, выбираем ближайшего Красного игрока к ней (без лимита дистанции)
execute at @e[type=superbwarfare:bmp_2,limit=1] run tag @p[team=red] add fl_recipient

# ШАГ Б (Резервный): Если БМП выгружена, уничтожена или вы тестируете команду вручную — выбираем самого вызывающего игрока (@s)
execute unless entity @a[tag=fl_recipient] run tag @s add fl_recipient

# --- 3. Выдача тяжелого БК помеченному игроку ---
give @a[tag=fl_recipient] superbwarfare:small_shell_ap 64
give @a[tag=fl_recipient] superbwarfare:small_shell_gs 64
give @a[tag=fl_recipient] superbwarfare:small_shell_he 64
give @a[tag=fl_recipient] superbwarfare:large_battery_pack{Energy:20000000} 1
give @a[tag=fl_recipient] superbwarfare:rifle_ammo 128

# --- 4. Оповещения в чат ---
# Глобальное пехотное оповещение
tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Пополнение боеприпасов выдано всей пехоте!","color":"green"}]

# Личное сообщение для того, кто получил снаряды БМП
tellraw @a[tag=fl_recipient] [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Вы получили боекомплект для БМП-2!","color":"green"}]

# Глобальное оповещение с именем получателя БК
execute if entity @a[tag=fl_recipient] run tellraw @a[tag=!fl_recipient] [{"text":"[ZOV] ","color":"gold","bold":true},{"selector":"@a[tag=fl_recipient,limit=1]","color":"yellow","bold":true},{"text":" получил танковый БК для БМП-2!","color":"green"}]

# --- 5. Очистка временного тега получателя ---
tag @a remove fl_recipient