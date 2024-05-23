--!strict
local HttpService : HttpService = game:GetService("HttpService")

local Queue = require(game.ReplicatedStorage.Utility.Queue)
local Entity = require(game.ReplicatedStorage.Types.Entity)

local _entites : Entity.BaseEntity = {}
local functions = {}

--returns entity id
--[[
     OnUpdate : (self : BaseEntity) -> (), 
    --What type of interaction, damaged, inspected, ectt is interaction id.
    OnInteractionTriggered : (entityId : number, interactionEventId : number) -> (),
    OnEntityDestroyed : () -> (),
    CanTakeDamage : boolean,
]]
function functions.AddNewEntity<T>(entityData : T, canTakeDamage : boolean, 
    onInteractionTriggered, onUpdate, onEntityDestroyed) : string
    local entityId : string = HttpService:GenerateGUID()
    local baseEntity : Entity.BaseEntity & T = setmetatable{entityData, {
        Id = entityId;
        CanTakeDamage = canTakeDamage,
        OnUpdate = onUpdate,
        OnEntityDestroyed = onEntityDestroyed,
        OnInteractionTriggered = onInteractionTriggered,
        interactionInteractionQueue = Queue.new()
    }}

    table.insert(_entites, baseEntity)

    return entityId
end

function functions.RemoveEntityById(entityId : string)
    for _, v : Entity.BaseEntity in _entites do
        if v.Id == entityId then
            table.remove(_entites, _)
            break
        end
    end
end

function functions.GetEntityById<T>(entityId : string) : T
    for i, v : Entity.BaseEntity in _entites do
        if v.Id == entityId then
            return v :: T
        end
    end
end

return functions