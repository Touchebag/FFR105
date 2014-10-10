% Roulette wheel selection
function index = RouletteWheel(weights)

  totalSum = cumsum(weights);
  r = rand * totalSum(end);

  for i = 1:length(weights)
    if (r < totalSum(i))
      index = i;
      break;
    end
  end

end
