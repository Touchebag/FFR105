% Returns an initial population
function population = ...
  InitializePopulation(populationSize, minChromLength, maxChromLength, ...
                       numberOfVRegisters, numberOfCRegisters)

  population = [];
  totalRegisters = numberOfCRegisters + numberOfVRegisters;

  for i = 1:populationSize
    chromLength = randi(minChromLength, maxChromLength);

    for j = 1:chromLength
      index = (j - 1) * 4 + 1;

      % Operation
      tmpChrom(index) = randi(4);
      % Destination register
      tmpChrom(index + 1) = randi(numberOfVRegisters);
      % Source registers
      tmpChrom(index + 2) = randi(totalRegisters);
      tmpChrom(index + 3) = randi(totalRegisters);
    end

    tmpIndividual = struct('Chromosome', tmpChrom);
    population = [population tmpIndividual];

  end
end
