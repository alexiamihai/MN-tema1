function [G, c] = get_Jacobi_parameters (Link)
  [m, n]=size(Link);
  % am construit matricea G si vectorul c
  c = sparse(Link(1:m-2, n-1));
  G = sparse(Link(1:m-2, 1:n-2));
  endfunction
