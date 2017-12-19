% P,QΪֱ�߶ζ˵㣬pixs_lineΪ����������ص�
function pixs_line = bresenham_line(P,Q)

% �ж�б�� k �Ƿ����ֵС��1
% ���б�ʴ���1, X,Y���껥��
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
n = abs(Q(1)-P(1)) + 1;  % ���Ƶ����ص���
pixs_line = zeros(n,2);
pixs_line(1,1:2) = [P(1) P(2)];

% �е� Bresenham �㷨ɨ��ת��
dx = Q(1) - P(1);  dy = Q(2) - P(2);
d = dx - 2*dy;
for i = 2:n
    pixs_line(i,1) = P(1) + i - 1;
    if d < 0
        pixs_line(i,2) = pixs_line(i-1,2) + 1;
        d = d + 2*dx - 2*dy;
    else 
        pixs_line(i,2) = pixs_line(i-1,2);
        d = d - 2*dy;
    end
end

% k �ľ���ֵ����1ʱ�����⴦��
if Flag(3) == 1
    pixs_line = flipud(pixs_line);
end
if Flag(2) == 1
    pixs_line = fliplr(pixs_line);
end
if Flag(1) == 1;
    pixs_line = [pixs_line(:,1) -1*pixs_line(:,2)];
end

