function fit = polynomFitness(pop, x, y, pointAmount)
    [popSize,stringSize] = size(pop);
    fit = zeros(1,popSize); %preallocation

    for k = 1:popSize
        error = 0;
        for m = 1:pointAmount
            error = error + abs( polyval( pop(k,:), x(m) ) - y(m) );
        end
        fit(1,k) = 0.5 * error;
    end
end