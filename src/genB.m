function b = genB(n)
    u = rand(1);
    if u <= 0.5
        b = (2*u)^(1/(n+1));
    else
        b = (1/(2*(1-u)))^(1/(n+1));
    end
end