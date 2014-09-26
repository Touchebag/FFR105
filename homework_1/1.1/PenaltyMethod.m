% Runs gradient descent on the function
result1    = GradientDescent([1 2], 1, 0.0001, 0.000001);
result10   = GradientDescent([1 2], 10, 0.0001, 0.000001);
result100  = GradientDescent([1 2], 100, 0.0001, 0.000001);
result1000 = GradientDescent([1 2], 1000, 0.0001, 0.000001);

% Had serious trouble with tables in MatLab
% I believe this to be an acceptable substitute solution
disp(' ');
disp(' mu  |  x1*  |  x2*');
disp('-----+-------+-------');
disp(sprintf('1    | %.3f | %.3f', result1(1), result1(2)));
disp(sprintf('10   | %.3f | %.3f', result10(1), result10(2)));
disp(sprintf('100  | %.3f | %.3f', result100(1), result100(2)));
disp(sprintf('1000 | %.3f | %.3f', result1000(1), result1000(2)));

