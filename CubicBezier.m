function [ xOut,yOut ] = CubicBezier( x,y )
% CubicBezier 
% The CubicBezier function calculates the cubic bezier equation which creates
% the Bezier path when given 4 sample points
%
%  INPUTS:
%       x - vector of the 4 x coordinates to fit the Bezier curve to
%       y - vector of the 4 y coordinates to the the Bezier curve to
%
% CubicBezier returns x and y vectors containing the points to plot to
% form the Bezier cruve

i=1;
% Find the value of the Bezier polynomial for multiple values of t
for t=0:.001:1
    
    % Matrix containing the variables of the Bezier polynomial
    T = [1,t,t^2,t^3];
    % Coefficients of the variables in the Bezier polynomial
    A = [1,0,0,0;
        -3,3,0,0;
        3,-6,3,0;
        -1,3,-3,1];
    
    X = [x(1);x(2);x(3);x(4)];
    xOut(i) = T*A*X;
    
    Y = [y(1);y(2);y(3);y(4)];
    yOut(i) = T*A*Y;
    i = i+1;
end

end
