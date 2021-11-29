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

end
