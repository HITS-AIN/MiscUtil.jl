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
