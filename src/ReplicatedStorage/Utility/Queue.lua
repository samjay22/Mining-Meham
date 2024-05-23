--!strict
local Queue = {}
Queue.__index = Queue

function Queue.new(queueTable)
    return setmetatable(queueTable or {}, Queue)
end

function Queue:Dequeue()
    return table.remove(self)
end

function Queue:Enqueue(item : any)
    table.insert(self, item)
end

function Queue:Peek()
    return self[1]
end

return Queue