% Uses the NewtonRaphson method to calculate a min value of a polynomial function
function points = NewtonRaphson(polynomial, start, tolerance)

  f        = polynomial;
  fPrime   = PolynomialDifferentiation(f, 1);
  newPoint = start;
  points   = [start];

  while abs(Polynomial(newPoint, fPrime)) > tolerance
    oldPoint = newPoint;

    % Calulate next point and store in return value
    newPoint = oldPoint - (Polynomial(oldPoint, f) / Polynomial(oldPoint, fPrime));
    points = [points newPoint];
  end

