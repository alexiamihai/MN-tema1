function [Y, InitialMatrix] = parse_data_set_file(file_path)
  file = fopen(file_path, 'r');
  % am citit dimensiunile matricei
  m = fscanf(file, '%d', 1);
  n = fscanf(file, '%d', 1);
  % am initializat matricea ca cell
  InitialMatrix = cell(m, n);
  % am citit prima linie din fisier, care nu contine date
  aux = fgetl(file);
  % am citit matricea din fisier linie cu linie
  for i = 1 : m
    line = fgetl(file);
    % am transformat linia citita intr-un cell, delimitand-o dupa spatii
    InitialMatrix(i,1 : n + 1) = strsplit(line, " ");
  endfor
  % am separat vectorul Y de matricea InitialMatrix, acesta fiind prima coloana
  Y = InitialMatrix(:,1);
  % am transformat cellul Y intr-un vector
  Y = cell2mat(Y);
  Y = str2num(Y);
  % am eliminat prima coloana din matricea InitialMatrix
  InitialMatrix = InitialMatrix(:,2:n+1);
  fclose(file);
endfunction