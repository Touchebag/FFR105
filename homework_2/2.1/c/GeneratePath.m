% Generates the path for an ant
function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)

  size                        = length(pheromoneLevel);
  currentNode                 = randi(size);
  path                        = zeros(1, size);
  availableNodes              = [1:size];
  availableNodes(currentNode) = [];

  path(1) = currentNode;

  for j = 1:(size - 1)
    numberOfNodes = length(availableNodes);
    probabilities = zeros(numberOfNodes, 1);

    denominator = 0;
    for l = 1:numberOfNodes
      city = availableNodes(l);
      pLevel = pheromoneLevel(city, currentNode) ^ alpha;
      visib = visibility(city, currentNode) ^ beta;

      denominator = denominator + (pLevel * visib);
    end

    for i = 1:numberOfNodes
      city = availableNodes(i);
      pLevel = pheromoneLevel(city, currentNode) ^ alpha;
      visib = visibility(city, currentNode) ^ beta;

      probabilities(i) = (pLevel * visib) / denominator;
    end

    index                 = RouletteWheel(probabilities);
    currentNode           = availableNodes(index);
    availableNodes(index) = [];
    path(j + 1)           = currentNode;
  end

end
