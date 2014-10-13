% Uses PSO to find the minimum of a function

  % Parameters
  numberOfParticles  = 20;
  numberOfVariables  = 2;
  xmax               = 10;
  xmin               = -10;
  vmax               = xmax - xmin;
  inertia            = 1.4;
  beta               = 0.998;
  numberOfIterations = 10000;

  % Initialise particles
  swarmPositions  = ...
    InitializeParticlePositions (numberOfParticles, numberOfVariables, xmin, xmax);
  swarmVelocities = ...
    InitializeParticleVelocities(numberOfParticles, numberOfVariables, xmin, xmax);

  globalBest   = intmax;
  particleBest = ones(numberOfParticles, 1) .* intmax;
  particleBestPosition = zeros(numberOfParticles, numberOfVariables);

  for k = 1:numberOfIterations
    % Calcualate values and update best
    for i = 1:numberOfParticles
      particle = swarmPositions(i,:);

      value = EvaluateParticle(particle);

      % Update particle best
      if value < particleBest(i)
        particleBest(i) = value;
        particleBestPosition(i,:) = particle;
      end

      % Update global best
      if value < globalBest
        globalBest   = value;
        bestPosition = particle;
      end

    end

    % Calculate new velocities
    for i = 1:numberOfParticles
      for j = 1:numberOfVariables
        swarmVelocities(i,j) = inertia * swarmVelocities(i,j) + ...
          2 * rand * (particleBestPosition(i,j) - swarmPositions(i,j)) + ...
          2 * rand * (bestPosition(j)           - swarmPositions(i,j));

        % Restrict velocity
        swarmVelocities(i,j) = max(min(vmax, swarmVelocities(i,j)), -vmax);

        % Update position
        swarmPositions(i,j) = swarmPositions(i,j) + swarmVelocities(i,j);
      end
    end

    inertia = inertia * beta;
  end

  fprintf('Best value found: f(%f, %f) = %f \n', ...
    bestPosition(1), bestPosition(2), globalBest);

