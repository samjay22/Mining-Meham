--!strict
local InteractionTypes = require(game.ReplicatedStorage.Metadata.InteractionTypes)

InteractionTypes.AddInteractionType(1, "DAMAGE", "Damaged", Color3.new(1, 0, 0))
InteractionTypes.AddInteractionType(2, "HOVER", "", Color3.new(0, 1, 0))
InteractionTypes.AddInteractionType(3, "INSPECT", "Inspect", Color3.new(0, 0, 1))
InteractionTypes.AddInteractionType(3, "COLLECT", "Collect")