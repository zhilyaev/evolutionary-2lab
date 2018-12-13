function R = SBXCrossover(P, ELITE, P_Cr, n)
  if n < 2 || n > 5
      error('SBXCrossover: ''n'' argument must be in [2; 5] interval!');
  end
  R = ELITE;
  while size(R, 1) < size(P, 1)
      % выбор родителей
      p1 = P(floor(rand(1)*(size(P, 1) - 1) + 1), :);
      p2 = P(floor(rand(1)*(size(P, 1) - 1) + 1), :);
      % коэффициенты beta
      b1 = genB(n);
      b2 = genB(n);
      % потомки
      H1 = 0.5 .* floor((1-b1) .* p1 + (1+b1) .* p2);
      H2 = 0.5 .* floor((1+b2) .* p1 + (1-b2) .* p2);
      % расчет значений целевой функции дл€ потомков и определение лучшего потомка
      f_H1 = f(H1);
      f_H2 = f(H2);
      if f_H1 < f_H2
          bestH = H1;
          worstH = H2;
      else
          bestH = H2;
          worstH = H1;
      end
      % определение, сколько потомков попадет в попул€цию
      if rand(1) < P_Cr
          if rand(1) < P_Cr
              h_n = 2;
          else
              h_n = 1;
          end
      else
          if rand(1) < P_Cr
              h_n = 1;
          else
              h_n = 0;
          end
      end
      % перенос потомков в попул€цию
      if h_n == 2
          R = [R; bestH; worstH];
      else
          if h_n == 1
              R = [R; bestH];
          end
      end
  end
end

