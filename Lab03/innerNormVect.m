% build inner normal vector based on the vertex of a given polygon.
function Nv = innerNormVect(Pg)

if size(Pg,1) ~= 2 && size(Pg,2) ~= 2
    error('The polygonal vertex should be [x1 y1; x2 y2; ...] !');
end
if size(Pg,2) ~= 2 
    Pg = Pg';
end

Nedge = size(Pg,1);
Pg = [Pg; Pg(1,1:2)];
Nv = zeros(Nedge,2);
for i = 1:Nedge
    Nv(i,1:2) = [Pg(i,2)-Pg(i+1,2), Pg(i+1,1)-Pg(i,1)];
    t = norm(Nv(i,1:2));
    if t > 10^(-10)
        Nv(i,1:2) = Nv(i,1:2) / t;
    end
end
