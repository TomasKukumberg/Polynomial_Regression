close all; clc; clear; format longG;
xPrompt = 'Zadajte x suradnicu: ';
yPrompt = 'Zadajte y suradnicu: ';

xPoints = [-2 1 2 6 10];
yPoints = [-28 2 -8 -1108 -9088];

% xPoints = [1,2,3,4,5];
% yPoints = [20, 50, 87, 120, 150];

% xPoints = [1,5,10,12,14];
% yPoints = [-8, 480, 8470, 17966, 33870];

% xPoints = [ -20 -10 0 10 20];
% yPoints = [-167618 -10908 2 -8888 -151578];

% xPoints = [ -0.02 1 4.378 0.001 5.1];
% yPoints = [ 1.9803918 4 -257.91194 2.001001 -510.7591];

%nasledujuce hodnoty robia problemy, hlasi aj polyfit
%xPoints = [-20,-10,74,100,300];
%yPoints = [-15,230,-120,90,150];%nejde

pointAmount = size(xPoints, 2);
stringSize = pointAmount;
amp = ones(1, stringSize);
popSize = 100;
low = -40; 
up = 40;
lowerLimit = ones(1, stringSize) * low;
upperLimit = ones(1, stringSize) * up;
space = [lowerLimit; upperLimit];
population = genrpop(popSize, space); %matica reprezentujuca koeficienty polynomu

iterSize = 5000;
graphFit = zeros(1,iterSize); %preallocation

%FITNESS, MUTX, CROSS, SELECTION
for k = 1:iterSize
     fitRes = polynomFitness(population, xPoints, yPoints, pointAmount);
     graphFit(1,k) = min(fitRes);
     topOnes = selbest(population, fitRes, 5 );
     others = seltourn(population, fitRes, 95);
     others = crossov(others, 4, 1);
     others = mutx(others, 0.05, space);
     others = muta(others, 0.05, amp, space);
     population = [topOnes; others ];
end

polyFound = selbest(population, fitRes, 1);
yFound = polyval(polyFound, xPoints)

figure(1); 
plot(1:iterSize, graphFit);
xlabel('iterations');
ylabel('error-size');

graphResult(polyFound, xPoints,yPoints);
