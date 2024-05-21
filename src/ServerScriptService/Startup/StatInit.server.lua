--!strict
local Stats = require(game.ReplicatedStorage.Metadata.Stats)


---init all the game stats
Stats.NewStat(1, "Mining_Luck", "Mining Luck", 1)
Stats.NewStat(2, "Mining_Speed", "Mining Speed", 1)
Stats.NewStat(3, "Mining_Damage", "Mining Rate", 1)
Stats.NewStat(4, "Mining_Critical_Damage", "Mining Critical Rate", 1)
Stats.NewStat(5, "Mining_Critical_Chance", "Mining Critical Luck", 1)
Stats.NewStat(6, "Gold", "Gold", 1)