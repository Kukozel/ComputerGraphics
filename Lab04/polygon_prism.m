% generate data of a polygon prism and plot the prism
function PH = polygon_prism(n,Le)
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
hold off; axis equal
axis([-1 2 -1 2 -1 2]);
view(30,20);


