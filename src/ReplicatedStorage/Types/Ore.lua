--!strict

local DisplayInfo = require(game.ReplicatedStorage.Types.DisplayInfo)

export type Ore = {
    Id : number,
    DropInfo : {
        Min : number,
        Max : number,
    },
    RarityId : number,
} & DisplayInfo.DisplayInfo

export type OreNode = {
    OreId : number,
    OreHealth : number,
    Position : Vector3
} & DisplayInfo.DisplayInfo

return 0