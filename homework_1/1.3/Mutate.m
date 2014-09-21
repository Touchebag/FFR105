% Takes a chromosome and a mutatino probability and returns a mutated chromosome
function newChromosome = Mutate(chromosome, mutationProbability)

  newChromosome = chromosome;
  chromLength   = length(chromosome);

  for i = 1:chromLength
    r = rand;

    if r < mutationProbability
      newChromosome(i) = 1 - chromosome(i);
    end
  end

end

