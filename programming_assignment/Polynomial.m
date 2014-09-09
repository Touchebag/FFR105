% Generates a polynomial based on a vector
function polynomial = Polynomial(inVector)

  f = fliplr(inVector)

  % Variables
  f(x) = 0;
  vectorLength = length(inVector);

  if vectorLength < 2 then
    disp('Error: Polynomial must be second order derivable')
  else
    for i = 1:length(inVector)
      f(x) = f(x) + inVector(i) * x ^ (i - 1);
    end_for
  end_if
