% 绘制三维空间立方体，使用 plot3 函数
clear all;

cube_floor = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 0];
cube_ceil = [0 0 1;1 0 1;1 1 1;0 1 1;0 0 1];
figure; hold on;
plot3(cube_floor(:,1),cube_floor(:,2),cube_floor(:,3),'b-','LineWidth',3);
plot3(cube_ceil(:,1),cube_ceil(:,2),cube_ceil(:,3),'b-','LineWidth',3);
for i = 1:size(cube_floor,1)
    plot3([cube_floor(i,1) cube_ceil(i,1)], [cube_floor(i,2) cube_ceil(i,2)], ...
        [cube_floor(i,3) cube_ceil(i,3)],'b-','LineWidth',3);
end
plot3(cube_floor(:,1),cube_floor(:,2),cube_floor(:,3),'ro','MarkerSize',5);
plot3(cube_ceil(:,1),cube_ceil(:,2),cube_ceil(:,3),'ro','MarkerSize',5);
hold off; axis([-1 2 -1 2 -1 2]);
view(30,20)