clear all;

% 多边形窗口及待剪裁的直线段
Polygon1 = [0 2; 1 1; 1 -1; -1 -1; -1 1; 0 2];
Line1 = [-1.5 0.2; 0.5 -3];
N_edge = size(Polygon1,1)-1;

% 计算各边的内法向量
for i = 1:N_edge
    N_pg(i,1:2) = [Polygon1(i,2)-Polygon1(i+1,2), Polygon1(i+1,1)-Polygon1(i,1)];
end

% 参数化并剪裁
tl = 0;  % 设置下限组(t的最小值)初始值
tu = 1;  % 设置上限组(t的最大值)初始值
for i = 1:N_edge
    dn = N_pg(i,1)*(Line1(2,1)-Line1(1,1)) + N_pg(i,2)*(Line1(2,2)-Line1(1,2));  % N*(P2-P1)
    nw = N_pg(i,1)*(Line1(1,1)-Polygon1(i,1)) + N_pg(i,2)*(Line1(1,2)-Polygon1(i,2))  % N*(P1-Ai)
    if abs(dn) < 10^(-6)   % 特殊情况：dn = 0 的处理
        if nw < 0
            tl = 1; tu = 0;  % 设置为不可能有交点情形
            break;
        else
            continue;
        end
    else
        t = - nw / dn;
        if dn < 0
            if t > tl
                tl = t;
            end
        else
            if t < tu
                tu = t;
            end
        end        
    end
end
if tl > tu
    disp('无交点存在！');
    figure;hold on;
    plot(Polygon1(:,1),Polygon1(:,2),'b-','LineWidth',2);
    plot(Line1(:,1),Line1(:,2),'r-','LineWidth',2);
    hold off; axis equal;
    return;
end

% 计算剪裁后直线两端点坐标
tx1 = tl*(Line1(2,1)-Line1(1,1)) + Line1(1,1);
ty1 = tl*(Line1(2,2)-Line1(1,2)) + Line1(1,2);
tx2 = tu*(Line1(2,1)-Line1(1,1)) + Line1(1,1);
ty2 = tu*(Line1(2,2)-Line1(1,2)) + Line1(1,2);
Line_clipped = [tx1 ty1; tx2 ty2];

% 绘图
figure; subplot(1,2,1);
hold on;
plot(Polygon1(:,1),Polygon1(:,2),'b-','LineWidth',2);
plot(Line1(:,1),Line1(:,2),'r-','LineWidth',2);
hold off; axis equal;
subplot(1,2,2);
hold on;
plot(Polygon1(:,1),Polygon1(:,2),'b-','LineWidth',2);
plot(Line_clipped(:,1),Line_clipped(:,2),'r-','LineWidth',2);
hold off; axis equal;
