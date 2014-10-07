% Replaces the first n instances in a population
function newPopulation = InsertBestIndividual(population, bestIndividual, numberOfCopies)

  newPopulation = population;
  for i = 1:numberOfCopies
    newPopulation(i,:) = bestIndividual;
  end

end

