--!strict
local HttpService : HttpService = game:GetService("HttpService")

local Queue = require(game.ReplicatedStorage.Utility.Queue)
local Entity = require(game.ReplicatedStorage.Types.Entity)

type BaseEntity<T> = Entity.BaseEntity & T

local _entites : {BaseEntity<Entity.PlayerCharacterEntity | Entity.BreakableEntity | any>}  = {}
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

    --this isn't complex at all
    local baseEntity : BaseEntity<T> = (setmetatable(entityData :: any, {__index = {
        Id = entityId,
        CanTakeDamage = canTakeDamage,
        InteractionQueue = Queue.new(),
        OnInteractionTriggered = onInteractionTriggered,
        OnUpdate = onUpdate,
        OnEntityDestroyed = onEntityDestroyed
    }})) :: T & BaseEntity<T>

    table.insert(_entites, baseEntity)

    return entityId
end

function functions.RemoveEntityById(entityId : string)
    for _, v : BaseEntity<any> in next, _entites do
        if v.Id == entityId then
            table.remove(_entites, _)
            break
        end
    end
end

function functions.GetEntityById<T>(entityId : string) : BaseEntity<T>?

    --We know that T intersects base entity as T is a subtype of BaseEntity
    for _, v : BaseEntity<T> in next,_entites :: {BaseEntity<T>} do
        if v.Id == entityId then
            return v :: BaseEntity<T>
        end
    end

    return nil
end

return functions