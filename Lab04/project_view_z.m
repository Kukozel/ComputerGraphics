clear all;

n = 5; Le = 2;
PH = polygon_prism(n,Le);

d = -2.5; 
x0 = 0.8; y0 = -1.6; z0 = -2;
T = [1 0 0 0;0 1 0 0;0 0 0 1/d;x0 y0 0 1+z0/d];

PH2 = PH * T;
for i = 1:size(PH2,1)
    PH2(i,:) = PH2(i,:) / PH2(i,4);
end

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
plot([min(PH2(:,1))-1,max(PH2(:,1))+1],[0,0],'k-');
plot([0,0],[min(PH2(:,2))-1,max(PH2(:,2)+1)],'k-');
hold off; axis equal;