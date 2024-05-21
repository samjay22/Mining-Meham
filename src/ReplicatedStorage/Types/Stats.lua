--!strict
local DisplayInfo = require(game.ReplicatedStorage.Types.DisplayInfo)
--It is much easier to define stats as ID's so we can change the name without resetting data.
export type StatValue = {
    Id : number,
    Multiplier : number,
    DisplayInfoId : number,
} & DisplayInfo.DisplayInfo

return 0