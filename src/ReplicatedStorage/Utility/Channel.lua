--!strict
local _channels = {}
local Channel = {}

function Channel.New(channelName : string, delegate)
    if not _channels[channelName] then
        _channels[channelName] = Instance.new("BindableEvent")
    end

    _channels[channelName].Event:Connect(delegate)
end
  
function Channel.Fire(channelName : string, ...)
    if _channels[channelName] then
        _channels[channelName]:Fire(...)
    end
end

function Channel.Disconnect(channelName : string)
    if _channels[channelName] then
        _channels[channelName]:Destroy()
        _channels[channelName] = nil
    end
end

return Channel