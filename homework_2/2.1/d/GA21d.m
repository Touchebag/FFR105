% Searches for the minimum of a function using a genetic algorithm

  % Initialise plotting
  cityLocation = LoadCityLocations;
  tspFigure = InitializeTspPlot(cityLocation,[0 20 0 20]);
  connection = InitializeConnections(cityLocation);

  % Parameters
  populationSize                = 50;
  numberOfGenes                 = 50;
  mutationProbability           = 0.025;
  tournamentSize                = 2;
  tournamentSelectionParamenter = 0.75;
  numberOfGenerations           = 2000;
  fitness                       = zeros(1,populationSize);

  % TODO number of genes, not popsize
  cityMatrix     = LoadCityLocations;
  distanceMatrix = zeros(populationSize);

  % Pre-calculate distances
  for i = 1:populationSize
    for j = 1:populationSize
      xDiff = abs(cityMatrix(i, 1) - cityMatrix(j, 1));
      yDiff = abs(cityMatrix(i, 2) - cityMatrix(j, 2));
      dist  = sqrt(xDiff^2 + yDiff^2);

      distanceMatrix(i, j) = dist;
    end
  end

  population  = NearestNeighbour(populationSize, numberOfGenes, distanceMatrix);
  bestFitness = 0.0;

  for iGeneration = 1:numberOfGenerations

    % Due to elitism
    bestIndividualIndex = 1;

    % Calculate fitness
    for i = 1:populationSize
      chromosome = population(i,:);
      fitness(i) = EvaluatePath(chromosome, cityMatrix, distanceMatrix);

      if fitness(i) > bestFitness
        bestFitness = fitness(i);
        bestIndividualIndex = i;
      end
    end

    tempPopulation = population;

    % Select using tournament selection
    for i = 1:populationSize
      i1 = TournamentSelect(fitness, tournamentSelectionParamenter, tournamentSize);

      tempPopulation(i,:) = population(i1,:);
    end

    % Mutate
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

disp(['Shortest path found: ' num2str(1 / bestFitness)]);

