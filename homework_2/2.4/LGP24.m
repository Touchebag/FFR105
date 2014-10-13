% Searches for the minimum of a function using a genetic algorithm

  populationSize                = 100;
  crossoverProbability          = 0.8;
  mutationProbability           = 0.025;
  tournamentSize                = 2;
  tournamentSelectionParamenter = 0.75;
  numberOfGenerations           = 100;
  fitness                       = zeros(populationSize, 1);
  numberOfVariableRegisters     = 0;
  constantRegisters             = [];
  numberOfConstantRegisters     = length(constantRegisters);

  population = InitializePopulation(populationSize, numberOfVariableRegisters);

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
      i1 = TournamentSelect(fitness, tournamentSelectionParamenter, tournamentSize);
      i2 = TournamentSelect(fitness, tournamentSelectionParamenter, tournamentSize);
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
  end

  disp('Minimum value');
  disp(1 / maximumFitness);
  disp('X1*, x2*');
  disp(sprintf('%f, %f', bestIndividual(1), bestIndividual(2)));

