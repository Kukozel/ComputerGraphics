% build random lines with array : n*4, [x(1) y(1) x(2) y(2)]
% n is the number of lines
% Xrange(Yrange) is the range of xlabel(ylabel), default is [0,1]
function lines = random_lines(n,Xrange,Yrange)

if (nargin < 2) || isempty(Xrange)
    Xrange = [0,1]; Yrange = [0,1];
end

X = rand(n,2)*(Xrange(2)-Xrange(1)) + Xrange(1);
Y = rand(n,2)*(Yrange(2)-Yrange(1)) + Yrange(1);
lines = [X(:,1) Y(:,1) X(:,2) Y(:,2)];

end