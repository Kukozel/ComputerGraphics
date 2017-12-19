function Pgline = polygon2line(Pg)

if size(Pg,2) ~= 2
    Pg = Pg';
end
Nedge = size(Pg,1);
Pg = [Pg(end,1:2); Pg; Pg(1,1:2)];
for i = 1:Nedge
    Pgline(i,1:4) = [Pg(i+1,1:2) Pg(i+2,1:2)];
    if Pg(i+1,2)-Pg(i,2) > 0 && Pg(i+1,2)-Pg(i+2,2) < 0            
        Pgline(i,2) = Pgline(i,2) + 1;
        Pgline(i,1) = Pgline(i,1) + (Pgline(i,3)-Pgline(i,1)) ...
            / (Pgline(i,4)-Pgline(i,2));
    end
    if Pg(i+1,2)-Pg(i,2) < 0 && Pg(i+1,2)-Pg(i+2,2) > 0            
        Pgline(i,2) = Pgline(i,2) - 1;
        Pgline(i,1) = Pgline(i,1) - (Pgline(i,3)-Pgline(i,1)) ...
            / (Pgline(i,4)-Pgline(i,2));
    end
end