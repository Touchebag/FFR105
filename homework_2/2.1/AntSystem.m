%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ant system (AS) for TSP.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cityLocation = LoadCityLocations();
numberOfCities = length(cityLocation);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numberOfAnts = 20;  % TODO: Set to appropriate value.
alpha = 1.0;        % TODO: Set to appropriate value.
beta = 5.0;         % TODO: Set to appropriate value.
rho = 0.5;          % TODO: set to appropriate value.

% TODO: Write the GetNearestNeighbourPathLength function
% nearestNeighbourPathLength = GetNearestNeighbourPathLength(cityLocation); % TODO: Write the GetNearestNeighbourPathLength function
% tau0 = numberOfAnts/nearestNeighbourPathLength;

targetPathLength = 123.0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

range = [0 20 0 20];
tspFigure = InitializeTspPlot(cityLocation, range);
connection = InitializeConnections(cityLocation);
pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0); % TODO: Write the InitializePheromoneLevels
visibility = GetVisibility(cityLocation);                         % TODO: write the GetVisibility function

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
  path = GeneratePath(pheromoneLevel, visibility, alpha, beta);   % TODO: Write the GeneratePath function (and any necessary functions called by GeneratePath).
  pathLength = GetPathLength(path,cityLocation);                  % TODO: Write the GetPathLength function
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

 deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection);  % TODO: write the ComputeDeltaPheromoneLevels function
 pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho);          % TODO: write the UpdatePheromoneLevels function

end







