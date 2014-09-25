% Generates a matrix of a populations with randomized binary chromosomes
function population = InitializePopulation(populationSize, numberOfGenes)

  % Create matrix
  population = zeros(populationSize, numberOfGenes);

  for i = 1:populationSize
    for j = 1:numberOfGenes
      s = randi([0 1]);
      population(i, j) = s;
    end
  end

end

