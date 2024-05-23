--!strict
local DisplayInfo = require(game.ReplicatedStorage.Types.DisplayInfo)

export type InteractionType = {
    Id : number,
} & DisplayInfo.DisplayInfo


export type DamageInteraction = {
    DamageAmount : number,
}
export type HoverInteraction = {
    EntityOverId : number,
}
export type InspectInteraction = {
    InspectedEntityId : number,
}
export type CollectInteraction = {
    CollectedEntityId : number,
}
export type InteractionData = {
    InteractionId : string,
    InteractionType : InteractionType,
} & (DamageInteraction | HoverInteraction | InspectInteraction | CollectInteraction)

return 0