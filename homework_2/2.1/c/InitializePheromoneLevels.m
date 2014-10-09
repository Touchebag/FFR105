% Initialises a matrix with pheromones to a specified value
function pheromoneLevels = InitializePheromoneLevels(numberOfCities, tau0);

  pheromoneLevels = zeros(numberOfCities);

  % NOTE: For simplicity we calculate pheromoneLevels(i,j) and
  % pheromoneLevels(j,i) separately. We just need to make sure that
  % we set both when changing the values elsewhere.
  for i = 1:numberOfCities
    for j = 1:numberOfCities
      pheromoneLevels(i,j) = tau0;
    end
  end

end
