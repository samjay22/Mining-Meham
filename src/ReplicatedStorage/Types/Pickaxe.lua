--!strict

local DisplayInfo = require(game.ReplicatedStorage.Types.DisplayInfo)

--This type is an ID
type PickaxeStat = number
export type Pickaxe = {
    Id : number,
    Stats : {[PickaxeStat] : number},
    DisplayInfoId : number,
} & DisplayInfo.DisplayInfo

return 0