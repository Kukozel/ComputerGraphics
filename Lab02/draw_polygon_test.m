r = rand(1,10)*20+10;
th = linspace(0,2*pi,10);
x = fix(r.*cos(th));
y = fix(r.*sin(th));
Pg = [x; y];
J = draw_polygon(Pg,10);