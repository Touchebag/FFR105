% Searches for the minimum of a function using a genetic algorithm

  populationSize                = 100;
  numberOfGenes                 = 50;
  mutationProbability           = 0.025;
  tournamentSize                = 2;
  tournamentSelectionParamenter = 0.75;
  numberOfGenerations           = 100;
  fitness                       = zeros(populationSize, 1);

  population = InitializePopulation(populationSize, numberOfGenes);

  for iGeneration = 1:numberOfGenerations

    maximumFitness = 0.0;
    bestIndividualIndex = 0;

    for i = 1:populationSize
      chromosome = population(i,:);
      fitness(i) = EvaluateIndividual(x);
      decodedPopulation(i,:) = x;

      if fitness(i) > maximumFitness
        maximumFitness = fitness(i);
        bestIndividualIndex = i;
      end
    end

    tempPopulation = population;

    for i = 1:populationSize
      i1 = TournamentSelect(fitness, tournamentSelectionParamenter, tournamentSize);

      tempPopulation(i)     = population(i1,:);
    end

    for i = 1:populationSize
      originalChromosome = tempPopulation(i,:);
      mutatedChromosome = Mutate(originalChromosome, mutationProbability);
      tempPopulation(i,:) = mutatedChromosome;
    end

    bestIndividual = population(bestIndividualIndex,:);
    tempPopulation = InsertBestIndividual(tempPopulation, bestIndividual, 1);
    population     = tempPopulation;

  end

