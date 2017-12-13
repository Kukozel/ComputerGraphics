% 中点Bresenham画圆的算法
% R为半径，pixs_circle为计算出的像素点
function pixs_circle = bresenham_circle(R)

x = 0;
y = R;
d = 1-R;
while x <= y
    pixs_base(x+1,:) = [x,y]; % 第一个点
    if d<0 
        d = d+2*x+3;
    else
        d = d+2*(x-y)+5;
        y = y-1;
    end
    x = x+1;
end

% 完成第一象限的像素点绘制

pixs_circle = [pixs_base;fliplr(pixs_base)];
pixs_circle = [pixs_circle;-1*pixs_circle(:,1) pixs_circle(:,2)];
pixs_circle = [pixs_circle;pixs_circle(:,1) -1*pixs_circle(:,2)];
pixs_circle = unique(pixs_circle,'rows'); 
pixs_circle = sortrows(pixs_circle,1);