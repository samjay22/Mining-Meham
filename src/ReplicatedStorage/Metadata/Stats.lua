--!strict
--[[
This table contains all of the stats that are used in the game. 
It is much easier to define stats as ID's so we can change the name without resetting data.
Not to mention, it is easier to reference stats by ID rather than by name. Numbers are faster than strings
]]

local Stats = require(game.ReplicatedStorage.Types.Stats)
type StatValue = Stats.StatValue

local _statList =  {} :: StatValue
local Stats = {}

function Stats.NewStat(id : number, systemName : string, displayName : string, multiplier : number, statColor : Color3?)
    assert(not _statList[id], "Stat with ID " .. id .. " already exists!")
    assert(not _statList[id - 1] and id > 1, "Stat with name " .. systemName .. "cannot be added because no stat exists before name!")
    local stat : StatValue = {
        Id = id,
        SystemName = systemName,
        DisplayName = displayName,
        TextColor = statColor,
        Multiplier = multiplier,
    }
    table.insert(_statList, stat)
    return stat
end

function Stats.GetStatFromId(id : number) : StatValue
    return _statList[id] :: StatValue
end

function Stats.GetStatFromName(name : string) : StatValue
    local statValue : StatValue? = nil
    for _, stat in ipairs(_statList) do
        if stat.Name == name then
            statValue = stat
            break
        end
    end

    if not statValue then
        return warn("Stat with name " .. name .. " does not exist!")
    end

    return statValue
end

return Stats