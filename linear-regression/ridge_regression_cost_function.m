function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  m = length(Y);
  % am eliminat primul element din Theta, deoarece este egal cu 0
  Theta = Theta(2 : end);
  n = length(Theta);
  % am calculat vectorul a, care este diferenta dintre produsul
  % dintre matricea FeatureMatrix si vectorul Theta si vectorul Y
  a = FeatureMatrix * Theta - Y;
  % am calculat suma patratelor elementelor vectorului a
  sum1 = 0;
  for i = 1 : m
    sum1 = sum1 + a(i) ^ 2;
  endfor
  % am calculat suma patratelor elementelor vectorului Theta
  sum = 0;
  for i = 1 : n
    sum = sum + Theta(i) ^ 2;
  endfor
  % am calculat functia de cost
  Error = (1 / (2 * m)) * sum1 + lambda * sum;
endfunction