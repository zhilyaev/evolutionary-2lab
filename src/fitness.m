function R = fitness(P)
  R = [P, f(P)];
  R = sortrows(R, size(R, 2)); % ���������� �� ����������� �������� �������
end