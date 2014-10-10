% Returns the length of a nearest neighbour path
function pathLength = GetNearestNeighbourPathLength(cityLocation)

  global distanceMatrix;

  % Create matrix
  numberOfCities       = size(cityLocation, 1)
  unvisited            = [1:numberOfCities];
  nearestNeighbourPath = zeros(1, numberOfCities);

  % Random start node
  r                       = randi(numberOfCities);
  nearestNeighbourPath(1) = r;
  previousCity            = r;
  unvisited(r)            = [];

  for i = 1:(numberOfCities - 1)
    citiesLeft = length(unvisited);
    shortestDistance = intmax;

    for j = 1:citiesLeft
      currentCity = unvisited(j);

      % Find nearest neighbour
      if distanceMatrix(previousCity,currentCity) < shortestDistance
        nearestNeighbourIndex = j;
        nearestNeighbour = currentCity;
        shortestDistance = distanceMatrix(previousCity, currentCity);
      end
    end

    % Add nearest neighbour to path and remove from unvisisted
    nearestNeighbourPath(i + 1)      = nearestNeighbour;
    unvisited(nearestNeighbourIndex) = [];
    previousCity                     = nearestNeighbour;

  end

  pathLength = GetPathLength(nearestNeighbourPath, cityLocation)

end

