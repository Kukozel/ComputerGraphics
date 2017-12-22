clear all;

x = 0:0.3:2*pi;
y1 = sin(x);  y2 = cos(x);
hold on;
plot(x,y1,'r-*','LineWidth',3);
plot(x,y2,'b:+','MarkerSize',5);
hold off;
legend('sin(x)','cos(x)');
xlabel('angle','FontSize',12); ylabel('value','FontSize',12);
text(1.3,0.9,'sin(x)','FontName','Time New Roman');
gtext('cos(x)','FontName','Time New Roman');
saveas(gcf,'myplot01.jpg');
figure; subplot(1,2,1); plot(x,y1.^2,'r-*'); axis([-1 10 -1 2]);
subplot(1,2,2); plot(y1,y2,'b:+'); 
axis equal;