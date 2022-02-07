"""
    getcolourrange(N)

Return N colours for plotting.

  # Example
  ```julia-repl
julia> using PyPlot
julia> clrs = getcolourrange(4)
julia> x = LinRange(0, 2π, 100);
julia> for i in 1:4
          plot(x, sin.(x).+i, color=clrs[i])
       end
```
"""
function getcolourrange(N::Int)

  c = get_cmap("gist_rainbow", N)

  aux = c(LinRange(0,1,N))[:,1:3]

  return [aux[i,:] for i=1:size(aux,1)]

end
