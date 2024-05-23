---@diagnostic disable: redefined-type
--!strict
--[[

Game entity information. THis contains all health, and anything else an entity may or may not contain

]]
local DisplayInfo = require(game.ReplicatedStorage.Types.DisplayInfo)

export type HealthComponent = {
    MaxHealth : number,
    CurrentHealth : number,
}

export type BaseEntity = {
    Id : number,
    OnUpdate : (self : BaseEntity) -> (), 
    --What type of interaction, damaged, inspected, ectt is interaction id.
    OnInteractionTriggered : (self : BaseEntity, entityId : number, interactionEventId : number, interactionData: {[string] : any}) -> (),
    OnEntityDestroyed : (self : BaseEntity) -> (),
    CanTakeDamage : boolean,

    --Queue for entity interactions
    InteractionQueue : {}
} & DisplayInfo.DisplayInfo


export type PlayerCharacterEntity = {
    OnCharacterAdded : (player : Player) -> (),
    OnCharacterDied : (player : Player) -> (),
    

} & BaseEntity & HealthComponent

export type BreakableEntity = {
    OnEntityBreak : (entityId : number) -> (),
    Position : Vector3
} & BaseEntity & HealthComponent

return 0