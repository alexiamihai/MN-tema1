function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
  err = 0;
  steps = 1;
  [m n] = size(G);
  % am calculat x cat timp nu am depasit numarul de pasi din cerinta
  while steps <= max_steps
    x = G*x0+c;
    % am calculat eroarea, iar daca aceasta depasea toleranta, am iesit din while
    if norm(x - x0) < tol
      err = norm(x-x0);
	    break;
    endif
    x0=x;
    steps=steps+1;
  endwhile
  endfunction
