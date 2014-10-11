% Calculates the amount of pheromones to be dispersed
function pheromoneDeltaMatrix = ComputeDeltaPheromoneLevels(pathCollection, pathLengthCollection)

  numberOfAnts         = size(pathCollection,1);
  numberOfCities       = size(pathCollection,2);
  pheromoneDeltaMatrix = zeros(numberOfCities);

  for i = 1:numberOfAnts
    pheromoneAmount = 1 / pathLengthCollection(i);

    for j = 1:numberOfCities - 1
      city1 = pathCollection(i, j);
      city2 = pathCollection(i, j + 1);

      pheromoneDeltaMatrix(city1, city2) = ...
        pheromoneDeltaMatrix(city1, city2) + pheromoneAmount;
    end

    % Return trip
    city1 = pathCollection(i, numberOfCities);
    city2 = pathCollection(i, 1);

    pheromoneDeltaMatrix(city1, city2) = ...
      pheromoneDeltaMatrix(city1, city2) + pheromoneAmount;

  end

end

