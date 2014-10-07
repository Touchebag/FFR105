% Takes a chromosome and a mutation probability and returns a mutated chromosome
function newChromosome = Mutate(chromosome, mutationProbability)

  chromLength   = length(chromosome);

  for i = 1:chromLength
    r = rand;

    %TODO allow swapping with iteslf?
    if r < mutationProbability
      r = randi(chromLength);
      chromosome([i r]) = chromosome([r i]);
    end
  end

  newChromosome = chromosome;

end

