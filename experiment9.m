clc;
clear;
close all;
soundSpeed = 340; % m/s
% 伪造示例数据
fs = 1000; % 采样频率
t = 0:1/fs:1; % 时间向量
f = 10; % 声波频率
figure (1);

% 生成示例声波信号
xx1 = (1-t).*sin(2*pi*f*t);
t2 = t - 0.02;
xx2 = (1-t2).*sin(2*pi*f*t2);
subplot(611);
plot(t,xx1);
subplot(612);
plot(t,xx2);
axis([0 1 -1 1]);

r1 =0* randn([1,length(t)]);%加噪
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
    disp('声源不在两点间');
    return;
end

% 计算互相关函数
[acor,lag] = xcorr(x1,x2);
subplot(615);
plot(lag,acor);

subplot(616);
plot(lag,abs(acor));
% 寻找互相关函数的峰值
[~,I] = max(abs(acor));
lagDiff = lag(I);

% 计算泄漏点距离
distance = -lagDiff / fs * soundSpeed/2; 
disp(distance);
% 泄漏点位置估计
%leakLocation = (soundSpeed/2-distance) / 2; % 泄漏点的位置

%disp(['估计的泄漏点位置为：', num2str(leakLocation), ' 米']);