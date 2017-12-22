clear all;

n = 100;
Xmin = -4; Xmax = 4;
Ymin = -3; Ymax = 3;

figure; hold on;

P1x = rand(1,n)*20 - 10;  
P2x = rand(1,n)*20 - 10;
P1y = rand(1,n)*20 - 10;  
P2y = rand(1,n)*20 - 10;
P1code = zeros(n,4);
P2code = zeros(n,4);

for i = 1:n    
    
    if P1x(i) < Xmin
        P1code(i,1) = 1;
    end
    if P1x(i) > Xmax
        P1code(i,2) = 1;
    end
    if P1y(i) < Ymin
        P1code(i,3) = 1;
    end
    if P1y(i) > Ymax
        P1code(i,4) = 1;
    end    
    
    if P2x(i) < Xmin
        P2code(i,1) = 1;
    end
    if P2x(i) > Xmax
        P2code(i,2) = 1;
    end
    if P2y(i) < Ymin
        P2code(i,3) = 1;
    end
    if P2y(i) > Ymax
        P2code(i,4) = 1;
    end
    
    plot([P1x(i),P2x(i)],[P1y(i),P2y(i)],'b-');
end
hold off;

P_label = zeros(1,n);
figure; hold on;
for i = 1:n
    P_or = P1code(i,1:4) | P2code(i,1:4);
    if sum(P_or) == 0
        P_label(i) = 1;
        plot([P1x(i),P2x(i)],[P1y(i),P2y(i)],'r-');
    end
    P_and = P1code(i,1:4) & P2code(i,1:4);
    if sum(P_and) > 0
        P_label(i) = 2;
        plot([P1x(i),P2x(i)],[P1y(i),P2y(i)],'g-');
    end
end
hold off;

figure; hold on;
for i = 1:n
    if P_label(i) == 0

        P_or = P1code(i,1:4) | P2code(i,1:4);
        plot([P1x(i),P2x(i)],[P1y(i),P2y(i)],'g-');

        if P_or(1) == 1
            Py = P1y(i) + (Xmin-P1x(i))*(P2y(i)-P1y(i))/(P2x(i)-P1x(i));
            if P1x(i) < Xmin
                P1x(i) = Xmin; P1y(i) = Py;
            elseif P2x(i) < Xmin
                P2x(i) = Xmin; P2y(i) = Py;
            end            
        end
        
        if P_or(2) == 1
            Py = P1y(i) + (Xmax-P1x(i))*(P2y(i)-P1y(i))/(P2x(i)-P1x(i));
            if P1x(i) > Xmax
                P1x(i) = Xmax; P1y(i) = Py;
            elseif P2x(i) > Xmax
                P2x(i) = Xmax; P2y(i) = Py;
            end            
        end
        
        if P_or(3) == 1
            Px = P1x(i) + (Ymin-P1y(i))/(P2y(i)-P1y(i))*(P2x(i)-P1x(i));
            if P1y(i) < Ymin
                P1x(i) = Px; P1y(i) = Ymin;
            elseif P2y(i) < Ymin
                P2x(i) = Px; P2y(i) = Ymin;
            end            
        end
        
        if P_or(4) == 1
            Px = P1x(i) + (Ymax-P1y(i))/(P2y(i)-P1y(i))*(P2x(i)-P1x(i));
            if P1y(i) > Ymax
                P1x(i) = Px; P1y(i) = Ymax;
            elseif P2y(i) > Ymax
                P2x(i) = Px; P2y(i) = Ymax;
            end            
        end
        if P1x(i) >= Xmin & P1x(i) <= Xmax & ...
                P2x(i) >= Xmin & P2x(i) <= Xmax & ...
                P1y(i) >= Ymin & P1y(i) <= Ymax & ...
                P2y(i) >= Ymin & P2y(i) <= Ymax
            plot([P1x(i),P2x(i)],[P1y(i),P2y(i)],'m-','LineWidth',2);
        end
        plot([-4 4 4 -4 -4],[-3 -3 3 3 -3],'b-','LineWidth',2);
    end
end
hold off;