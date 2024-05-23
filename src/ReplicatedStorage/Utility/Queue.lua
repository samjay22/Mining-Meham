--!strict
local Queue = {}
Queue.__index = Queue

export type QueueType = typeof(Queue)
function Queue.new(queueTable : {any}?) : QueueType 
    return setmetatable(queueTable or {}, Queue) :: any
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