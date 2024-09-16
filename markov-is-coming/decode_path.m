function [decoded_path] = decode_path (path, lines, cols)
    path(end) = []
	  decoded_path = zeros(length(path), 2)
  for i = 1 : length(path)
    % am calculat coordonatele punctelor din path
    x = fix(path(i)/cols) + 1;
    % daca punctul se afla pe ultima coloana, x va fi decrementat
    if mod(path(i), cols) == 0
      x = x-1;
    endif
    y =  path(i) - (x - 1) * cols;
    decoded_path(i,1) = x
    decoded_path(i,2) = y
  endfor
  endfunction
