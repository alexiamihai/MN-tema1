function [Labyrinth] = parse_labyrinth(file_path)
  file = fopen(file_path, 'r');
  % am citit dimensiunile labirintului
  m = fscanf(file, '%d', 1)
  n = fscanf(file, '%d', 1)
  % am citit matricea labirintului
  for i= 1 : m
    for j = 1 : n
      Labyrinth(i,j) = fscanf(file, '%d', 1);
    endfor
  endfor
  fclose(file);
endfunction