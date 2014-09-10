% Returns the specified order derviative of a polynom
function derviative = PolynomialDifferentiation(inVector, diffOrder)

  % Matlab still uses descending order
  polynomial = fliplr(inVector);

  diff(polynomial, diffOrder);
