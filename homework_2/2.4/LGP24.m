% Searches for the minimum of a function using a genetic algorithm

  populationSize                = 100;
  crossoverProbability          = 0.4;
  mutationProbability           = 0.05;
  tournamentSize                = 4;
  tournamentSelectionParamenter = 0.75;
  numberOfGenerations           = 1000;
  minChromLength                = 2;
  maxChromLength                = 10;
  fitness                       = zeros(populationSize, 1);
  numberOfVariableRegisters     = 3;
  constantRegisters             = [1 2 3 5 8];
  numberOfConstantRegisters     = length(constantRegisters);

  inputs = LoadFunctionData;

  population = ...
    InitializePopulation(populationSize, ...
                         minChromLength,            maxChromLength, ...
                         numberOfVariableRegisters, numberOfConstantRegisters);

  for iGeneration = 1:numberOfGenerations

    maximumFitness = 0.0;
    bestIndividualIndex = 0;
    decodedPopulation = zeros(populationSize, length(inputs));

    for i = 1:populationSize
      chromosome = population(i);
      x = ExecuteProgram( ...
        chromosome, numberOfVariableRegisters, constantRegisters, inputs);
      fitness(i) = EvaluateIndividual(x, inputs);
      decodedPopulation(i,:) = x;

      if fitness(i) > maximumFitness
        maximumFitness = fitness(i);
        bestValues = x;
        bestIndividualIndex = i;
      end
    end

    tempPopulation = population;

    for i = 1:2:populationSize
      i1 = TournamentSelect(fitness, tournamentSelectionParamenter, tournamentSize);
      i2 = TournamentSelect(fitness, tournamentSelectionParamenter, tournamentSize);
      chromosome1 = population(i1);
      chromosome2 = population(i2);

      r = rand;
      if r < crossoverProbability
        newChromosomePair     = Cross(chromosome1, chromosome2);
        tempPopulation(i)   = newChromosomePair(1);
        tempPopulation(i+1) = newChromosomePair(2);
      else
        tempPopulation(i)   = chromosome1;
        tempPopulation(i+1) = chromosome2;
      end
    end

    for i = 1:populationSize
      originalChromosome = tempPopulation(i);
      mutatedChromosome = Mutate(originalChromosome, mutationProbability, ...
                                 numberOfVariableRegisters, ...
                                 numberOfConstantRegisters);
      tempPopulation(i) = mutatedChromosome;
    end

    bestIndividual = population(bestIndividualIndex);
    tempPopulation = InsertBestIndividual(tempPopulation, bestIndividual, 1);
    population     = tempPopulation;
  end

  xPlot = inputs(:,1);
  y1Plot = inputs(:,2);
  y2Plot = bestValues;
  disp('Best program: ');
  TranslateProgram(bestIndividual, numberOfVariableRegisters, constantRegisters)

  plot(xPlot, y1Plot, xPlot, y2Plot)









