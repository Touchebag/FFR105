% Calculates the gradient of the function from 1.1
function gradient = Gradient(x1, x2, mu)

  if x1^2+x2^2 <= 1
    gradient(1) = 2*(x1 - 1);
    gradient(2) = 4*(x2 - 8);
  else
    gradient(1) = mu*(4 * x1^3 + x1 *(4 * x2^2 -4)) + 2 * x1 - 2;
    gradient(2) = mu*(4 * x1^2 * x2 + x2 *(4 * x2^2 -4)) + 4 * x2 - 8;
  end
end

