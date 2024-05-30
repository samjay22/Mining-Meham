--!strict
local Channel = require(game.ReplicatedStorage.Utility.Channel)

for _,v in next, game.ServerStorage.ServerChannels:GetChildren() do
    if not v:IsA("ModuleScript") then
        continue
    end

    local data = require(v ::  ModuleScript)
    
    for i,d in next, data do
        Channel.New(i, d)
    end
end