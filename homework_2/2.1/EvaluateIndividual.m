% Calculates the length of a path
function fitness = EvaluatePath(path, cityMatrix)

  fitness = 0.0;
  numberOfCities = length(path);

  for i = 1:(numberOfCities - 1)

    xDiff = abs(cityMatrix(i, 1) - cityMatrix(i + 1, 1));
    yDiff = abs(cityMatrix(i, 2) - cityMatrix(i + 1, 2));
    dist  = sqrt(xDiff^2 + yDiff^2);

    fitness = fitness + dist;
  end

  % For the return path from the last city
  xDiff = abs(cityMatrix(numberOfCities, 1) - cityMatrix(1, 1));
  yDiff = abs(cityMatrix(numberOfCities, 2) - cityMatrix(1, 2));
  dist  = sqrt(xDiff^2 + yDiff^2);

  fitness = fitness + dist;

end
