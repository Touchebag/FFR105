% Takes two chromosomes and crosses them at a random point
function newChromosomes = Cross(chromosome1, chromosome2)

  chrom1 = chromosome1.Chromosome;
  chrom2 = chromosome2.Chromosome;
  length1 = length(chrom1) / 4;
  length2 = length(chrom2) / 4;

  % Select crossover point
  crossover1(1) = randi([1 length1 + 1]);
  crossover1(2) = randi([crossover1(1) length1 + 1]);
  crossover2(1) = randi([1 length2 + 1]);
  crossover2(2) = randi([crossover2(1) length2 + 1]);

  % Just to declare the variables
  tmpChrom1 = struct('f1', [], 'f2', [], 'f3', []);
  tmpChrom2 = struct('f1', [], 'f2', [], 'f3', []);

  % Split chromosome 1
  for i = 1:length1
    tmp = (i - 1) * 4 + 1;
    if i < crossover1(1)
      tmpChrom1.f1 = [tmpChrom1.f1 chrom1(tmp:tmp + 3)];
    elseif i < crossover1(2)
      tmpChrom1.f2 = [tmpChrom1.f2 chrom1(tmp:tmp + 3)];
    else
      tmpChrom1.f3 = [tmpChrom1.f3 chrom1(tmp:tmp + 3)];
    end
  end


  % Split chromosome 2
  for i = 1:length2
    tmp = (i - 1) * 4 + 1;
    if i < crossover2(1)
      tmpChrom2.f1 = [tmpChrom2.f1 chrom2(tmp:tmp + 3)];
    elseif i < crossover2(2)
      tmpChrom2.f2 = [tmpChrom2.f2 chrom2(tmp:tmp + 3)];
    else
      tmpChrom2.f3 = [tmpChrom2.f3 chrom2(tmp:tmp + 3)];
    end
  end

  % Recombine chromosomes
  outChrom1 = [tmpChrom1.f1 tmpChrom2.f2 tmpChrom1.f3];
  outChrom2 = [tmpChrom2.f1 tmpChrom1.f2 tmpChrom2.f3];

  newChromosomes = ...
    [struct('Chromosome', outChrom1) struct('Chromosome', outChrom2)];

end

