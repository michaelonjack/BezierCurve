function difference = BezierError( xTrue,yTrue,xApprox,yApprox )
% BezierError
% The BezierError function receives as input the x and y values of the
% Bezier cruve found from the Bezier function as well as the x and y values
% found from the approxBezier function. The function then finds the
% difference between the sets of points by calculating the average distance 
% between the curves
%
% INPUTS:
%       xApprox - the x-values of the Bezier curve found by the
%       approxBezier function
%       yApprox - the y-values of the Bezier curve found by the
%       approxBezier function
%       xTrue - the x-values of the Bezier curve found by the Bezier
%       function
%       yTrue - the y-values of the Bezier curve found by the Bezier
%       function

% Average distance between the 2 curves initialized to zero
difference = 0; 

% Ratio of the number of points that make up the approximated curve versus
% the number of points that make up the true curve
n = length(xApprox)/length(xTrue);

j=1;
for i=1:n:length(xApprox)
    % Sum the total distance between a multitude of points on each curve
    difference = difference + sqrt( (xApprox(i)-xTrue(j))^2 + (yApprox(i)-yTrue(j))^2 );
    
%%%%%%%%%%%%% OPTIONAL %%%%%%%%%%%%%
%    Uncommenting the code below generates lines connecting  the two curves at sample
%    points. The length of these lines are computed by the distance formula and then averaged
%    to find a rough approximation to the error
%    if mod(i,(n+1)^2) == 0
%        plot([xApprox(i),xTrue(j)],[yApprox(i),yTrue(j)]);
%        hold on;
%    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    j=j+1;
end

% Calculate the average distance between curves
difference = difference/length(xTrue);
% Print result to console
fprintf('AVERAGE DISTANCE BETWEEN CURVES: %d\n',difference);
end
