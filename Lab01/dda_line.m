%DDA画直线的算法
% P,Q为直线段端点，pixs_line为计算出的像素点
function pixs_line = dda_line(P,Q)

dx = Q(1)-P(1);
dy = Q(2)-P(2);

x = P(1);
y = P(2);

if abs(dx) > abs(dy)
    epls = abs(dx);
else
    epls = abs(dy);
end

xIncre = dx/epls;
yIncre = dy/epls;

n = epls + 1; 
pixs_line = zeros(n,2); 
pixs_line(1,1:2) = [P(1) P(2)];

for i = 2:n
    x = x+xIncre;
    y = y+yIncre;
    pixs_line(i,:) = [floor(x+0.5) floor(y+0.5)];
end