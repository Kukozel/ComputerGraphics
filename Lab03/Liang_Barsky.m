clear all

pixs_line=LBLineClip(3,15,7,19,0,0,18,18);
draw_graphics(pixs_line);

function [max,min,i]=LBLineClipTest(p,q,umax,umin)
r=0;
if p<0 % p小于0时比较最大值
    r=q/p;
    if r>umin
        i=0; % umax小于umin直线段才有在窗口的部分
        max=umax;
        min=umin;
        return;
    elseif r>umax
            umax=r;
    end
    
elseif p>0% p大于0时比较最大值
    r=q/p;
    if r<umax
        i=0;% umax小于umin直线段才有在窗口的部分
        max=umax;
        min=umin;
        return;
    elseif r<umin
        umin=r;
    end
    
elseif q<0 
    i=0; %处理p=0的情况
    max=umax;
    min=umin;
    return;
end
    max=umax;
    min=umin;
    i=1;
    return;
end

function pixs_line=LBLineClip(xwl,xwr,ywb,ywt,x1,y1,x2,y2)
deltax=x2-x1;
deltay=y2-y1;
umax=0;
umin=1;
[umax,umin,i1]=LBLineClipTest(-deltax,x1-xwl,umax,umin);
if i1 == 1
    [umax,umin,i2]=LBLineClipTest(deltax,xwr-x1,umax,umin);
    if i2==1
        [umax,umin,i3]=LBLineClipTest(-deltay,y1-ywb,umax,umin);
        if i3==1
            [umax,umin,i4]=LBLineClipTest(deltay,ywt-y1,umax,umin);
            if i4==1
                new_x1=floor(x1+umax*deltax+0.5);
                new_y1=floor(y1+umax*deltay+0.5);
                new_x2=floor(x1+umin*deltax+0.5);
                new_y2=floor(y1+umin*deltay+0.5);
 
                P=[new_x1 new_y1];
                Q=[new_x2 new_y2];
                pixs_line = bresenham_line(P,Q);
                return;
            end
        end
    end
end
pixs_line=[];
end

