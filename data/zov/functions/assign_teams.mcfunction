# ================================================
# ZOV — СЛУЧАЙНОЕ РАСПРЕДЕЛЕНИЕ ПО КОМАНДАМ
# /function zov:assign_teams (до start)
# ================================================

team leave @a
tag @a add fl_unassigned
scoreboard players set #assign_turn fl_assign 0

function zov:assign_loop

tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Команды распределены!","color":"yellow"}]
tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Вы КРАСНЫЕ (атака)","color":"red","bold":true}]
tellraw @a[team=blue] [{"text":"[ZOV] ","color":"aqua","bold":true},{"text":"Вы СИНИЕ (защита)","color":"aqua","bold":true}]

# Если один игрок — всегда красные (тестирование захвата)
execute unless entity @a[team=blue] run tellraw @a [{"text":"[ZOV] ","color":"gold","bold":true},{"text":"Один игрок — назначен в КРАСНЫЕ для теста.","color":"yellow"}]