function Y = MeshGrienwank(X)
  Y = zeros(size(X, 1), size(X, 2));
  for i = 1:size(X, 1)
      for j = 1:size(X, 2)
          Y(i, j) = f(squeeze(X(i, j, :))');
      end
  end      
end

