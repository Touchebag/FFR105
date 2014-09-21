% Takes a vector of variables and evaluates its fitness
function fitness = EvaluateIndividual(variables)

  % Note: Hardcoded for problem 1.3b (i.e unreadable)
    function temp = g(invec)
      temp = (1 + (invec(1) + invec(2) + 1)^2 * (19 - 14*invec(1) + 3*invec(1)^2 - 14*invec(2) + 6*invec(1)*invec(2) + 3*invec(2)^2) ) * (30 + (2*invec(1) - 3*invec(2))^2*(18 - 32*invec(1) + 12*invec(1)^2 + 48*invec(2) - 36*invec(1)*invec(2) + 27*invec(2)^2));
    end

  fitness = 1 / g(variables);
end
