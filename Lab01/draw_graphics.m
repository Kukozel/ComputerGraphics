function draw_graphics(pixs_line)
 
X = min(pixs_line(:,1))-1:max(pixs_line(:,1))+1;
Y = min(pixs_line(:,2))-1:max(pixs_line(:,2))+1;
Lsize = max([length(X) length(Y)]);
 
figure; hold on; axis equal;
axis([X(1)-1 X(end)+1 Y(1)-1 Y(end)+1]);
for i = 1:size(pixs_line,1)
    for j = X(1):X(end)
        for k = Y(1):Y(end)
            if pixs_line(i,1) == j & pixs_line(i,2) == k
                plot(j,k,'s','MarkerEdgeColor','r',...
                    'MarkerFaceColor','r','MarkerSize',fix(300/Lsize));
            end
        end
    end
    pause(0.5);
end
hold off;
