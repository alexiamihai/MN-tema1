function [Y, InitialMatrix] = parse_csv_file(file_path)
  % am incarcat pachetul io pentru a putea folosi functia csv2cell
  pkg load io;
  % am incarcat matricea din fisierul trimis ca parametru
  InitialMatrix = csv2cell(file_path);
  [m n] = size(InitialMatrix);
  % am eliminat prima linie si prima coloana din matrice
  InitialMatrix = InitialMatrix(2:m,:);
  % am retinut prima coloana din matrice in Y
  Y = InitialMatrix(:,1);
  % am transformat Y din cell in matrice
  Y = cell2mat(Y);
  InitialMatrix = InitialMatrix(:,2:n);
endfunction