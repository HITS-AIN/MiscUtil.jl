sigmoid(x) = StatsFuns.logistic(x)

invsigmoid(y) = StatsFuns.logit(x)


makepositive(x) = StatsFuns.softplus(x)

invmakepositive(y) = StatsFuns.invsoftplus(y)


transformbetween(x, lower, upper) = sigmoid(x) * (upper - lower) + lower

invtransformbetween(y, lower, upper) = invsigmoid((y - lower)/(upper-lower))
