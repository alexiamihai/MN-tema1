function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [m, n] = size(InitialMatrix);
  for i = 1 : m
  % am folosit indicele col pentru a crea FeatureMatrix
  col =1;
    for j = 1 : n
      a = InitialMatrix{i,j};
      % daca elementul din InitialMatrix este deja un numar il copiez in FeatureMatrix
      if isnumeric(a) == 1
        FeatureMatrix(i,col) = a;
      else
        % daca elementul din InitialMatrix este un string, il transform in numar
        nr = str2double(a);
        % daca numarul obtinut este valid il copiez in FeatureMatrix
        if isnan(nr) == 0
          FeatureMatrix(i,col) = nr;
        else
        % altfel, in functie de valoarea string-ului, adaug 1 sau 0 in FeatureMatrix
        % conform cerintei
          if strcmp(a,'yes') == 1
            FeatureMatrix(i,col) = 1;
          endif
          if strcmp(a,'no') == 1
            FeatureMatrix(i,col) = 0;
          endif
          if strcmp(a,'furnished') == 1
            FeatureMatrix(i,col) = 0;
            col = col + 1;
            FeatureMatrix(i,col) = 0;
          endif
          if strcmp(a,'semi-furnished') == 1
            FeatureMatrix(i,col) = 1;
            col = col + 1;
            FeatureMatrix(i,col) = 0;
          endif
          if strcmp(a,'unfurnished') == 1
            FeatureMatrix(i,col) = 0;
            col = col + 1;
            FeatureMatrix(i,col) = 1;
          endif
        endif
      endif
      col = col + 1;
    endfor
  endfor
endfunction