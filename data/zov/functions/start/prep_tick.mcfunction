# ================================================
# ZOV — ТИК ПОДГОТОВКИ (вызывается каждый тик при fl_state=2)
#
# Гуард: #prep_timer=0 → phase_3 ещё не запущен (заставка)
#
# #prep_timer хранится в масштабе 24000..0:
#   - декремент 10 за тик = 2400 тиков = 2 минуты
#   - пишется напрямую в bossbar value без умножения
#   - секунды для HUD = #prep_timer / 200
#
# Барьеры:
#   - Красные: Z >= -770 (севернее рубежа атаки)
#   - Синие:   Z <= -525 (южнее рубежа обороны)
# ================================================

# Гуард: таймер не инициализирован — заставка ещё идёт
execute if score #prep_timer fl_math matches ..0 run return 0

# Декремент таймера (×10 за тик = 2400 тиков итого)
scoreboard players remove #prep_timer fl_math 10

# --- Барьер красных: Z >= -770 ---
execute as @a[team=red,tag=!fl_waiting] at @s if entity @s[z=-770,dz=30000770] run function zov:start/barrier_push_red

# --- Барьер синих: Z <= -525 ---
# z от начала мира до -526 включительно: z=-30000000, dz=29999474
execute as @a[team=blue,tag=!fl_waiting] at @s if entity @s[z=-30000000,dz=29999474] run function zov:start/barrier_push_blue

# --- Боссбар: пишем #prep_timer напрямую (уже в масштабе 24000) ---
execute store result bossbar zov:progress value run scoreboard players get #prep_timer fl_math

# --- Лодки: таймер работает и во время подготовки ---
scoreboard players add #boat_timer fl_math 1
execute if score #boat_timer fl_math matches 300.. run function zov:internal/boat_spawn
execute if score #boat_timer fl_math matches 300.. run scoreboard players set #boat_timer fl_math 0

# --- Actionbar: раз в 20 тиков ---
scoreboard players add #prep_hud_timer fl_math 1
execute if score #prep_hud_timer fl_math matches 20.. run function zov:start/prep_hud
execute if score #prep_hud_timer fl_math matches 20.. run scoreboard players set #prep_hud_timer fl_math 0

# --- Конец подготовки ---
execute if score #prep_timer fl_math matches ..0 run function zov:start/prep_end