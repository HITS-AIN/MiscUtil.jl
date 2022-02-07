module MiscUtil

    using LinearAlgebra, Printf, Crayons

    import PyPlot: get_cmap

    # export calculaterbfbasis, calculaterbfbasis!

    export safewrapper

    export addjitter, addjitter!

    export makematrixsymmetric, makematrixsymmetric!

    export nearestposdef

    export woodbury_A_plus_UCV

    export tasksleep

    export sigmoid, invsigmoid, makepositive, invmakepositive, transformbetween, invtransformbetween

    export logrange

    export bracket

    export colourprint

    export waitforkey

    export getcolourrange

    include("transformutil.jl")

    include("matricesutil.jl")

    include("sleeputil.jl")

    include("safewrapper.jl")

    include("logrange.jl")

    include("bracket.jl")

    include("colourprint.jl")

    include("waitforkey.jl")

    include("getcolourrange.jl")

end
