% Takes a vector of x and evaluates its fitness
function fitness = EvaluateIndividual(x)

  % Note: Hardcoded for problem 1.3b (i.e unreadable)
    g = (1 + (x(1) + x(2) + 1)^2 * (19 - 14*x(1) + 3*x(1)^2 - 14*x(2) + 6*x(1)*x(2) + 3*x(2)^2) ) * (30 + (2*x(1) - 3*x(2))^2*(18 - 32*x(1) + 12*x(1)^2 + 48*x(2) - 36*x(1)*x(2) + 27*x(2)^2));

  fitness = 1 / g;
end
