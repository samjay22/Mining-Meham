--!strict
--[[

- Core Breakables: Stone [50%], Wood [20%], Coal [15%], Copper [10%], Boulder [5%]
	- Secondary Breakables: Coal Ore [75%], Copper Ore [25%]
	- Special Breakables: Crate[75%], Barrel [25%]

UPGRADE #2:
	- Core Breakables: Wood [50%], Coal [20%], Copper [15%], Boulder [10%], Jade [5%]
	- Secondary Breakables: Coal Ore [45%], Copper Ore [50%], Iron Ore [5%]
	- Special Breakables: Barrel [75%], Chest [25%]

UPGRADE #3
	- Core Breakables: Coal [50%], Copper [20%], Boulder [15%], Jade [10%], Ruby [5%]
	- Secondary Breakables: Copper Ore [45%], Iron Ore [50%], Jade Ore [5%]
	- Special Breakables: Chest [75%], Buried Treasure [25%]

]]
local DisplayInfo = require(game.ReplicatedStorage.Types.DisplayInfo)
export type BreakableItem = {
    DropInfoId :  number,
    BreakRewardId : number,
    BreakableTypeId : number,
    RarityId : number,
    BaseSpawnChance : number,
    MaxHealth : number,

    --Path so we can clone
    ItemPath : string,
} & DisplayInfo.DisplayInfo

export type BreakReward = {
    Id : number,
    Min : number,
    Max : number,

    Image : string,
    ObjectPath : string
}

export type BreakableType = {
    Id : number,
} & DisplayInfo.DisplayInfo

return 0