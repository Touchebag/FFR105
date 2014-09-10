% Returns the specified order derviative of a polynomial
function derivative = PolynomialDifferentiation(inVector, diffOrder)

  % Matlab still uses descending order
  temp = fliplr(inVector);

  for i=1:diffOrder
    temp = polyder(temp);
  end

  derivative = fliplr(temp);
