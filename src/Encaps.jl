# https://discourse.julialang.org/t/parsimonious-way-to-unpack-big-structs/66522/11

module Encaps

macro unp(x)
    local nt = @eval $x
    for k in keys(nt)
        local v = nt[k]
        @eval $k = $v
    end
end

function upd(p; kwargs...)
    p = Dict(pairs(p))
    for kw in kwargs
        p[kw.first] = kw.second
    end
    return (; p...)
end

export @unp, upd

end # module
