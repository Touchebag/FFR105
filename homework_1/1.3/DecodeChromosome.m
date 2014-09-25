% Takes a chromosome (as a vector) and returns a vector of variables within a given range
function variables = DecodeChromosome(chromosome, numberOfVariables, variableRange)

  % Initialise the outvector
  variables = zeros(numberOfVariables);
  chromLength = length(chromosome);
  variableLength = chromLength / numberOfVariables;

  % To make sure we do not get partial variables.
  if (variableLength ~= fix(variableLength))
    error('Number of variables in a chromosome must be an integer');
  end

  i         = 0;
  var       = 0.0;
  variables = [];

  for i = 1:numberOfVariables
    for j = 1:variableLength
      var = var + chromosome(i + j) * 2^(-j);
    end

    var = -variableRange + 2 * variableRange * var / (1 - 2^(-variableLength));

    variables = [variables var]
    var = 0.0;
  end

end

