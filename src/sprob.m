function R = sprob(P, a)
% ������ ������������ ������ ������
  b = 2 - a;
  R = [P, (a - (a-b) .* ((P(:, 1) - 1) ./ (size(P, 1) - 1))) ./ size(P, 1)];
end