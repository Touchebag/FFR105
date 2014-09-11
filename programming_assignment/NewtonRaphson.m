% Uses the NewtonRaphson method to calculate a min value of a polynomial function
function values = NewtonRaphson(polynomial, start, tolerance)

  fPrime   = PolynomialDifferentiation(polynomial, 1);
  fSecond  = PolynomialDifferentiation(polynomial, 2);
  newValue = start;
  values   = [start];

  % Needed to ensure the first iteration always happen
  % since Matlab does not support do-while statements
  oldValue = start + tolerance + 1;

    while abs(newValue - oldValue) > tolerance
      oldValue = newValue;

      % Makes sure that the second order derivative is not 0
      if (Polynomial(newValue, fSecond) == 0)
        disp('Error: F''''(x) cannot be 0')

        % Clear values to avoid unneccessary plotting
        values = [];
        break;
      else
        newValue = NewtonRaphsonStep(oldValue, fPrime, fSecond);
        values = [values newValue];
      end
    end

