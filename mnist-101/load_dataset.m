function [X, y] = load_dataset(path)
  % am incarcat matricea din fisierul trimis ca parametru
  data = load(path);
  % am separat datele in X si y
  X = data.X;
  y = data.y;
endfunction
