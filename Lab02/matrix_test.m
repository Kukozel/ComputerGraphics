%Test 001
% A = eye(4)+1;
% X = 5:2:11;
% B = X*A;
% C = inv(A)*B';   % 单引号为转置，inv()为求逆运算
% [v,d] = eig(A);    % eig()为特征值与特征向量的计算函数

%Test 002
% x = -pi:pi/10:pi;
% y = tan(sin(x))-sin(tan(x));
% plot(x,y,'--rs','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g',...
% 'MarkerSize',10)   % ... 表示上下为同一行
% help plot

%Test 003 旋转
% V1 = [1, 1, 1]; O = [0, 0, 1];
% th = 2*pi/3;
% T = [cos(th) sin(th) 0; -sin(th) cos(th) 0; 0 0 1];
% V2 = V1 * T;
% x = [O(1) V1(1)]; 
% y = [O(2) V1(2)];
% hold on;
% plot(x,y,'r-o','LineWidth',2);
% axis([-2 2 -2 2]);
% x_new = [O(1) V2(1)]; 
% y_new = [O(2) V2(2)];
% plot(x_new,y_new,'b-o','LineWidth',2);
% hold off;

%Test 004 平移
% V1 = [1, 1, 1]; O = [0, 0, 1];
% T = [1 0 0; 0 1 0; -1 0 1];
% V2 = V1 * T;
% x = [O(1) V1(1)]; 
% y = [O(2) V1(2)];
% hold on;
% plot(x,y,'r-o','LineWidth',2);
% axis([-2 2 -2 2]);
% x_new = [O(1) V2(1)]; 
% y_new = [O(2) V2(2)];
% plot(x_new,y_new,'b-o','LineWidth',2);
% hold off;

%Test 005 错切
% V1 = [1, 1, 1]; O = [0, 0, 1];
% T = [1 0 0; 1 1 0; 0 0 1];
% V2 = V1 * T;
% x = [O(1) V1(1)]; 
% y = [O(2) V1(2)];
% hold on;
% plot(x,y,'r-o','LineWidth',2);
% axis([-2 2 -2 2]);
% x_new = [O(1) V2(1)]; 
% y_new = [O(2) V2(2)];
% plot(x_new,y_new,'b-o','LineWidth',2);
% hold off;

%Test 006 水平镜像
V1 = [1, 1, 1]; O = [0, 0, 1];
T = [-1 0 0; 0 1 0; 0 0 1];
V2 = V1 * T;
x = [O(1) V1(1)]; 
y = [O(2) V1(2)];
hold on;
plot(x,y,'r-o','LineWidth',2);
axis([-2 2 -2 2]);
x_new = [O(1) V2(1)]; 
y_new = [O(2) V2(2)];
plot(x_new,y_new,'b-o','LineWidth',2);
hold off;