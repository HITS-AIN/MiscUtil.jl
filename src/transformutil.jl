sigmoid(x) = logistic(x)

invsigmoid(y) = logit(y)


makepositive(x) = softplus(x)

invmakepositive(y) = invsoftplus(y)


transformbetween(x, lower, upper) = sigmoid(x) * (upper - lower) + lower

invtransformbetween(y, lower, upper) = invsigmoid((y - lower)/(upper-lower))
