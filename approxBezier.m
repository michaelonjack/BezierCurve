function [xApprox,yApprox] = approxBezier(x,y)
% approxBezier
% The approxBezier function pieces together 3rd and 2nd order Bezier curves when
% interpolating a data set that consists of many points as a means of
% approximation. Although not as accurate, this method can save computation
% time for a very large data set.
%
% INPUTS:
%   x - x-values of points to be interpolated
%   y - y-values of points to be interpolated

xApprox = []; % All x coordinates of the approximated curve
yApprox = []; % All y coordinates of the approximated curve
numPoints = length(x); % Number of points given by user

% CASE 1: Less than 3 data points are given
% If there are only one or two points, simply plot the line or point
if numPoints < 3
    xApprox = [xApprox,x];
    yApprox = [yApprox,y];
    plot(x,y,'g','LineWidth',1.75) 

% CASE 2: 3 data points are given
% If there are only three points, use the QuadraticBezier function to plot the path
elseif numPoints < 4
    [xOut,yOut] = QuadraticBezier(x,y);
    xApprox = [xApprox,xOut];
    yApprox = [yApprox,yOut];
    plot(xOut,yOut,'g','LineWidth',1.75)

% CASE 3: More than 3 data points given
% If there are more than three points, use the cubic and quadratic (if necessary)
% Bezier functions and piece them together to create a single path
else
    i=1;
    while i<numPoints
        
        % CASE 3.1: At least 4 points remain that need to be interpolated
        % If there are at least 4 points remaining, use Cubic Bezier function
        if i+3 <= numPoints
            
            % In order to avoid sharp corners at points which connect
            % adjacent Bezier curves, an intermediate point must be made.
            % Sharp corners will occur if the points preceeding and
            % proceeding the connecting point have the same sign which
            % differs from the connecting point's sign
            if (i+3~=numPoints) && (((x(i+2)<x(i+3)) && (x(i+4)<x(i+3))) || ((x(i+2)>x(i+3)) && (x(i+4)>x(i+3))) || ((y(i+2)<y(i+3)) && (y(i+4)<y(i+3))) || ((y(i+2)>y(i+3)) && (y(i+4)>y(i+3))))
                newX = (x(i+2)+x(i+3))/2; % x coordinate of intermediate point
                newY = (y(i+2)+y(i+3))/2; % y coordinate of intermediate point
                x = [x(1:i+2),newX,x(i+3:end)];
                y = [y(1:i+2),newY,y(i+3:end)];
                numPoints = numPoints + 1;
            end
            
            % Use the current 4 points to construct the Bezier path
            xIn = [x(i),x(i+1),x(i+2),x(i+3)];
            yIn = [y(i),y(i+1),y(i+2),y(i+3)];
            [xOut,yOut] = CubicBezier(xIn,yIn);
            xApprox = [xApprox,xOut];
            yApprox = [yApprox,yOut];
            plot(xOut,yOut,'g','LineWidth',1.75)
            hold on;
        
        % CASE 3.2: At least 3 points remain that need to be interpolated
        % If there at least 3 points remaining, use the Quadratic Bezier function
        elseif i+2 <= numPoints
            xIn = [x(i),x(i+1),x(i+2)];
            yIn = [y(i),y(i+1),y(i+2)];
            [xOut,yOut] = QuadraticBezier(xIn,yIn);
            xApprox = [xApprox,xOut];
            yApprox = [yApprox,yOut];
            plot(xOut,yOut,'g','LineWidth',1.75);
            hold on;
            
        % CASE 3.3: Less than 3 points remain that need to be interpolated
        % If there are less than 3 points remaining, create an intermediate
        % point between the last points and use the QuadraticBezier function
        else
            newX = (x(i)+x(i+1))/2; % x coordinate of intermediate point
            newY = (y(i)+y(i+1))/2; % y coordinate of intermediate point
            xIn = [x(i),newX,x(i+1)]; % Add the new x between the last 2 points
            yIn = [y(i),newY,y(i+1)]; % Add the new y between the last 2 points
            
            [xOut,yOut] = QuadraticBezier(xIn,yIn);
            xApprox = [xApprox,xOut];
            yApprox = [yApprox,yOut];
            plot(xOut,yOut,'g','LineWidth',1.75);
            hold on;
        end
        
        i=i+3;
    end
end

end
