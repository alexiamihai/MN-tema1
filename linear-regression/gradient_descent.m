function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % am initializat Theta cu zerouri, aceasta fiind aproximarea initiala
  Theta = zeros(n, 1);
  % am aplicat formula de gradient descent, pentru numarul dat de iteratii
  for i = 1 : iter
    sum = FeatureMatrix * Theta- Y;
    % am transpus matricea FeatureMatrix, pentru a inversa dimensiunile acesteia
    % si a o putea inmulti cu sum
    x = (1/m) * (FeatureMatrix' * sum);
    Theta = Theta - alpha * x;
  endfor
  % am adaugat un 0, la inceputul vectorului Theta, acesta fiind Theta0, pe care
  % nu il modificam
  Theta = Theta';
  Theta = [0 Theta];
  Theta = Theta';
endfunction