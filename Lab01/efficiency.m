clear all;
 
n = 10000;
lines = random_line(n);
 
tic;
for i = 1:n
    P = lines(i,1:2); Q = lines(i,3:4);
    pixs_line = bresenham_line(P,Q);    
end
toc;
 
tic;
for i = 1:n
    P = lines(i,1:2); Q = lines(i,3:4);
    pixs_line = dda_line(P,Q);    
end
toc;