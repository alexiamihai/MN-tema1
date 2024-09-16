function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  m = size(X, 1);
  n = size(X, 2);
  % am initializat matricele de train cu 0, in functie de numarul de exemple
  % determinat de procent
  % am calculat numarul de exemple pentru fiecare matrice, folosind functia
  % round pentru a ma asigura ca numarul de date este intreg
  procent1 = round(m * percent);
  procent2 = round(m * (1 - percent));
  X_train = zeros(procent1, n);
  y_train = zeros(procent1, 1);
  X_test = zeros(procent2, n);
  y_test = zeros(procent2, 1);
  % am amestecat matricele initiale
  i = randperm(m);
  X = X(i, :);
  y = y(i, :);
  % am pus in matricele de train si test valorile corespunzatoare din matricele initiale
  for i = 1 : procent1
    X_train(i, :) = X(i, :);
    y_train(i, :) = y(i, :);
  endfor
  for i = 1 : procent2
    X_test(i, :) = X(i + procent1, :);
    y_test(i, :) = y(i + procent1, :);
  endfor
endfunction