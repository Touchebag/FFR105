% Takes a chromosome (as a vector) and returns a vector of variables of a given length

% TODO check 3.9 in course book
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
  nextBit   = 0;
  var       = [];
  variables = [];

  while i < chromLength
    for j = 1:variableLength
      i = i + 1;

      nextBit = chromosome(i);

      var = [var nextBit];
    end

    temp = bi2de(var);

    variables = [variables temp];
    var = [];
  end
end

