function [ xOut,yOut ] = QuadraticBezier( x,y )
% QuadraticBezier 
% The QuadraticBezier function implements the quadratic bezier equation which creates
% the Bezier path when given 3 sample points
%
%  INPUTS:
%       x - vector of the 3 x coordinates to fit the Bezier curve to
%       y - vector of the 3 y coordinates to the the Bezier curve to
%
% QuadraticBezier returns x and y vectors containing the points to plot to
% form the Bezier cruve

i=1;
% Find the value of the Bezier polynomial for multiple values of t
for t=0:.001:1
    
    % Matrix containing the variable of the Bezier polynomial
    T = [1,t,t^2];
    % Coefficients of the variables in the Bezier polynomial
    A = [1,0,0;
        -2,2,0;
        1,-2,1];
    
    X = [x(1);x(2);x(3)];
    xOut(i) = T*A*X;
    
    Y = [y(1);y(2);y(3)];
    yOut(i) = T*A*Y;
    
    i = i+1;
end

end
