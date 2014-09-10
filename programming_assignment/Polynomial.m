% Evaluates a polynomial from a vector
function value = Polynomial(x, inVector)

  % Matlab uses descending order of coefficients instead
  polynomial = fliplr(inVector);

  value = polyval(polynomial, x);

