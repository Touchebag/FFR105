% Robin Touche  900610-3270  robint@student.chalmers.se

% Evaluates a polynomial from a vector
function value = Polynomial(x, inVector)

  % Matlab uses descending order of coefficients
  polynomial = fliplr(inVector);

  value = polyval(polynomial, x);

