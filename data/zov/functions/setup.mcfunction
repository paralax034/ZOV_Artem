# ================================================
# ZOV — SETUP (Инициализация и запуск датапака)
# ================================================

# Очистка старых критериев
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
scoreboard objectives remove fl_assign
scoreboard objectives remove fl_tp_boat
scoreboard objectives remove fl_boat_status

# Регистрация необходимых критериев
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
scoreboard objectives add fl_tp_boat trigger
scoreboard objectives add fl_boat_status trigger

# Инициализация глобальных переменных
scoreboard players set #global fl_state 0
scoreboard players set #global fl_active 1
scoreboard players set #global fl_progress 0
scoreboard players set #global fl_captured 0
scoreboard players set #global fl_round 24000
scoreboard players set #global fl_timer 0
scoreboard players set #sound_timer fl_math 0
scoreboard players set #zone_state fl_math 0

# Единый таймер для периодических 20-тиковых задач
scoreboard players set #timer_20 fl_math 0

# Таймер лодок (1200 игровых тиков = 60 секунд)
scoreboard players set #boat_timer fl_math 0
scoreboard players set #boat_count fl_math 0

# Снимок хода распределения команд
scoreboard players set #assign_turn fl_assign 0
scoreboard players set #assign_prev fl_assign 0

# Глобальные константы
scoreboard players set #4 fl_math 4
scoreboard players set #20 fl_math 20
scoreboard players set #200 fl_math 200

# Игровые настройки: 1=включено, 0=выключено
scoreboard players set #goggles_enabled fl_math 1
scoreboard players set #skip_intro fl_math 0
scoreboard players set #skip_prep fl_math 0
scoreboard players set #instant_capture fl_math 0

# Счётчик уникальных спавнов для предотвращения телефрагов
scoreboard players set #spawn_index fl_math 0

# Фаза подготовки
scoreboard players set #prep_timer fl_math 0
scoreboard players set #prep_hud_timer fl_math 0
scoreboard players set #prep_sec fl_math 0

gamerule showDeathMessages false

# Настройка прогресс-бара
bossbar remove zov:progress
bossbar add zov:progress "ZOV"
bossbar set zov:progress color white
bossbar set zov:progress style progress
bossbar set zov:progress max 24000
bossbar set zov:progress value 24000
bossbar set zov:progress visible false
bossbar set zov:progress players @a

tellraw @a [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Готов. ","color":"gray"},{"text":"/function zov:start","color":"yellow"}]