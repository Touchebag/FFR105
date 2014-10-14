% Takes a chromosome and a mutatino probability and returns a mutated chromosome
function newChromosome = ...
  Mutate(chromosome, mutationProbability, numberOfVRegisters, numberOfCRegisters)

  newChromosome = chromosome.Chromosome;
  chromLength   = length(newChromosome);

  for i = 1:chromLength
    r = rand;

    if r < mutationProbability

      % Operands range from 1 to 4
      if mod(i, 4) == 1
        newChromosome(i) = randi(4);
      % Randomize output register
      elseif mod(i, 4) == 2
        newChromosome(i) = randi(numberOfVRegisters);
      % Randomize input registers
      else
        newChromosome(i) = randi(numberOfVRegisters + numberOfCRegisters);
      end

    end
  end

  newChromosome = struct('Chromosome', newChromosome);

end

