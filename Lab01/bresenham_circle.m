% �е�Bresenham��Բ���㷨
% RΪ�뾶��pixs_circleΪ����������ص�
function pixs_circle = bresenham_circle(R)

x = 0;
y = R;
d = 1-R;
while x <= y
    pixs_base(x+1,:) = [x,y]; % ��һ����
    if d<0 
        d = d+2*x+3;
    else
        d = d+2*(x-y)+5;
        y = y-1;
    end
    x = x+1;
end

% ��ɵ�һ���޵����ص����

pixs_circle = [pixs_base;fliplr(pixs_base)];
pixs_circle = [pixs_circle;-1*pixs_circle(:,1) pixs_circle(:,2)];
pixs_circle = [pixs_circle;pixs_circle(:,1) -1*pixs_circle(:,2)];
pixs_circle = unique(pixs_circle,'rows'); 
pixs_circle = sortrows(pixs_circle,1);