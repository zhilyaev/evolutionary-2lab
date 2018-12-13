function x = findMax(POPULATION_SIZE, P_Cr, P_M, GENERATION_NUM, ELITISM_N, N, LIM, DRAW_PLOT)
if nargin == 7 || N > 3
    DRAW_PLOT = false;
end
if DRAW_PLOT == true
    I_600 = (-20:0.2:20);
    [X1_600, X2_600] = meshgrid(I_600, I_600);
    X_600(:, :, 1) = X1_600;
    X_600(:, :, 2) = X2_600;
    Y_600 = MeshGrienwank(X_600);
end
PLOT_RATE = 10;
SBX_n = 2;
DM = 5;
Populations{1} = (LIM + LIM) .* rand(POPULATION_SIZE, N) - LIM; % начальна€ попул€ци€

i = 1;
while i <= GENERATION_NUM
    rel_i = i / GENERATION_NUM;
    if rel_i > 0.9
        SBX_n = 5;
        DM = 5;
        ELITISM_N = floor(POPULATION_SIZE / 5);
    else
        if rel_i > 0.75
            SBX_n = 4;
            DM = 5;
            ELITISM_N = floor(POPULATION_SIZE / 8);
        else
            if rel_i > 0.5
                SBX_n = 3;
                DM = 5;
                ELITISM_N = floor(POPULATION_SIZE / 13);
            end
        end
    end
    Populations{i} = fitness(Populations{i});
    P = selection(Populations{i}, N);
    P = SBXCrossover(P, Populations{i}(1:ELITISM_N, 1:N), P_Cr, SBX_n);
    P = mutation(P, P_M, DM, LIM);
    i = i + 1;
    Populations{i} = P;
    if DRAW_PLOT == true
        if mod(i, PLOT_RATE) == 0 || i == 2
            figure, surf(X1_600, X2_600, Y_600)
            hold on
            plot3(Populations{i}(:, 1), Populations{i}(:, 2), f(Populations{i}), 'or')
            hold off
        end
    end
end

x = mode(Populations{end});
end