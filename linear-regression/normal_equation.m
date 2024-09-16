function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  [m n] = size(FeatureMatrix);
  [l k] = size(Y);
  Theta = zeros(n, 1);
  ok = 0;
  % am calculat matricea si vectorul pe care urmeaza sa-i folosesc in aplicarea
  % metodei gradientului conjugat
  PD = FeatureMatrix' * FeatureMatrix;
  R = FeatureMatrix' * Y;
  [m , n] = size(PD);
  % am verificat daca matricea PD este pozitiv definita
  for i = 1 : m
    if det(PD(1 : i, 1 : i)) > 0
      ok = ok + 1;
    endif
  endfor
  % daca matricea nu este pozitiv definita, nu pot aplica metoda gradientului
  % conjugat
  if ok ~= m
    Theta = [0; Theta];
    return;
  else
    % daca matricea este pozitiv definita, aplic metoda gradientului conjugat
    % dar daca aceasta nu are dimensiunile potrivite, nu pot aplica metoda si
    % returnez Theta, vector nul
    if m ~= n
      Theta = [0; Theta];
      return;
    else
      % am aplicat metoda gradientului conjugat
      r = R - PD * Theta;
      v = r;
      tol_squared = tol ^ 2;
      k = 1;
      while k <= iter && r' * r > tol_squared
        t = (r' * r) / (v' * PD * v);
        Theta = Theta + t * v;
        r0 = r;
        r = r0 - t * PD * v;
        s = (r' * r) / (r0' * r0);
        v = r + s * v;
        k = k + 1;
      endwhile
      Theta = [0; Theta];
    endif
  endif
endfunction