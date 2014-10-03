% Takes a chromosome and a mutation probability and returns a mutated chromosome
function newChromosome = Mutate(chromosome, mutationProbability)

  newChromosome = chromosome;
  chromLength   = length(chromosome);

  for i = 1:chromLength
    r = rand;

    if r < mutationProbability
      r = randi([1 chromLength]);
      newChromosome(i) = chromosome(r);
      newChromosome(r) = chromosome(i);
    end
  end

end

