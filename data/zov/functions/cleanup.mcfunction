# ================================================
# ZOV — ОЧИСТКА КАРТЫ
# Удаляет технику, снаряды, мины и предметы
# Вызывается из start и reset
# ================================================

# --- Техника ---
kill @e[type=superbwarfare:bmp_2]
kill @e[type=superbwarfare:a_10a]

# --- Снаряды и расходники ---
kill @e[type=superbwarfare:rpg_rocket_tbg]
kill @e[type=superbwarfare:smoke_decoy]
kill @e[type=superbwarfare:hand_grenade]
kill @e[type=superbwarfare:tow]

# --- Мины ---
kill @e[type=superbwarfare:tm_62]
kill @e[type=superbwarfare:blu_43]

# --- Все выброшенные предметы ---
kill @e[type=item]
kill @e[type=corpse:corpse]

clear @a

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Карта очищена от техники и предметов.","color":"gray"}]