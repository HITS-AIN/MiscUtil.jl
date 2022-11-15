sigmoid(x) = StatsFuns.logistic(x)

invsigmoid(y) = StatsFuns.logit(x)

makepositive(x) = exp(x)

invmakepositive(y) = log(y)


transformbetween(x, lower, upper) = sigmoid(x) * (upper - lower) + lower

invtransformbetween(y, lower, upper) = invsigmoid((y - lower)/(upper-lower))
