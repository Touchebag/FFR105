% Selects an individual using tournament selection
function index = TournamentSelection(population, selectionParamater, size)

  popSize         = length(population);
  tempPopulation  = population;
  selected        = [];
  originalIndexes = [];

  % Randomly select individuals
  for i = 1:size
    r = randi([1 popSize]);

    % Save index
    originalIndexes = [originalIndexes r];
    selected        = [selected population(r)];
  end

  % Sort fitness values but keep track of positions
  [sortedFitness sortedIndexes] = sort(selected, 'descend')

  % Select worst individual as default
  temp  = sortedIndexes(size);
  index = originalIndexes(temp);

  for i = 1:size
    r = rand;

    if r < selectionParamater
      temp  = originalIndexes(i);
      index = originalIndexes(temp);
    end
  end

end

