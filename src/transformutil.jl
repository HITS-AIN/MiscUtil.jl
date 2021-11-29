makepositive(x) = exp(x)

invmakepositive(y) = log(y)

sigmoid(x) = 1.0 / (exp(-x) + 1.0)

invsigmoid(y) = - log(1/y -1.0)

transformbetween(x, lower, upper) = sigmoid(x) * (upper - lower) + lower

invtransformbetween(y, lower, upper) = invsigmoid((y - lower)/(upper-lower))
