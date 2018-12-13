clear, clc
%options = gaoptimset('PopulationType', 'doubleVector', 'PopulationSize', 200, 'SelectionFcn', {@selectiontournament}, 'CrossoverFraction', 0.8, 'CrossoverFcn', {@crossoverarithmetic});
options = gaoptimset('PopulationType', 'doubleVector', 'PopulationSize', 190, 'SelectionFcn', {@selectiontournament}, 'CrossoverFraction', 0.6, 'CrossoverFcn', {@crossoverarithmetic});
tic
[x, fval, flag] = ga(@f, 2, options)
t = toc;
fprintf('Время поиска: %5.4f\n', t)