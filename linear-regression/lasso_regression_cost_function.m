function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  m = length(Y);
  % am eliminat primul element din Theta, deoarece este egal cu 0
  Theta = Theta(2 : end);
  n = length(Theta);
  % am calculat vectorul a, care este diferenta dintre vectorul Y si produsul
  % dintre matricea FeatureMatrix si vectorul Theta
  a = Y - FeatureMatrix * Theta;
  % am calculat suma patratelor elementelor vectorului a
  sum1 = 0;
  for i = 1 : m
    sum1 = sum1 + a(i) ^ 2;
  endfor
  % am calculat norma coeficientilor modelului, obtinuta prin suma normelor
  % fiecarui coeficient
  sum = 0;
  for i = 1 : n
    sum = sum + norm(Theta(i));
  endfor
  % am calculat functia de cost
  Error = (1 / m) * sum1 + lambda * sum;
endfunction