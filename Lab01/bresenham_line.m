%中点Bresenham画直线的算法
% P,Q为直线段端点，pixs_line为计算出的像素点
function pixs_line = bresenham_line(P,Q)
 
% 规格化直线PQ，使PQ的斜率:0<=k<=1
% 当直线PQ的斜率小于0时,将Flag(1)置1,并将直线沿y轴翻转
% 当直线PQ的斜率绝对值大于1时,将Flag(2)置1,并将直线沿y=x翻转
% 当直线PQ的P点在Q点的右上方时,将Flag(3)置1,并将P点Q点互换
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
n = abs(Q(1)-P(1)) + 1; % 横轴像素点个数
pixs_line = zeros(n,2); % 初始化坐标数组size:n*2
pixs_line(1,1:2) = [P(1) P(2)]; % 数组第一个点为P点
 
% 计算初始值dx,dy,d=dx-2dy
dx = Q(1) - P(1);  dy = Q(2) - P(2);
d = dx - 2*dy;  % 由于我们只要di的符号，我们可以用2di*dx代替di来摆脱小数
for i = 2:n
    pixs_line(i,1) = P(1) + i - 1;
    % 当d<0，取右上方像素点,d的增量为1-k
    if d < 0
        pixs_line(i,2) = pixs_line(i-1,2) + 1;
        d = d + 2*dx - 2*dy;
    else
        % 当d>=0，取正右方像素点,d的增量为-k
        pixs_line(i,2) = pixs_line(i-1,2);
        d = d - 2*dy;
    end
end
 
% 还原原始直线PQ
if Flag(3) == 1
    pixs_line = flipud(pixs_line); % 矩阵上下翻转,相当于交换P点和Q点
end
if Flag(2) == 1
    pixs_line = fliplr(pixs_line); % 矩阵左右翻转,相当于PQ沿y=x翻转
end
if Flag(1) == 1
    pixs_line = [pixs_line(:,1) -1*pixs_line(:,2)]; % 矩阵第一列不变,第二列乘-1,相当于PQ沿y轴翻转
end