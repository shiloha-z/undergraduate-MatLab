function x=f_mycos(fc,t)
% ����˵����������help ʱ��ʾ
x=cos(2*pi*fc*t); % ���ҷ��ȣ���λ����(mv)
plot(t,x), % �����Ҳ���
xlabel('ʱ�� t(s)') % x ��������
ylabel('���� x(mv)') % y ��������
title('һ�����Ҳ���') % ͼ������