function R = selection(P, N)
% реализация оператора репродукции
  P = [(1:size(P, 1))', P]; % нумерация строк :: size(P, 2) = N+2
  P = sprob(P, rand(1) + 1); % вычисление вероятностей  :: size(P, 2) = N+3
  
  P(1, N + 4) = P(1, N + 3); % вычисление границ отрезков  :: size(P, 2) = N+4
  for i = 2:size(P, 1)
      P(i, N + 4) = P(i - 1, N + 4) + P(i, N + 3);
  end
  
  R = [];
  for i = 1:size(P, 1) % выбор особей
      R = [R; P(find(P(:, N+4) > rand(1), 1), :)];
  end
  
  R = R(:, 2:(N+1));
end

