--!strict
local Interaction = require(game.ReplicatedStorage.Types.Interaction)

local _interactionTypes : {Interaction.InteractionType} = {}
local functions = {}

function functions.AddInteractionType(id : number, systemName : string, 
displayName : string, textColor : Color3?)
    table.insert(_interactionTypes, {
        Id = id,
        SystemName = systemName,
        DisplayName = displayName,
        TextColor = textColor,
    })
end

function functions.GetInteactionTypeById(interactionId : number) : Interaction.InteractionType
   return _interactionTypes[interactionId]
end

return functions