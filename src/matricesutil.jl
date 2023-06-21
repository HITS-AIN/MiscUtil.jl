
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
# Find closest positive definite matrix
#-----------------------------------------------------------

"""
    nearestposdef(A; minimumeigenvalue = 1e-6)

Nearest positive definite matrix in Frobenious norm.
Also called the projection of the matrix onto the cone of positive definite matrices.
See: https://nhigham.com/2021/01/26/what-is-the-nearest-positive-semidefinite-matrix/
```
"""
function nearestposdef(A; minimumeigenvalue = 1e-6)

    local Evalues, Evector = eigen(A)

    local newA = Evector * Diagonal(max.(Evalues, minimumeigenvalue)) * Evector'

    makematrixsymmetric!(newA)

    newA

end


#-----------------------------------------------------------
# Create orthogonal matrix
#-----------------------------------------------------------

"""
See https://en.wikipedia.org/wiki/Cayley_transform#Matrix_map
"""
function makeorthogonal(C)
    
    A = C - C'      # make skew-symmetric
    
    (I-A) / (I+A)   # make orthogonal

end
