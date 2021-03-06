# FIFO queue

type Queue{S}   # S is the type of internal deque
    store::S
end

queue{T}(ty::Type{T}) = Queue(Deque{T}())
queue{T}(ty::Type{T}, blksize::Integer) = Queue(Deque{T}(blksize))

isempty(s::Queue) = isempty(s.store)
length(s::Queue) = length(s.store)

front(s::Queue) = front(s.store)
back(s::Queue) = back(s.store)

function enqueue!(s::Queue, x)
    push!(s.store, x)
    s
end

dequeue!(s::Queue) = shift!(s.store)
