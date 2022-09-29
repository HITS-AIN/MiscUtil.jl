using MiscUtil
using Test

@testset "MiscUtil.jl" begin

    ###########
    # sigmoid #
    ###########

     for x in [1e-6;0.0;1.0;5.0]
       @test abs(invsigmoid(sigmoid(x)) - x) < 1e-8
     end

    ####################
    # transformbetween #
    ####################

    for x in [1e-6;0.0;1.0;5.0]
        @test abs(invtransformbetween(transformbetween(x, -1.3, 10.1), -1.3, 10.1) - x) < 1e-8
    end

    ################
    # makepositive #
    ################

    for x in [1e-3;0.0;1.0;5.0]
        @test abs(invmakepositive(makepositive(x)) - x) < 1e-8
    end

    #############
    # CVindices #
    #############

    let 
        for (K,N,S) in [(2,10,1), (3,10,3), (4,201,1), (100, 101, 4), (50,5000,4)]
             
            cv = CVindices(K = K, N = N, seed = S)

            @test all(sort(reduce(vcat, folds(cv))) .== 1:N)
             
             for k in 1:K
                @test all(sort(union(taketrainfold(cv, k), taketestfold(cv, k))) .== 1:N)
             end

        end
    end


end
