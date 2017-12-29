clear all;

n = 5; Le = 3;
PH = polygon_prism(n,Le);

T_V = [1 0 0 0;0 0 0 0;0 0 1 0;0 0 0 1];
z0 = 1;
T_H = [1 0 0 0;0 0 -1 0;0 0 0 0;0 0 -z0 1];
x0 = 1;
T_W = [0 0 0 0;-1 0 0 0;0 0 1 0;-x0 0 0 1];

PH_V = PH * T_V;
PH_H = PH * T_H;
PH_W = PH * T_W;

figure; hold on;
for i = 1:n       
    plot([PH_V(i,1) PH_V(n+i,1)],[PH_V(i,3) PH_V(n+i,3)],'b-','LineWidth',3);
    if i ~= n
        plot([PH_V(i,1) PH_V(i+1,1)],[PH_V(i,3) PH_V(i+1,3)],'b-','LineWidth',3);
        plot([PH_V(i+n,1) PH_V(i+n+1,1)],[PH_V(n+i,3) PH_V(n+i+1,3)],'b-','LineWidth',3);
    else
        plot([PH_V(1,1) PH_V(n,1)],[PH_V(1,3) PH_V(n,3)],'b-','LineWidth',3);
        plot([PH_V(n+1,1) PH_V(2*n,1)],[PH_V(n+1,3) PH_V(2*n,3)],'b-','LineWidth',3);
    end
    plot([PH_H(i,1) PH_H(n+i,1)],[PH_H(i,3) PH_H(n+i,3)],'b-','LineWidth',3);
    if i ~= n
        plot([PH_H(i,1) PH_H(i+1,1)],[PH_H(i,3) PH_H(i+1,3)],'b-','LineWidth',3);
        plot([PH_H(i+n,1) PH_H(i+n+1,1)],[PH_H(n+i,3) PH_H(n+i+1,3)],'b-','LineWidth',3);
    else
        plot([PH_H(1,1) PH_H(n,1)],[PH_H(1,3) PH_H(n,3)],'b-','LineWidth',3);
        plot([PH_H(n+1,1) PH_H(2*n,1)],[PH_H(n+1,3) PH_H(2*n,3)],'b-','LineWidth',3);
    end
    plot([PH_W(i,1) PH_W(n+i,1)],[PH_W(i,3) PH_W(n+i,3)],'b-','LineWidth',3);
    if i ~= n
        plot([PH_W(i,1) PH_W(i+1,1)],[PH_W(i,3) PH_W(i+1,3)],'b-','LineWidth',3);
        plot([PH_W(i+n,1) PH_W(i+n+1,1)],[PH_W(n+i,3) PH_W(n+i+1,3)],'b-','LineWidth',3);
    else
        plot([PH_W(1,1) PH_W(n,1)],[PH_W(1,3) PH_W(n,3)],'b-','LineWidth',3);
        plot([PH_W(n+1,1) PH_W(2*n,1)],[PH_W(n+1,3) PH_W(2*n,3)],'b-','LineWidth',3);
    end
end    
hold off; axis equal;
