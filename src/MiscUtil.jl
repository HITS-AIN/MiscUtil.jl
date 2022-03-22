module MiscUtil

    using LinearAlgebra, Printf, Crayons, PyPlot

    import Distributions: AbstractMvNormal

    import Statistics: mean, cov

    # export calculaterbfbasis, calculaterbfbasis!

    export safewrapper

    export addjitter, addjitter!

    export makematrixsymmetric, makematrixsymmetric!

    export nearestposdef

    export woodbury_A_plus_UCV

    export tasksleep

    export sigmoid, invsigmoid, makepositive, invmakepositive, transformbetween, invtransformbetween

    export logrange, LogRange

    export bracket

    export colourprint

    export waitforkey

    export getcolourrange

    export plot_ellipse

    include("transformutil.jl")

    include("matricesutil.jl")

    include("sleeputil.jl")

    include("safewrapper.jl")

    include("logrange.jl")

    include("bracket.jl")

    include("colourprint.jl")

    include("waitforkey.jl")

    include("getcolourrange.jl")

    include("plot_ellipse.jl")

end
