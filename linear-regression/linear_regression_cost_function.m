function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
[m, n] = size(FeatureMatrix);
sum = 0;
% am aplicat formula din cerinta
for i = 1 : m
  h = 0;
  for j = 1 : n
    h = h + FeatureMatrix(i, j) * Theta(j + 1);
  endfor
  % am calculat eroarea pentru fiecare element din FeatureMatrix
  error = h - Y(i);
  error = error ^ 2;
  % am calculat suma erorilor
  sum = sum + error;
endfor
% am calculat functia de cost
Error = (1 / (2 * m)) *sum;
endfunction