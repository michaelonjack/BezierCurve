% MAIN SCRIPT FILE
% Michael Onjack, mzo5081, MATH451
% Bezier script
%
% INSTRUCTIONS:
%       User enters x and y values into the corresponding vectors
%       below to form ordered pairs. The exact Bezier curve which interpolates
%       these points is then graphed as well as an approximation to the Bezier
%       curve which uses only cubic and quadratic Bezier curves. The
%       difference between these curves is then calculated by finding the
%       average distance between them and is then printed to the command window. 
%       Some examples are give below.

% Points to be plotted 
% USER ENTERS POINTS HERE
x=[];
y=[];
[xTrue,yTrue] = Bezier(x,y);
[xApprox,yApprox] = approxBezier(x,y);
legend('Input','Bezier','Approximated Bezier');
BezierError(xTrue,yTrue,xApprox,yApprox);



%%%%%%%%%%%%%% EXAMPLES %%%%%%%%%%%%%%

% 1.) Quadratic Bezier example (3 points)
% x = [0,3,6];
% y = [0,3,0];
% [xTrue,yTrue] = Bezier(x,y);
% [xApprox,yApprox] = approxBezier(x,y);
% legend('Input','Bezier','Approximated Bezier');
% BezierError(xTrue,yTrue,xApprox,yApprox);

% 2.) Cubic Bezier example (4 points)
% x = [120,35,220,220];
% y = [200,160,40,260];
% [xTrue,yTrue] = Bezier(x,y);
% [xApprox,yApprox] = approxBezier(x,y);
% legend('Input','Bezier','Approximated Bezier');
% BezierError(xTrue,yTrue,xApprox,yApprox);

% 3.) Example with >4 points
% x = [0,1,2,3,4,5,6,7,8,9];
% y = [1,2,2,1,0,0,1,2,2,1];
% [xTrue,yTrue] = Bezier(x,y);
% [xApprox,yApprox] = approxBezier(x,y);
% legend('Input','Bezier','Approximated Bezier');
% BezierError(xTrue,yTrue,xApprox,yApprox);

% 4.) Creating circle with Bezier curves
% x = [0,0,1,2,3,4,4,4,3,2,1,0,0];
% y = [1,2,3,3,3,2,1,0,-1,-1,-1,0,1];
% [xTrue,yTrue] = Bezier(x,y);
% [xApprox,yApprox] = approxBezier(x,y);
% legend('Input','Bezier','Approximated Bezier');
% BezierError(xTrue,yTrue,xApprox,yApprox);
