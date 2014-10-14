% Calculates the fitness given output from a chromosome and reference values
function fitness = EvaluateIndividual(values, inputs)

  tmp = (values' - inputs(:,2)) .^ 2;
  tmp = sum(tmp);
  e   = sqrt(tmp / (length(values)));

  fitness = 1 / e;
end

