clear all;

n = 5; Le = 2;
PH = polygon_prism(n,Le);

alpha = atan(2); beta1 = pi/4;
T1 = [1 0 0 0;0 1 0 0;cot(alpha)*cos(beta1) cot(alpha)*sin(beta1) 0 0;0 0 0 1];
alpha = atan(2); beta2 = pi/6;
T2 = [1 0 0 0;0 1 0 0;cot(alpha)*cos(beta2) cot(alpha)*sin(beta2) 0 0;0 0 0 1];
PH1 = PH * T1;
PH2 = PH * T2;

figure; subplot(1,2,1);hold on;
for i = 1:n       
    plot([PH1(i,1) PH1(n+i,1)],[PH1(i,2) PH1(n+i,2)],'b-','LineWidth',3);
    if i ~= n
        plot([PH1(i,1) PH1(i+1,1)],[PH1(i,2) PH1(i+1,2)],'b-','LineWidth',3);
        plot([PH1(i+n,1) PH1(i+n+1,1)],[PH1(n+i,2) PH1(n+i+1,2)],'b-','LineWidth',3);
    else
        plot([PH1(1,1) PH1(n,1)],[PH1(1,2) PH1(n,2)],'b-','LineWidth',3);
        plot([PH1(n+1,1) PH1(2*n,1)],[PH1(n+1,2) PH1(2*n,2)],'b-','LineWidth',3);
    end
end    
hold off; axis equal;
subplot(1,2,2); hold on;
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