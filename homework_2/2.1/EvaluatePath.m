% Calculates the length of a path
function fitness = EvaluatePath(path, cityMatrix)

  fitness = 0.0;
  numberOfCities = length(path);

  for i = 1:(numberOfCities - 1)
    city1 = path(i);
    city2 = path(i + 1);

    xDiff = abs(cityMatrix(city1, 1) - cityMatrix(city2, 1));
    yDiff = abs(cityMatrix(city1, 2) - cityMatrix(city2, 2));
    dist  = sqrt(xDiff^2 + yDiff^2);

    fitness = fitness + dist;
  end

  % For the return path from the last city
  city1 = path(numberOfCities);
  city2 = path(1);

  xDiff = abs(cityMatrix(city1, 1) - cityMatrix(city2, 1));
  yDiff = abs(cityMatrix(city1, 2) - cityMatrix(city2, 2));
  dist  = sqrt(xDiff^2 + yDiff^2);

  fitness = fitness + dist;

end

