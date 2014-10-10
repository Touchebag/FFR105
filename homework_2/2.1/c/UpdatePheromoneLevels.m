% Calculates the pheromone levels for the next generation
function newPheromoneLevels = UpdatePheromoneLevels(pheromoneLevel, deltaPheromoneLevel, rho);

  size = length(pheromoneLevel);
  evaporationMatrix = zeros(size,size);

  for i = 1:size
    for j = 1:size
      evaporationMatrix(i,j) = (1 - rho) * pheromoneLevel(i,j);
    end
  end

  newPheromoneLevels = evaporationMatrix + deltaPheromoneLevel;

end
