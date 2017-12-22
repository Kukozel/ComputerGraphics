clear all;

% ����δ��ڼ������õ�ֱ�߶�
Polygon1 = [0 2; 1 1; 1 -1; -1 -1; -1 1; 0 2];
Line1 = [-1.5 0.2; 0.5 -3];
N_edge = size(Polygon1,1)-1;

% ������ߵ��ڷ�����
for i = 1:N_edge
    N_pg(i,1:2) = [Polygon1(i,2)-Polygon1(i+1,2), Polygon1(i+1,1)-Polygon1(i,1)];
end

% ������������
tl = 0;  % ����������(t����Сֵ)��ʼֵ
tu = 1;  % ����������(t�����ֵ)��ʼֵ
for i = 1:N_edge
    dn = N_pg(i,1)*(Line1(2,1)-Line1(1,1)) + N_pg(i,2)*(Line1(2,2)-Line1(1,2));  % N*(P2-P1)
    nw = N_pg(i,1)*(Line1(1,1)-Polygon1(i,1)) + N_pg(i,2)*(Line1(1,2)-Polygon1(i,2))  % N*(P1-Ai)
    if abs(dn) < 10^(-6)   % ���������dn = 0 �Ĵ���
        if nw < 0
            tl = 1; tu = 0;  % ����Ϊ�������н�������
            break;
        else
            continue;
        end
    else
        t = - nw / dn;
        if dn < 0
            if t > tl
                tl = t;
            end
        else
            if t < tu
                tu = t;
            end
        end        
    end
end
if tl > tu
    disp('�޽�����ڣ�');
    figure;hold on;
    plot(Polygon1(:,1),Polygon1(:,2),'b-','LineWidth',2);
    plot(Line1(:,1),Line1(:,2),'r-','LineWidth',2);
    hold off; axis equal;
    return;
end

% ������ú�ֱ�����˵�����
tx1 = tl*(Line1(2,1)-Line1(1,1)) + Line1(1,1);
ty1 = tl*(Line1(2,2)-Line1(1,2)) + Line1(1,2);
tx2 = tu*(Line1(2,1)-Line1(1,1)) + Line1(1,1);
ty2 = tu*(Line1(2,2)-Line1(1,2)) + Line1(1,2);
Line_clipped = [tx1 ty1; tx2 ty2];

% ��ͼ
figure; subplot(1,2,1);
hold on;
plot(Polygon1(:,1),Polygon1(:,2),'b-','LineWidth',2);
plot(Line1(:,1),Line1(:,2),'r-','LineWidth',2);
hold off; axis equal;
subplot(1,2,2);
hold on;
plot(Polygon1(:,1),Polygon1(:,2),'b-','LineWidth',2);
plot(Line_clipped(:,1),Line_clipped(:,2),'r-','LineWidth',2);
hold off; axis equal;
