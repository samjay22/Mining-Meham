--!strict
local Breakables = require(game.ReplicatedStorage.Metadata.Breakables)

--rewards
Breakables.AddBreakReward(1, 1, 4, "", "")

--items, id, system name, display name, display color, reward, rarirty, type, spawn chance, max health, display color
Breakables.AddBreakableItem(1, "STONE", "Stone", 1, 1, 1, 60, 100, Color3.fromRGB(97, 81, 81))
Breakables.AddBreakableItem(2, "WOOD", "Wood", 1, 1, 1, 50, 200, Color3.fromRGB(247, 139, 51))
Breakables.AddBreakableItem(3, "COAL", "Coal", 1, 1, 1, 45, 400, Color3.fromRGB(102, 102, 102))
Breakables.AddBreakableItem(5, "COPPER", "Copper", 1, 1, 1, 30, 900, Color3.fromRGB(255, 228, 50))
Breakables.AddBreakableItem(6, "COAL_ORE", "Coal Ore", 1, 1, 2, 25, 1000, Color3.fromRGB(255, 228, 50))
Breakables.AddBreakableItem(7, "COPPER_ORE", "Copper Ore", 1, 1, 2, 20, 1500, Color3.fromRGB(255, 228, 50))
Breakables.AddBreakableItem(8, "CRATE", "Crate", 1, 1, 3, 20, 850, Color3.new())
Breakables.AddBreakableItem(8, "BARREL", "Barrel", 1, 1, 3, 20, 1250, Color3.new())

--types
Breakables.AddBreakableType(1, "CORE", "Core", Color3.new(1, 1, 1))
Breakables.AddBreakableType(2, "SECONDARY", "Secondary", Color3.new(0, .5, 1))
Breakables.AddBreakableType(3, "SPECIAL", "Special", Color3.new(1, 1, 0))