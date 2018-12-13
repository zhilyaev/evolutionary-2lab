function Y = f(X)
  n = size(X, 2);
  
  sumcomp = 0;
  prodcomp = 1;
  
  for i = 1:n
      sumcomp = sumcomp + (X(:, i) .^ 2);
      prodcomp = prodcomp .* (cos(X(:, i) / sqrt(i)));
  end
  
  Y = (sumcomp / 4000) - prodcomp + 1;
end

