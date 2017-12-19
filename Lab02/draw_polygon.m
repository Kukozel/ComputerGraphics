% build an image based on the given polygon
function J = draw_polygon(Pg,Bsize)
if size(Pg,2) ~= 2
    Pg = Pg';
end
Nedge = size(Pg,1);
Xmin = min(Pg(:,1)); Xmax = max(Pg(:,1));
Ymin = min(Pg(:,2)); Ymax = max(Pg(:,2));
Pg = [Pg; Pg(1,1:2)];
m = Xmax-Xmin+3; n = Ymax-Ymin+3;
J = zeros(m,n);
for i = 1:Nedge
    t_line = bresenham_line(Pg(i,1:2),Pg(i+1,1:2));
    for k = 1:size(t_line,1)
        t_xy = t_line(k,1:2);
        J(t_xy(1)-Xmin+2,t_xy(2)-Ymin+2) = 1;
    end
end
J2 = zeros(m*Bsize,n*Bsize);
for i = 1:m
    for j = 1:n
        if J(i,j) == 1
            J2(Bsize*(i-1)+1:Bsize*i,Bsize*(j-1)+1:Bsize*j) = 1;
        end
    end
end
imshow(J2,[0,1]);

