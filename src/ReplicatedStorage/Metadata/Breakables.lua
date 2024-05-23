--!strict
local Breakables = require(game.ReplicatedStorage.Types.Breakable)

local _breakableTypes : {Breakables.BreakableType} = {}
local _breakableItems : {Breakables.BreakableItem} = {} 
local _breakRewards : {Breakables.BreakReward} = {}
local functions = {}

local function super(id : number, systemName : string, displayName : string, textColor : Color3?) : Breakables.BreakableType
    return {
        Id = id,
        SystemName = systemName,
        DisplayName = displayName,
        TextColor = textColor,
    }
end

function functions.AddBreakableItem(id : number, systemName : string, displayName : string,
    breakReward : number, rarityId : number, breakableTypeId : number,baseSpawnChance : number, maxHealth : number, textColor : Color3?)
    local breakable : Breakables.BreakableItem = super(id, systemName, displayName, textColor) :: any
    breakable.BreakRewardId = breakReward
    breakable.RarityId = rarityId
    breakable.BreakableTypeId = breakableTypeId
    breakable.BaseSpawnChance = baseSpawnChance
    breakable.MaxHealth = maxHealth
    
    table.insert(_breakableItems, breakable)
end

function functions.AddBreakableType(id : number, systemName : string, displayName : string, textColor : Color3?)
    table.insert(_breakableTypes, super(id, systemName, displayName, textColor))
end

function functions.AddBreakReward(id : number, min : number, max : number, image : string, objectPath : string)
    table.insert(_breakRewards, {
        Id = id,
        Max = max,
        Min = min,
        Image = image,
        ObjectPath = objectPath
    })
end

function functions.GetBreakRewardFromId(id : number) : Breakables.BreakReward
    return _breakRewards[id]
end

function functions.GetBreakableItemFromSystemName(systemName : string) : Breakables.BreakableItem?
    for _, item : Breakables.BreakableItem in ipairs(_breakableItems) do
        if item. == systemName then
            return item
        end
    end

    return nil
end

function functions.GetBreakableItemFromId(id : number) : Breakables.BreakableItem
    return _breakableItems[id]
end

function functions.GetBreakableTypeFromId(id : number) : Breakables.BreakableType
    return _breakableTypes[id]
end




return functions