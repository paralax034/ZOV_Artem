# ================================================
# ZOV — SETUP
# ================================================

scoreboard objectives remove fl_state
scoreboard objectives remove fl_active
scoreboard objectives remove fl_progress
scoreboard objectives remove fl_captured
scoreboard objectives remove fl_round
scoreboard objectives remove fl_timer
scoreboard objectives remove fl_deaths
scoreboard objectives remove fl_prev_deaths
scoreboard objectives remove fl_dead
scoreboard objectives remove fl_math
scoreboard objectives remove fl_nav
scoreboard objectives remove fl_assign

scoreboard objectives add fl_assign dummy
scoreboard objectives add fl_state dummy
scoreboard objectives add fl_active dummy
scoreboard objectives add fl_progress dummy
scoreboard objectives add fl_captured dummy
scoreboard objectives add fl_round dummy
scoreboard objectives add fl_timer dummy
scoreboard objectives add fl_deaths deathCount
scoreboard objectives add fl_prev_deaths dummy
scoreboard objectives add fl_dead dummy
scoreboard objectives add fl_math dummy
scoreboard objectives add fl_nav dummy

scoreboard players set #global fl_state 0
scoreboard players set #global fl_active 1
scoreboard players set #global fl_progress 0
scoreboard players set #global fl_captured 0
scoreboard players set #global fl_round 24000
scoreboard players set #global fl_timer 0
scoreboard players set #sound_timer fl_math 0
scoreboard players set #zone_state fl_math 0
scoreboard players set #compass_timer fl_math 0
scoreboard players set #speclock_timer fl_math 0
scoreboard players set #hud_timer fl_math 0

# Таймер лодок: 0→300 (каждые 300 вызовов tick_logic = 60 сек)
scoreboard players set #boat_timer fl_math 0
# Вспомогательные переменные лодок
scoreboard players set #boat_count fl_math 0
scoreboard players set #boat_skip fl_math 0

# Вспомогательная переменная для тепловизора
scoreboard players set #tmp_goggles fl_math 0
# Вспомогательная переменная для обратного отсчёта
scoreboard players set #cd_mod fl_math 0

# Снимок хода распределения (используется в assign_loop_body)
scoreboard players set #assign_turn fl_assign 0
scoreboard players set #assign_prev fl_assign 0

# Константы
scoreboard players set #1200 fl_math 1200
scoreboard players set #4 fl_math 4
scoreboard players set #10 fl_math 10
scoreboard players set #20 fl_math 20
scoreboard players set #200 fl_math 200

# Настройки: 1=включено, 0=выключено
# Менять через /function zov:settings/...
scoreboard players set #goggles_enabled fl_math 1
# Пропуск заставки (применяется при следующем старте)
scoreboard players set #skip_intro fl_math 0
# Пропуск подготовки (применяется при следующем старте)
scoreboard players set #skip_prep fl_math 0
# Мгновенный захват точек (тестирование)
scoreboard players set #instant_capture fl_math 0

# Счётчик спавнов: инкрементируется в do_respawn, используется в tp_red/tp_blue
# Никогда не сбрасывается — монотонно растёт, % 4 всегда даёт 0..3
scoreboard players set #spawn_index fl_math 0

# Фаза подготовки
# #prep_timer хранится в масштабе 24000..0
# декремент 10/тик = 2400 тиков = 2 минуты
scoreboard players set #prep_timer fl_math 0
scoreboard players set #prep_hud_timer fl_math 0
scoreboard players set #prep_sec fl_math 0

# Скрываем сообщения о смерти — они мешают во время боя
gamerule showDeathMessages false

bossbar remove zov:progress
bossbar add zov:progress "ZOV"
bossbar set zov:progress color white
bossbar set zov:progress style progress
bossbar set zov:progress max 24000
bossbar set zov:progress value 24000
bossbar set zov:progress visible false
bossbar set zov:progress players @a

# Минимальное сообщение — только статус загрузки
tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Готов. ","color":"gray"},{"text":"/function zov:start","color":"yellow"}]