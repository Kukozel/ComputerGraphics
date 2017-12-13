% 正弦曲线曲线的绘制
clear all
x=0:0.1:2*pi;
y=sin(x);
subplot(1,2,1),plot(x,y,'r')
subplot(1,2,2),plot(x,y,'b+')