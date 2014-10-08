% Generates a matrix of a populations with randomized paths
function population = InitializePopulation(populationSize, numberOfGenes)

  % Create matrix
  population = zeros(populationSize, numberOfGenes);

  for i = 1:populationSize
      s = randperm(numberOfGenes);
      population(i,:) = s;
  end

end

