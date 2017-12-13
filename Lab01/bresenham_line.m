%�е�Bresenham��ֱ�ߵ��㷨
% P,QΪֱ�߶ζ˵㣬pixs_lineΪ����������ص�
function pixs_line = bresenham_line(P,Q)
 
% ���ֱ��PQ��ʹPQ��б��:0<=k<=1
% ��ֱ��PQ��б��С��0ʱ,��Flag(1)��1,����ֱ����y�ᷭת
% ��ֱ��PQ��б�ʾ���ֵ����1ʱ,��Flag(2)��1,����ֱ����y=x��ת
% ��ֱ��PQ��P����Q������Ϸ�ʱ,��Flag(3)��1,����P��Q�㻥��
Flag = [0 0 0];
if (Q(2)-P(2))*(Q(1)-P(1)) < 0
    Flag(1) = 1;
    P(2) = -P(2); Q(2) = -Q(2);
end
if abs(Q(2)-P(2)) > abs(Q(1)-P(1))  
    Flag(2) = 1;
    P = [P(2) P(1)];  Q = [Q(2),Q(1)];
end
if P(1) > Q(1)
    Flag(3) = 1;
    t = P; P = Q; Q = t;
end
 
% ��ʼ������
n = abs(Q(1)-P(1)) + 1; % �������ص����
pixs_line = zeros(n,2); % ��ʼ����������size:n*2
pixs_line(1,1:2) = [P(1) P(2)]; % �����һ����ΪP��
 
% �����ʼֵdx,dy,d=dx-2dy
dx = Q(1) - P(1);  dy = Q(2) - P(2);
d = dx - 2*dy;  % ��������ֻҪdi�ķ��ţ����ǿ�����2di*dx����di������С��
for i = 2:n
    pixs_line(i,1) = P(1) + i - 1;
    % ��d<0��ȡ���Ϸ����ص�,d������Ϊ1-k
    if d < 0
        pixs_line(i,2) = pixs_line(i-1,2) + 1;
        d = d + 2*dx - 2*dy;
    else
        % ��d>=0��ȡ���ҷ����ص�,d������Ϊ-k
        pixs_line(i,2) = pixs_line(i-1,2);
        d = d - 2*dy;
    end
end
 
% ��ԭԭʼֱ��PQ
if Flag(3) == 1
    pixs_line = flipud(pixs_line); % �������·�ת,�൱�ڽ���P���Q��
end
if Flag(2) == 1
    pixs_line = fliplr(pixs_line); % �������ҷ�ת,�൱��PQ��y=x��ת
end
if Flag(1) == 1
    pixs_line = [pixs_line(:,1) -1*pixs_line(:,2)]; % �����һ�в���,�ڶ��г�-1,�൱��PQ��y�ᷭת
end