% P,Q为直线段端点，pixs_line为计算出的像素点
function pixs_line = bresenham_line(P,Q)

% 判断斜率 k 是否绝对值小于1
% 如果斜率大于1, X,Y坐标互换
Flag = [0 0 0];
if (Q(2)-P(2))*(Q(1)-P(1)) < 0
    Flag(1) = 1;
    P(2) = -P(2); Q(2) = -Q(2);
end
if abs(Q(2)-P(2)) > abs(Q(1)-P(1))  
    Flag(2) = 1;
    P = [P(2) P(1)];  Q = [Q(2),Q(1)];
end
if P(1) > Q(1)
    Flag(3) = 1;
    t = P; P = Q; Q = t;
end

% 初始化变量
n = abs(Q(1)-P(1)) + 1;  % 绘制的像素点数
pixs_line = zeros(n,2);
pixs_line(1,1:2) = [P(1) P(2)];

% 中点 Bresenham 算法扫描转换
dx = Q(1) - P(1);  dy = Q(2) - P(2);
d = dx - 2*dy;
for i = 2:n
    pixs_line(i,1) = P(1) + i - 1;
    if d < 0
        pixs_line(i,2) = pixs_line(i-1,2) + 1;
        d = d + 2*dx - 2*dy;
    else 
        pixs_line(i,2) = pixs_line(i-1,2);
        d = d - 2*dy;
    end
end

% k 的绝对值大于1时的特殊处理
if Flag(3) == 1
    pixs_line = flipud(pixs_line);
end
if Flag(2) == 1
    pixs_line = fliplr(pixs_line);
end
if Flag(1) == 1;
    pixs_line = [pixs_line(:,1) -1*pixs_line(:,2)];
end

