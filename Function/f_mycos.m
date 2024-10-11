function x=f_mycos(fc,t)
% 程序说明，当调用help 时显示
x=cos(2*pi*fc*t); % 余弦幅度，单位毫伏(mv)
plot(t,x), % 画余弦波形
xlabel('时间 t(s)') % x 坐标名称
ylabel('幅度 x(mv)') % y 坐标名称
title('一个余弦波形') % 图形名称