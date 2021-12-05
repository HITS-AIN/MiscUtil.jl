module MiscUtil

    using LinearAlgebra, Printf, Crayons


    # export calculaterbfbasis, calculaterbfbasis!

    export safewrapper

    export addjitter, addjitter!

    export makematrixsymmetric, makematrixsymmetric!

    export nearestposdef

    export woodbury_A_plus_UCV

    export tasksleep

    export sigmoid, invsigmoid, makepositive, invmakepositive, transformbetween, invtransformbetween

    export logrange

    export bracket, bracketkernel, brackettransferfunction

    include("transformutil.jl")

    include("matricesutil.jl")

    include("sleeputil.jl")

    include("safewrapper.jl")

    include("logrange.jl")

    include("bracket.jl")

end
