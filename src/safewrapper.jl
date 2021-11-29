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
