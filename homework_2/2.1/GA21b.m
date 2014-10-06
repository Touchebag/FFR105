% Searches for the minimum of a function using a genetic algorithm

  addpath("./TSPgraphics");
  tspFigure = InitializeTspPlot(cityLocation,[0 20 0 20]);
  connection = InitializeConnections(cityLocation);
  PlotPath(connection,cityLocation,path);

  populationSize                = 100;
  numberOfGenes                 = 50;
  mutationProbability           = 0.025;
  tournamentSize                = 2;
  tournamentSelectionParamenter = 0.75;
  numberOfGenerations           = 100;
  fitness                       = zeros(1,populationSize);

  population = InitializePopulation(populationSize, numberOfGenes);
  cityMatrix = LoadCityLocations;

  for iGeneration = 1:numberOfGenerations

    bestFitness         = intmax;
    bestIndividualIndex = 0;

    for i = 1:populationSize
      chromosome = population(i,:);
      fitness(i) = EvaluatePath(chromosome, cityMatrix);

      if fitness(i) < bestFitness
        bestFitness = fitness(i);
        bestIndividualIndex = i;
      end
    end

    tempPopulation = population;

    for i = 1:populationSize
      i1 = TournamentSelect(fitness, tournamentSelectionParamenter, tournamentSize);

      tempPopulation(i,:) = population(i1,:);
    end

    for i = 1:populationSize
      originalChromosome = tempPopulation(i,:);
      mutatedChromosome = Mutate(originalChromosome, mutationProbability);
      tempPopulation(i,:) = mutatedChromosome;
    end

    bestIndividual = population(bestIndividualIndex,:);
    tempPopulation = InsertBestIndividual(tempPopulation, bestIndividual, 1);
    population     = tempPopulation;

    PlotPath(connection,cityLocation,bestIndividual);

  end

