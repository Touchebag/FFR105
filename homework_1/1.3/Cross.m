% Takes two chromosomes and crosses them at a random point
function newChromosomes = Cross(chrom1, chrom2)

  length1 = length(chrom1);
  length2 = length(chrom2);

  % Since not otherwise specified I assume we want this to
  % assure no variables gets messed up
  if length1 ~= length2
    error('Chromosomes must have the same length');
  end

  newChromosomes = zeros(2, length1);

  % Select crussover point
  crossover = randi([1 length1])

  for i = 1:length1
    if i < crossover
      newChromosomes(1, i) = chrom1(i);
      newChromosomes(2, i) = chrom2(i);
    else
      newChromosomes(1, i) = chrom2(i);
      newChromosomes(2, i) = chrom1(i);
    end
  end

end

