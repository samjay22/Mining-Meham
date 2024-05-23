local Channel = require(game.ReplicatedStorage.Utility.Channel)

for _,v in next, game.ServerStorage.ServerChannels:GetChildren() do
    local data = require(v)
    
    for i,d in next, data do
        Channel.New(i, d)
    end
end