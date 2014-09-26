% Calculates a minimum of a function using gradient descent
function point = GradientDescent(x, mu, stepLength, threshold)

  pos = x;
  gradient = Gradient(pos(1), pos(2), mu);

  while (norm(gradient) > threshold)
    pos(1) = pos(1) - stepLength * gradient(1);
    pos(2) = pos(2) - stepLength * gradient(2);

    gradient = Gradient(pos(1), pos(2), mu);
  end

  point = pos;

end

