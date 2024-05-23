--!strict
---@diagnostic disable: redefined-type
--[[

Game entity information. THis contains all health, and anything else an entity may or may not contain

]]
local Queue = require(game.ReplicatedStorage.Utility.Queue)
local DisplayInfo = require(game.ReplicatedStorage.Types.DisplayInfo)
local Breakable = require(game.ReplicatedStorage.Types.Breakable)

export type HealthComponent = {
    MaxHealth : number,
    CurrentHealth : number,
}

export type BaseEntity = {
    Id : string,
    OnUpdate : (self : BaseEntity) -> (), 
    --What type of interaction, damaged, inspected, ectt is interaction id.
    OnInteractionTriggered : (self : BaseEntity, entityId : number, interactionEventId : number, interactionData: {[string] : any}) -> (),
    OnEntityDestroyed : (self : BaseEntity) -> (),
    CanTakeDamage : boolean,

    --Queue for entity interactions
    InteractionQueue : Queue.QueueType
} & DisplayInfo.DisplayInfo


export type PlayerCharacterEntity = {
    OnCharacterAdded : (player : Player) -> (),
    OnCharacterDied : (player : Player) -> (),
    

} & BaseEntity & HealthComponent

export type BreakableEntity = {
    OnEntityBreak : (self : BreakableEntity, entityId : number) -> (),
    Position : Vector3
} & BaseEntity & HealthComponent & Breakable.BreakableItem

return 0