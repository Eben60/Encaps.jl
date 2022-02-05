p = (a=1, b="b")

# macro unp(x)
#     local nt = @eval $x
#     for k in keys(nt)
#         local v = nt[k]
#         @eval $k = $v
#     end
# end

function qt(x)
    return
end

function unp(x)
    exs = [Expr(:(=), k, x[k]) for k in keys(x)]
    eval.(exs)
end
