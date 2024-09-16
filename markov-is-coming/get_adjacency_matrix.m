function [Adj] = get_adjacency_matrix (Labyrinth)
  [m, n] = size(Labyrinth);
  k = 0;
  % am creat matricea de adiacenta
  Adj = zeros(m*n+2, m*n+2);
  [x, y] = size(Adj)
  % am initializat starile de win si lose cu 1
  Adj(m * n + 1, m * n + 1) = 1;
  Adj(m * n + 2, m * n + 2) = 1;
  for i = 1 : m
    for j = 1 : n
        k = k + 1;
        % am convertit elementul din labirint din baza 10 in baza 2
        nr = dec2bin(Labyrinth(i, j), 4);
        % am separat fiecare bit
        b3 = nr(1);
        b2 = nr(2);
        b1 = nr(3);
        b0 = nr(4);
        % in functie de valoarea bit ului am setat valorile matricei de adiacenta
        % conform cerintei
        % am tratat separat cazul in care ma aflam pe prima sau ultima linie/coloana
        if b3 == '0'
          if i == 1
            Adj(k, m * n + 1) = 1;
          else
            Adj(k, k - n) =1;
            Adj(k - n, k) =1;
          endif
        endif
        if b2 == '0'
          if i == m
            Adj(k, m * n + 1) = 1;
          else
            Adj(k, k + n) =1;
            Adj(k + n, k) =1;
          endif
        endif
        if b1 == '0'
          if j == n
            Adj(k, m * n + 2) = 1;
          else
            Adj(k, k + 1) =1;
            Adj(k + 1, k) =1;
          endif
        endif
        if b0 == '0'
          if j == 1
            Adj(k, m * n + 2) = 1;
          else
            Adj(k, k - 1) =1;
            Adj(k - 1, k) =1;
          endif
        endif
    endfor
  endfor
  % am convertit matricea de adiacenta intr-o matrice rara
  Adj = sparse(Adj);
  endfunction
