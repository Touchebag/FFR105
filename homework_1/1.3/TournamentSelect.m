% Selects an individual using tournament selection
function index = TournamentSelect(fitness, selectionParamater, size)

  popSize         = length(fitness);
  selected        = [];

  % Randomly select individuals
  for i = 1:size
    r = randi([1 popSize]);

    % Save induvidual and index
    temp     = [fitness(r) r];
    selected = [selected; temp];
  end

  % Sort selected individuals
  sortedFitness = sortrows(selected);
  sortedFitness = flipud(sortedFitness);

  % Default to worst individual
  index = sortedFitness(size, 2);

  for i = 1:size
    r = rand;

    if r < selectionParamater
      index = sortedFitness(i, 2);
      break;
    end
  end

end

