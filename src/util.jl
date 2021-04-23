
#-----------------------------------------------------------
# Woodbury inequality for efficient inverse calculation
#-----------------------------------------------------------


"""
    woodbury_A_plus_UCV(; A⁻¹=A⁻¹, U=U, C⁻¹=C⁻¹, V=V)

Efficient computation of `(A + UCV)⁻¹`` when `A⁻¹`` is available (and `C` can be easily inverted).
It does so by applying the Woodbury identity is used:

# Examples
```julia-repl
julia> using LinearAlgebra
julia> A = randn(5,5); A = A*A'; U = randn(5,3); C = Diagonal(rand(3)); V = randn(3,5);
julia> A⁻¹ = A\\I # assume inverse is available
julia> B1 = inv(A + U*C*V) # regular way of computing inverse
julia> B2 = woodbury_A_plus_UCV(; A⁻¹=A⁻¹, U=U, C⁻¹=C\\I, V=V)
julia> maximum(abs.(B1.-B2))<1e-10 # verify that they are numerically equal, should return true
```
"""
woodbury_A_plus_UCV(; A⁻¹=A⁻¹, U=U, C⁻¹=C⁻¹, V=V) =  A⁻¹ - A⁻¹*U*((C⁻¹ + V*A⁻¹*U)\V)*A⁻¹


#-----------------------------------------------------------
# Make matrix symmetric by adding its transpose
#-----------------------------------------------------------

function makematrixsymmetric!(A)
    I,J = size(A)
    for i in 1:I
        for j in i+1:J
            @inbounds tmp = (A[i,j]+A[j,i])/2
            @inbounds A[i,j] = A[j,i] = tmp
        end
    end
    nothing
end

function makematrixsymmetric(A)
    (A+A')/2
end



#-----------------------------------------------------------
# Add a small constant, i.e. jitter to the diagonal
#-----------------------------------------------------------


function addjitter!(A, JITTER = 1e-8)

    I, J = size(A)

    if I !== J
        error("Matrix passed to  addjitter! must be square")
    end

    for i in 1:I
        @inbounds A[i,i] += JITTER
    end

    nothing
end



addjitter(A, JITTER = 1e-8) = A + JITTER*I



#-----------------------------------------------------------
# Wrapper for ensuring that in case function call fails,
# a default value (e.g. Inf) is returned
#-----------------------------------------------------------

function safewrapper(f; E = PosDefException, inform::Bool=false, retvalue = Inf)

    function safe_f(x)

        try

            f(x)

        catch err

            if isa(err, E)

                inform ? @warn("Caught exception!") : nothing

                return retvalue

            else

                throw(err)

            end

        end

    end

end



#-----------------------------------------------------------
# RBF basis calculation
#-----------------------------------------------------------

function calculaterbfbasis!(Φ, x, gridpoints, r=1.0)

    M = length(gridpoints)

    N = length(x)

    for m in 1:M

        for n in 1:N

            @inbounds Φ[n,m] = exp(-norm(gridpoints[m] - x[n])^2 / r^2)

        end

    end

    nothing

end


function calculaterbfbasis(x, gridpoints, r=1.0)

    M = length(gridpoints)

    N = length(x)

    Φ = zeros(N, M)

    calculaterbfbasis!(Φ, x, gridpoints, r)

    return Φ

end
