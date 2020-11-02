function [] = graphResult(polyFound, xPoints,yPoints)
%function to graph points and found polynom
    
    figure(2);
    plot(xPoints, yPoints, '*r'); %graph points
    hold on;
    
    xMin = min(xPoints);
    xMax = max(xPoints);
    xFinal = xMin:0.1:xMax;
    yFinal = polyval(polyFound, xFinal);
    plot(xFinal, yFinal,'blue');
    legend('body','funkcia','Location','northwest');
end

