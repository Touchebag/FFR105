% Generates a matrix of a populations with randomized binary chromosomes
function population = InitializePopulation(populationSize, numberOfGenes)

  % Create matrix
  population = zeros(populationSize, numberOfGenes);

  for i = 1:populationSize
      s = randperm(numberOfGenes);
      population(i,:) = s;
  end

end

