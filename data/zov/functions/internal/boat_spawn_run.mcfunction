# ================================================
# ZOV — ТЕЛО СПАВНА ЛОДКИ
# ================================================

summon minecraft:boat 32 63 -801 {Type:"oak",Tags:["fl_boat"]}
spreadplayers 32 -801 2 10 false @e[type=minecraft:boat,tag=fl_boat,limit=1,sort=nearest]

tellraw @a[team=red] [{"text":"[ZOV] ","color":"red","bold":true},{"text":"Лодка доставлена на базу!","color":"green"}]