# 
# ZOV — ОБРАБОТКА СМЕРТИ (runs as @s)
#
# Спектатор: не может взаимодействовать с миром.
# TP один раз на точку ожидания.
#
# Штраф патронами за смерть убран — пополнение
# происходит при респавне (+50 rifle).
# 

tag @s add fl_waiting
scoreboard players set @s fl_dead 300
gamemode spectator @s

execute if entity @s[team=red] run function zov:spawn/wait_red
execute if entity @s[team=blue] run function zov:spawn/wait_blue