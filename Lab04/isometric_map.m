clear all;

n = 5; Le = 2;
PH = polygon_prism(n,Le);

C1 = sqrt(2); C2 = sqrt(6);
T = [C1/2 -C2/6 0 0;0 C2/3 0 0;-C1/2 -C2/6 0 0;0 0 0 1];

PH2 = PH * T;

figure; hold on;
for i = 1:n       
    plot([PH2(i,1) PH2(n+i,1)],[PH2(i,2) PH2(n+i,2)],'b-','LineWidth',3);
    if i ~= n
        plot([PH2(i,1) PH2(i+1,1)],[PH2(i,2) PH2(i+1,2)],'b-','LineWidth',3);
        plot([PH2(i+n,1) PH2(i+n+1,1)],[PH2(n+i,2) PH2(n+i+1,2)],'b-','LineWidth',3);
    else
        plot([PH2(1,1) PH2(n,1)],[PH2(1,2) PH2(n,2)],'b-','LineWidth',3);
        plot([PH2(n+1,1) PH2(2*n,1)],[PH2(n+1,2) PH2(2*n,2)],'b-','LineWidth',3);
    end
end    
hold off; axis equal;