function [matrix] = initialize_weights(L_prev, L_next)
  % am calculat epsilon conform formulei din enuntul temei
  epsilon = sqrt(6) / sqrt(L_prev + L_next);
  % am creat o matrice cu elemente aleatoare din intervalul [0, 1]
  matrix = rand(L_next, L_prev + 1);
  % am inmultit elementele matricei cu 2 * epsilon pentru a ma asigura ca ma
  % aflu in intervalul [0, 2 * epsilon] si apoi am scazut epsilon pentru a avea
  % valori in intervalul [-epsilon, epsilon]
  matrix = matrix * 2 * epsilon - epsilon;
endfunction
