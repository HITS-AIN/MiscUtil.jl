module MiscUtil

    using LinearAlgebra, Printf, Crayons, PyPlot

    import Random: randperm, MersenneTwister

    import Distributions: AbstractMvNormal

    import Statistics: mean, cov

    import StatsFuns: logistic, logit, softplus, invsoftplus

    export safewrapper

    export addjitter, addjitter!

    export makematrixsymmetric, makematrixsymmetric!

    export nearestposdef

    export makeorthogonal

    export woodbury_A_plus_UCV

    export tasksleep

    export sigmoid, invsigmoid, makepositive, invmakepositive, transformbetween, invtransformbetween

    export logrange, LogRange

    export bracket

    export colourprint

    export waitforkey

    export getcolourrange

    export plot_ellipse

    export CVindices, taketestfold, taketrainfold, folds

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

    include("CVindices.jl")

end
