function bracket(f; Tinitial = 0.0)

    tol = 1e-10

    step = 0.1

    # starting value
    rightbnd = Tinitial

    # go right until function peters out
    while abs(f(rightbnd)) > tol
        rightbnd += step
    end

    # starting value
    leftbnd = Tinitial

    # go left until function peters out
    while abs(f(leftbnd)) > tol
        leftbnd -= step
    end

    # return extrema
    max(abs(leftbnd), abs(rightbnd))

end

bracketkernel(f; x = 0.0)           = bracket(f; Tinitial = x)
brackettransferfunction(f; x = 0.0) = bracket(f; Tinitial = x)
