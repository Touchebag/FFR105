% Creates a matrix of particles with positions
function particles =
  InitializeParticleParticles(numberOfParticles, numberOfVariables, xmin, xmax)

  particles = zeros(numberOfParticles, numberOfVariables);

  for i = 1:numberOfParticles
    for j = 1:numberOfVariables
      positions(i,j) = xmin + rand * (xmax - xmin);
    end
  end

end

