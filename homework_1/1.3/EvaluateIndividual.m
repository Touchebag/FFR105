% Takes a vector of variables and evaluates its fitness
function fitness = EvaluateIndividual(variables)

  % Note: Hardcoded for problem 1.3b (i.e unreadable)
    g = (1 + (variables(1) + variables(2) + 1)^2 * (19 - 14*variables(1) + 3*variables(1)^2 - 14*variables(2) + 6*variables(1)*variables(2) + 3*variables(2)^2) ) * (30 + (2*variables(1) - 3*variables(2))^2*(18 - 32*variables(1) + 12*variables(1)^2 + 48*variables(2) - 36*variables(1)*variables(2) + 27*variables(2)^2));

  fitness = 1 / g;
end
