function J2 = x_scan(Pg,J,Bsize)
if size(Pg,2) ~= 2
    Pg = Pg';
end
Nedge = size(Pg,1);
Xmin = min(Pg(:,1)); Xmax = max(Pg(:,1));
Ymin = min(Pg(:,2)); Ymax = max(Pg(:,2));
Pgline = polygon2line(Pg);
J2 = J;
warning off;
for i = Ymin:Ymax
    Ncross = 0;    
    for j = 1:Nedge
        if (Pgline(j,2)-i)*(Pgline(j,4)-i) <= 0 && ...
            Pgline(j,2) ~= Pgline(j,4)
            Ncross = Ncross + 1;
            tx = Pgline(j,1)+(Pgline(j,3)-Pgline(j,1))*...
                (i-Pgline(j,2))/(Pgline(j,4)-Pgline(j,2));
            x_cross(Ncross,1:2) = [tx,i];
        end
    end
    [t,I] = sort(x_cross(:,1),'ascend'); 
    x_cross = x_cross(I,1:2);
    for j = 2:2:size(x_cross,1)
        t = x_cross(j-1:j,1) - Xmin + 2;
        J2(t(1):t(2),i-Ymin+2) = 1;
    end
end    

m = Xmax-Xmin+3; n = Ymax-Ymin+3;
J3 = zeros(m*Bsize,n*Bsize);
for i = 1:m
    for j = 1:n
        if J2(i,j) == 1
            J3(Bsize*(i-1)+1:Bsize*i,Bsize*(j-1)+1:Bsize*j) = 1;
        end
    end
end
imshow(J3,[0,1]);