% Generates a matrix of a populations with randomized binary chromosomes
function population = NearestNeighbour(populationSize, numberOfGenes, distanceMatrix)

  % Create matrix
  population           = zeros(populationSize, numberOfGenes);
  unvisited            = [1:numberOfGenes];
  nearestNeighbourPath = zeros(1, populationSize);

  % Random start node
  r                       = randi(numberOfGenes);
  nearestNeighbourPath(1) = r;
  previousCity            = r;
  unvisited(r)            = [];

  for i = 1:(numberOfGenes - 1)
    citiesLeft = length(unvisited);
    shortestDistance = intmax;

    for j = 1:citiesLeft
      currentCity = unvisited(j);

      if distanceMatrix(previousCity,currentCity) < shortestDistance
        nearestNeighbourIndex = j;
        nearestNeighbour = currentCity;
        shortestDistance = distanceMatrix(previousCity, currentCity);
      end
    end

    nearestNeighbourPath(i + 1)      = nearestNeighbour;
    unvisited(nearestNeighbourIndex) = [];
    previousCity                     = nearestNeighbour;

  end

  for i = 1:populationSize
      population(i,:) = nearestNeighbourPath(i);
  end

end

