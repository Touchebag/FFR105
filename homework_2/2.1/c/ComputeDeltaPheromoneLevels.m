% Calculates the amount of pheromones to be dispersed
function pheromoneDeltaMatrix = ComputeDeltaPheromoneLevels(pathCollection, pathLengthCollection)

  numberOfAnts         = length(pathCollection);
  numberOfCities       = size(pathCollection,2);
  pheromoneDeltaMatrix = zeros(50 ,50);

  for i = 1:numberOfAnts
    pheromoneAmount = 1 / pathLengthCollection(i);

    for j = 1:numberOfCities - 1
      city1 = pathCollection(j);
      city2 = pathCollection(j + 1);

      pheromoneDeltaMatrix(j, j + 1) = ...
        pheromoneDeltaMatrix(j, j + 1) + pheromoneAmount;
    end

    % Return trip
    city1 = pathCollection(numberOfCities);
    city2 = pathCollection(1);

    pheromoneDeltaMatrix(numberOfCities, 1) = ...
      pheromoneDeltaMatrix(numberOfCities, 1) + pheromoneAmount;

  end

end

