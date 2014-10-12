% Creates a matrix of particles with velocities
function velocities = ...
  InitializeParticleVelocities(numberOfParticles, numberOfVariables, xmin, xmax)

  velocities = zeros(numberOfParticles, numberOfVariables);

  for i = 1:numberOfParticles
    for j = 1:numberOfVariables
      velocities(i,j) = rand * (xmax - xmin) - (xmax - xmin) / 2;
    end
  end

end

