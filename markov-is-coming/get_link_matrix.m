function [Link] = get_adjacency_matrix (Labyrinth)
  [m, n] = size(Labyrinth);
  k = 0;
  % am creat matricea de legaturi
  Link = zeros(m*n+2, m*n+2);
  % am initializat starile de win si lose cu 1
  Link(m * n + 1, m * n + 1) = 1;
  Link(m * n + 2, m * n + 2) = 1;
  for i = 1 : m
    for j = 1 : n
        k = k + 1;
        % am convertit elementul din labirint din baza 10 in baza 2
        nr= dec2bin(Labyrinth(i,j),4);
        % am separat fiecare bit
        b3 = nr(1);
        b2 = nr(2);
        b1 = nr(3);
        b0 = nr(4);
        % am calculat
        s = str2num(b3)+ str2num(b2)+ str2num(b1)+ str2num(b0);
        s = 4-s;
        % am tratat separat cazul in care suma era 0
        if s > 0
          s = 1/s;
        endif
        % in functie de valoarea bit ului am setat valorile matricei de legaturi
        % conform cerintei
        % am tratat separat cazul in care ma aflam pe prima sau ultima linie/coloana
        if b3 == '0'
          if i == 1
            Link(k, m*n+1) = s;
          else
            Link(k, k-n) =s;
          endif
        endif
        if b2 == '0'
          if i == m
            Link(k, m*n+1) = s;
          else
            Link(k, k+n) =s;
          endif
        endif
        if b1 == '0'
          if j == n
            Link(k, m*n+2) = s;
          else
            Link(k, k+1) =s;
          endif
        endif
        if b0 == '0'
          if j == 1
            Link(k, m*n+2) = s;
          else
            Link(k, k-1) =s;
          endif
        endif
    endfor
  endfor
  % am convertit matricea de legaturi intr-o matrice rara
  Link = sparse(Link);
  endfunction
