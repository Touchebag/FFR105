% Returns the specified order derviative of a polynomial
function derivative = PolynomialDifferentiation(inVector, diffOrder)

  % If "zeroeth order" derivative, do nothing
  if (diffOrder == 0)
    derivative = inVector
  else
    % Matlab still uses descending order
    polynomial = fliplr(inVector);

    for i = 1:diffOrder
      polynomial = polyder(polynomial);
    end

    derivative = fliplr(polynomial);
  end
