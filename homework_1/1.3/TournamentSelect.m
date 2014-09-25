% Selects an individual using tournament selection
function index = TournamentSelection(population, selectionParamater, size)

  popSize         = length(population);
  tempPopulation  = population;
  selected        = [];

  % Randomly select individuals
  for i = 1:size
    r = randi([1 popSize]);

    individual = population(r:end);
    fitness = EvaluateIndividual(individual);

    % Save induvidual and index
    temp     = [fitness r];
    selected = [selected; temp];
  end

  % Sort selected individuals
  sortedFitness = sortrows(selected);
  sortedFitness = flipud(sortedFitness);

  for i = 1:size
    r = rand;

    % This is outside of the if statement to ensure that
    % we always return a valid index (defaults to the worst)
    index = sortedFitness(i, 2);

    if r < selectionParamater
      break;
    end
  end

end

