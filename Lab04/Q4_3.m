% Q4_3

function PH = Q4_3(n,Le)
%Le = 2;   % length of the polygon
Ed = 1;   % edge of polygons

PH(1:2*n,1:4) = zeros; PH(:,4) = 1;
for i = 1:n-1
    alpha = (i-1) * 2*pi/n;
    dy = Ed * cos(alpha);
    dz = Ed * sin(alpha);
    PH(i+1,2) = PH(i,2) + dy;
    PH(i+1,3) = PH(i,3) + dz;
end
PH(n+1:2*n,1) = Le;
PH(n+1:2*n,2:4) = PH(1:n,2:4);

% ‘ÀÀ„¥˙¬Î
T1 = [1 0 0 0 ;0 1 0 0 ;0 0 1 0 ;-3 2 1 1];
th1=atan(1/2);
th2=atan(80^0.5/5);
T2 = [cos(th1) sin(th1) 0 0; -sin(th1) cos(th1) 0 0; 0 0 1 0 ;0 0 0 1];
T3 = [1 0 0 0; 0 cos(th2) sin(th2) 0;0 -sin(th2) cos(th2) 0 ;0 0 0 1];
T4 = [0 1 0 0;-1 0 0 0;0 0 1 0;0 0 0 1];
T5 = inv(T3);
T6 = inv(T2);
T7 = inv(T1);
T=T1*T2*T3*T4*T5*T6*T7;
PH2=PH*T1;

% ªÊ÷∆ÕºœÒ
figure; hold on;
plot3([0,Le+1],[0,0],[0,0],'k-');
plot3([0,0],[0,max(PH(:,2)+1)],[0,0],'k-');
plot3([0,0],[0,0],[0,max(PH(:,3)+1)],'k-');
for i = 1:n       
    plot3([PH(i,1) PH(n+i,1)],[PH(i,2) PH(n+i,2)],...
        [PH(i,3) PH(n+i,3)],'b-','LineWidth',3);
    if i ~= n
        plot3([PH(i,1) PH(i+1,1)],[PH(i,2) PH(i+1,2)],...
            [PH(i,3) PH(i+1,3)],'b-','LineWidth',3);
        plot3([PH(i+n,1) PH(i+n+1,1)],[PH(n+i,2) PH(n+i+1,2)],...
            [PH(n+i,3) PH(n+i+1,3)],'b-','LineWidth',3);
    else
        plot3([PH(1,1) PH(n,1)],[PH(1,2) PH(n,2)],...
            [PH(1,3) PH(n,3)],'b-','LineWidth',3);
        plot3([PH(n+1,1) PH(2*n,1)],[PH(n+1,2) PH(2*n,2)],...
            [PH(n+1,3) PH(2*n,3)],'b-','LineWidth',3);
    end
end

plot3([0,Le+1],[0,0],[0,0],'k-');
plot3([0,0],[0,max(PH2(:,2)+1)],[0,0],'k-');
plot3([0,0],[0,0],[0,max(PH2(:,3)+1)],'k-');
for i = 1:n       
    plot3([PH2(i,1) PH2(n+i,1)],[PH2(i,2) PH2(n+i,2)],...
        [PH2(i,3) PH2(n+i,3)],'r-','LineWidth',3);
    if i ~= n
        plot3([PH2(i,1) PH2(i+1,1)],[PH2(i,2) PH2(i+1,2)],...
            [PH2(i,3) PH2(i+1,3)],'r-','LineWidth',3);
        plot3([PH2(i+n,1) PH2(i+n+1,1)],[PH2(n+i,2) PH2(n+i+1,2)],...
            [PH2(n+i,3) PH2(n+i+1,3)],'r-','LineWidth',3);
    else
        plot3([PH2(1,1) PH2(n,1)],[PH2(1,2) PH2(n,2)],...
            [PH2(1,3) PH2(n,3)],'r-','LineWidth',3);
        plot3([PH2(n+1,1) PH2(2*n,1)],[PH2(n+1,2) PH2(2*n,2)],...
            [PH2(n+1,3) PH2(2*n,3)],'r-','LineWidth',3);
    end
end
hold off; axis equal
axis([-3 3 -1 4 -1 3]);
view(30,20);