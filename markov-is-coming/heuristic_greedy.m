function [path] = heuristic_greedy(start_position, probabilities, Adj)
  % am implementat functia folosind algoritmul prezentat in cerinta
  n = length(probabilities)-2;
  path(1) = start_position;
  visited = zeros(1, n);
  visited(start_position) = 1;
  while length(path)>0
    position = path(end);
    if Adj(position, n+1) == 1
      path(length(path)+1) = n+1;
      break;
    endif
    ok = 0;
    max = 0;
    neighbour = 0;
    for i = 1 : n
      if Adj(position, i) == 1
        if visited(i) == 0
          ok = ok + 1;
          if probabilities(i) > max
            max = probabilities(i);
            neighbour = i;
          endif
        endif
      endif
    endfor
    if ok == 0
      path(end) = []
    else
    neigh = neighbour;
    visited(neigh) = 1;
    path(length(path)+1) = neigh;
    endif
  endwhile
 path = reshape(path, [], 1);
endfunction