# ================================================
# ZOV — ТЕЛО START (вызывается только если canstart=1)
# ================================================

function zov:cleanup

gamerule keepInventory true
gamerule doImmediateRespawn true
gamerule naturalRegeneration true
gamerule showDeathMessages false

scoreboard players set #global fl_state 2
scoreboard players set #global fl_active 1
scoreboard players set #global fl_progress 0
scoreboard players set #global fl_captured 0
scoreboard players set #global fl_round 24000
scoreboard players set #sound_timer fl_math 0
scoreboard players set #zone_state fl_math 0
scoreboard players set #prep_timer fl_math 0
scoreboard players set #prep_hud_timer fl_math 0
scoreboard players set #boat_timer fl_math 0

team modify red nametagVisibility hideForOtherTeams
team modify blue nametagVisibility hideForOtherTeams
team modify red deathMessageVisibility hideForOtherTeams
team modify blue deathMessageVisibility hideForOtherTeams

scoreboard players operation @a fl_prev_deaths = @a fl_deaths
scoreboard players set @a fl_dead 0
tag @a remove fl_waiting
tag @a remove fl_navigator

execute store result score #spawn_index fl_math run time query gametime

weather clear
time set 0

# Развилка: пропуск заставки
execute if score #skip_intro fl_math matches 1 run function zov:start/phase_3
execute unless score #skip_intro fl_math matches 1 run function zov:start/phase_1