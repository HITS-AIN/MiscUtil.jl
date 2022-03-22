logrange(x1, x2, n) = (10^y for y in range(log10(x1), log10(x2), length=n))

mutable struct LogRange
    
    lr::StepRangeLen

end


LogRange(first, last, n) = LogRange(range(log10(first), log10(last), length=n))


function Base.iterate(a::LogRange)

    v, s = iterate(a.lr)

    return 10^v, s

end


function Base.iterate(a::LogRange, b)

    if b > length(a.lr)
        return nothing
    end

    v, s = iterate(a.lr, b)

    return 10^v, s

end


Base.length(a::LogRange)      = length(a.lr)

Base.getindex(a::LogRange, i) = 10^getindex(a.lr, i)

Base.firstindex(a::LogRange)  = firstindex(a.lr)

Base.lastindex(a::LogRange)   = lastindex(a.lr)

# Base.eltype(::Type{LogRange})  = Real
