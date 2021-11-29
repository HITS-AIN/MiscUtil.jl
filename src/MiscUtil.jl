module MiscUtil

    using LinearAlgebra, Printf, Crayons


    # export calculaterbfbasis, calculaterbfbasis!

    export safewrapper

    export addjitter, addjitter!

    export makematrixsymmetric, makematrixsymmetric!

    export woodbury_A_plus_UCV

    export tasksleep

    export sigmoid, invsigmoid, makepositive, invmakepositive, transformbetween, invtransformbetween

    include("transformutil.jl")

    include("matricesutil.jl")

    include("sleeputil.jl")

    include("safewrapper.jl")

end
