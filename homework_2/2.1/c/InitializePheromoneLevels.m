% Initialises a matrix with pheromones to a specified value
function pheromoneLevels = InitializePheromoneLevels(numberOfCities, tau0);

  pheromoneLevels = zeros(numberOfCities);

  for i = 1:numberOfCities
    for j = 1:numberOfCities
      pheromoneLevels(i,j) = tau0;
    end
  end

end
