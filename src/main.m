clear, clc

POPULATION_SIZE = 150;
GENERATION_NUM = 60;
P_Cr = 0.6;
P_M = 0.07;
ELITISM_N = floor(POPULATION_SIZE / 20);
N = 2;
LIM = 600;
PLOT = true;

% POPULATION_SIZE = 800;
% GENERATION_NUM = 200;
% P_Cr = 0.6;
% P_M = 0.08;
% ELITISM_N = floor(POPULATION_SIZE / 20);
% N = 3;
% LIM = 600;
% PLOT = false;

% POPULATION_SIZE = 800;
% GENERATION_NUM = 200;
% P_Cr = 0.5;
% P_M = 0.08;
% ELITISM_N = floor(POPULATION_SIZE / 20);
% N = 3;
% LIM = 600;
tic
x = findMax(POPULATION_SIZE, P_Cr, P_M, GENERATION_NUM, ELITISM_N, N, LIM, PLOT);
time = toc;
fprintf('Функция принимает минимальное значение %5.3f в точке ', f(x));
disp(x)
fprintf('Время поиска: %5.4f\n', time);