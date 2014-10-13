% Roulette wheel selection
function index = RouletteWheel(weights)

  totalSum = cumsum(weights);
  r = rand * totalSum(end);

  index = find(totalSum > r,1);
end
