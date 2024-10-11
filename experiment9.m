clc;
clear;
close all;
soundSpeed = 340; % m/s
% α��ʾ������
fs = 1000; % ����Ƶ��
t = 0:1/fs:1; % ʱ������
f = 10; % ����Ƶ��
figure (1);

% ����ʾ�������ź�
xx1 = (1-t).*sin(2*pi*f*t);
t2 = t - 0.02;
xx2 = (1-t2).*sin(2*pi*f*t2);
subplot(611);
plot(t,xx1);
subplot(612);
plot(t,xx2);
axis([0 1 -1 1]);

r1 =0* randn([1,length(t)]);%����
r2 =0* randn([1,length(t)]);
x1=xx1+r1;
x2=xx2+r2;
subplot(613);
plot(t,x1);
axis([0 1 -3 3]);
subplot(614);
plot(t,x2);
axis([0 1 -3 3]);

for i = 1 : length(t)
    if(x1(i)>0.9)
        s1=i;
    end
    if(x2(i)>0.9)
        s2=i;
    end
end
if(abs(s1-s2)>50)
    disp('��Դ���������');
    return;
end

% ���㻥��غ���
[acor,lag] = xcorr(x1,x2);
subplot(615);
plot(lag,acor);

subplot(616);
plot(lag,abs(acor));
% Ѱ�һ���غ����ķ�ֵ
[~,I] = max(abs(acor));
lagDiff = lag(I);

% ����й©�����
distance = -lagDiff / fs * soundSpeed/2; 
disp(distance);
% й©��λ�ù���
%leakLocation = (soundSpeed/2-distance) / 2; % й©���λ��

%disp(['���Ƶ�й©��λ��Ϊ��', num2str(leakLocation), ' ��']);