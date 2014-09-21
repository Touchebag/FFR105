% Robin Touche  900610-3270  robint@student.chalmers.se

% Takes a polynomial and a vector of iteratino values and plots them
function Plotiterations(polynomial, values)

  hold on;

  poly = fliplr(polynomial);
  % 100 data points accuracy for plotting
  points = linspace(min(values) - 2, max(values) + 2, 100);

  % Plot function
  plot(points, Polynomial(points, poly));
  % Plot NR iteration values
  scatter(values, Polynomial(values, poly));

  hold off;

