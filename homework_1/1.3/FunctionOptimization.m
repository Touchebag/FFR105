% Searches for the minimum of a function using a genetic algorithm

  populationSize                = 100;
  numberOfGenes                 = 50;
  crossoverProbability          = 0.8;
  mutationProbability           = 0.025;
  tournamentSelectionParamenter = 0.75;
  variableRange                 = 5.0;
  numberOfGenerations           = 100;
  fitness                       = zeros(populationSize, 1);

  % Graphics
  surfaceFigureHandle = figure;
  hold on;
  set(surfaceFigureHandle, 'DoubleBuffer', 'on');
  delta = 0.1;
  limit = fix(2 * variableRange/delta) + 1;
  [xValues, yValues] = meshgrid(-variableRange:delta:variableRange, -variableRange:delta:variableRange);
  zValues = zeros(limit, limit);
  for j = 1:limit
    for k = 1:limit
      zValues(j, k) = EvaluateIndividual([xValues(j, k) yValues(j, k)]);
    end
  end
  surfl(xValues, yValues, zValues)
  colormap gray;
  shading interp;
  view([-7 -9 10]);
  decodedPopulation = zeros(populationSize, 2);
  populationPlotHandle = plot3(decodedPopulation(:,1), decodedPopulation(:,2), fitness(:), 'kp');
  hold off;
  drawnow;

  population = InitializePopulation(populationSize, numberOfGenes);

  for iGeneration = 1:numberOfGenerations

    maximumFitness = 0.0;
    bestIndividualIndex = 0;

    for i = 1:populationSize
      chromosome = population(i,:);
      x = DecodeChromosome(chromosome, 2, variableRange);
      fitness(i) = EvaluateIndividual(x);
      decodedPopulation(i,:) = x;

      if fitness(i) > maximumFitness
        maximumFitness = fitness(i);
        bestIndividualIndex = i;
      end
    end

    tempPopulation = population;

    for i = 1:2:populationSize
      i1 = TournamentSelect(fitness, tournamentSelectionParamenter, 2);
      i2 = TournamentSelect(fitness, tournamentSelectionParamenter, 2);
      chromosome1 = population(i1,:);
      chromosome2 = population(i2,:);

      r = rand;
      if r < crossoverProbability
        newChromosomePair     = Cross(chromosome1, chromosome2);
        tempPopulation(i,:)   = newChromosomePair(1,:);
        tempPopulation(i+1,:) = newChromosomePair(2,:);
      else
        tempPopulation(i,:)   = chromosome1;
        tempPopulation(i+1,:) = chromosome2;
      end
    end

    for i = 1:populationSize
      originalChromosome = tempPopulation(i,:);
      mutatedChromosome = Mutate(originalChromosome, mutationProbability);
      tempPopulation(i,:) = mutatedChromosome;
    end

    bestIndividual = population(bestIndividualIndex,:);
    tempPopulation = InsertBestIndividual(tempPopulation, bestIndividual, 1);
    population     = tempPopulation;

    set(populationPlotHandle, 'XData', decodedPopulation(:,1), 'YData', decodedPopulation(:,2), 'ZData', fitness(:));
    drawnow;
  end


