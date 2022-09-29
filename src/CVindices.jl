struct CVindices
    K::Int
    N::Int
    seed::Int
    trainindices::Vector{Vector{Int}}
end


function CVindices(; K = K, N = N, seed = seed)

    2 <= K <=N || error(@sprintf("K passed to CVindices is %d, but must be between 2 and %d", K, N))

    rg = MersenneTwister(seed)

    randomindices = randperm(rg, N)

    
    trainindices = [zeros(Int,0) for _ in 1:K]

    count = 0

    for n in 1:N

        count += 1

        push!(trainindices[count], randomindices[n])
        
        if count == K
            count = 0
        end

    end

    CVindices(K, N, seed, trainindices)

end


folds(cv) = cv.trainindices


function taketrainfold(cv::CVindices, i::Int)
    
    1 <= i <= cv.K || error(@sprintf("invalid index %d passed to taketrainfold, should be between 1 and %d.", i, cv.K))
    
    reduce(vcat, [cv.trainindices[j] for j in setdiff(1:cv.K, i)])

end


function taketestfold(cv::CVindices, i::Int)
    
    setdiff(1:cv.N, taketrainfold(cv, i))

end


function Base.show(io::IO, cv::CVindices)

    print(io, "CVindices: K = ", cv.K, ", N = ", cv.N, " seed = ", cv.seed)

end