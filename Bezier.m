function [xOut,yOut] = Bezier( x,y )
% Bezier
% The Bezier function receives as input a set of points and then computes
% the Bezier curve which interpolates these points
%
% INPUTS:
%   x - x values of points to be interpolated
%   y - y values of points to be interpolated

% Plot the points given by the user
plot(x,y,'r')
hold on;

numPoints = length(x); % Number of coordinates the user has entered
n = numPoints-1; % Degree of the Bezier polynomial

i=0;
j=1;
for t=0:.001:1
    % Initialize the current element to zero
    xOut(j) = 0;
    yOut(j) = 0;
    
    % Calculate the value of Bezier polynomial for different values of t
    while i<=n
        xWeight = x(i+1);
        yWeight = y(i+1);
        binomialTerm = factorial(n)/(factorial(i)*(factorial(n-i)));
        polynomialTerm = ((1-t)^(n-i))*(t^i);
        xOut(j) = xOut(j) + (binomialTerm * polynomialTerm * xWeight);
        yOut(j) = yOut(j) + (binomialTerm * polynomialTerm * yWeight);
        i=i+1;
    end
    i=0; % Reset i for next iteration
    j=j+1; % Move to next element in x and y vectors for next iteration    
        
end

plot(xOut,yOut,'c','LineWidth',1.75) % Plot the Bezier path
hold on;
end
