r = rand(1,10)*20+10;
th = linspace(0,2*pi,10);
x = fix(r.*cos(th));
y = fix(r.*sin(th));
Pg = [x; y];
Bsize = 10;
J = draw_polygon(Pg,Bsize);
figure;
J2 = x_scan(Pg,J,Bsize);
