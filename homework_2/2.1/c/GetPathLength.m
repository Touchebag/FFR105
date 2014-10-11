% Calculates the length of a path
function pathLength = GetPathLength(path, cityMatrix)

  global distanceMatrix;

  pathLength = 0.0;
  numberOfCities = length(path);

  for i = 1:(numberOfCities - 1)
    city1 = path(i);
    city2 = path(i + 1);

    dist = distanceMatrix(city1, city2);

    pathLength = pathLength + dist;
  end

  % For the return path from the last city
  city1 = path(numberOfCities);
  city2 = path(1);

  dist = distanceMatrix(city1, city2);

  pathLength = pathLength + dist;

end

