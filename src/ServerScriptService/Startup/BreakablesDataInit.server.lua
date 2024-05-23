--!strict
local Breakables = require(game.ReplicatedStorage.Metadata.Breakables)

--rewards
Breakables.AddBreakReward(1, 1, 4, "", "")

--items, id, system name, display name, display color, reward, rarirty, type
Breakables.AddBreakableItem(1, "STONE", "Stone", Color3.fromRGB(255, 252, 252), 1, 1, 1)
Breakables.AddBreakableItem(2, "WOOD", "Wood", Color3.fromRGB(247, 139, 51), 1, 1, 1)
Breakables.AddBreakableItem(3, "COAL", "Coal", Color3.fromRGB(102, 102, 102), 1, 1, 1)
Breakables.AddBreakableItem(4, "STONE", "Stone", Color3.fromRGB(200, 200, 200), 1, 1, 1)
Breakables.AddBreakableItem(5, "COPPER", "Copper", Color3.fromRGB(255, 228, 50), 1, 1, 1)
Breakables.AddBreakableItem(6, "COAL_ORE", "Coal Ore", Color3.fromRGB(255, 228, 50), 1, 1, 2)
Breakables.AddBreakableItem(7, "COPPER_ORE", "Copper Ore", Color3.fromRGB(255, 228, 50), 1, 1, 2)
Breakables.AddBreakableItem(8, "CRATE", "Crate", Color3.new(), 1, 1, 3)
Breakables.AddBreakableItem(8, "BARREL", "Barrel", Color3.new(), 1, 1, 3)

--types
Breakables.AddBreakableType(1, "CORE", "Core", Color3.new(1, 1, 1))
Breakables.AddBreakableItem(2, "SECONDARY", "Secondary", Color3.new(0, .5, 1))
Breakables.AddBreakableType(3, "SPECIAL", "Special", Color3.new(100, 100, 0))