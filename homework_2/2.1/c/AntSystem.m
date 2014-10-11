%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ant system (AS) for TSP.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
% TODO For testing
addpath('../TSPgraphics/');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cityLocation = LoadCityLocations();
numberOfCities = length(cityLocation);

% Pre-calculate distances for speed up
global distanceMatrix;
distanceMatrix = zeros(numberOfCities);
for i = 1:numberOfCities
  for j = 1:numberOfCities
    xDiff = abs(cityLocation(i, 1) - cityLocation(j, 1));
    yDiff = abs(cityLocation(i, 2) - cityLocation(j, 2));
    dist  = sqrt(xDiff^2 + yDiff^2);

    distanceMatrix(i, j) = dist;
  end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numberOfAnts = 20;  % TODO: Set to appropriate value.
alpha = 1.0;        % TODO: Set to appropriate value.
beta = 5.0;         % TODO: Set to appropriate value.
rho = 0.5;          % TODO: set to appropriate value.

nearestNeighbourPathLength = GetNearestNeighbourPathLength(cityLocation);
tau0 = numberOfAnts/nearestNeighbourPathLength;

targetPathLength = 123.0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

range = [0 20 0 20];
tspFigure = InitializeTspPlot(cityLocation, range);
connection = InitializeConnections(cityLocation);
pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0);
visibility = GetVisibility(cityLocation);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
minimumPathLength = inf;

iIteration = 0;

while (minimumPathLength > targetPathLength)
 iIteration = iIteration + 1;

 %%%%%%%%%%%%%%%%%%%%%%%%%%
 % Generate paths:
 %%%%%%%%%%%%%%%%%%%%%%%%%%

 pathCollection = [];
 pathLengthCollection = [];
 for k = 1:numberOfAnts
  path = GeneratePath(pheromoneLevel, visibility, alpha, beta);
  pathLength = GetPathLength(path,cityLocation);
  if (pathLength < minimumPathLength)
    minimumPathLength = pathLength;
    disp(sprintf('Iteration %d, ant %d: path length = %.5f',iIteration,k,minimumPathLength));
    PlotPath(connection,cityLocation,path);
  end
  pathCollection = [pathCollection; path];
  pathLengthCollection = [pathLengthCollection; pathLength];
 end

 %%%%%%%%%%%%%%%%%%%%%%%%%%
 % Update pheromone levels
 %%%%%%%%%%%%%%%%%%%%%%%%%%

 deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection);
 pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho);

end


