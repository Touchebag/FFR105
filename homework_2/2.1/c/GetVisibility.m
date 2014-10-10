% Calculates the visibility of the cities
function visibility = GetVisibility(cityMatrix)

  global distanceMatrix;
  visibility = 1 ./ distanceMatrix;

end
