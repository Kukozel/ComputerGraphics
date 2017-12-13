function lines = random_line(n)
 
for i = 1:n
    lines(i,1:2) = fix(rand(1,2)*100);
    lines(i,3:4) = fix(rand(1,2)*100);
    if lines(i,3) < lines(i,1)
        lines(i,1:4) = [lines(i,3:4) lines(i,1:2)];
    end
end