% Takes a value and returns the next iterator value
function newValue = NewtonRaphsonStep(oldValue, fPrime, fSecond)

  newValue = oldValue - (Polynomial(oldValue, fPrime) / Polynomial(oldValue, fSecond));
