clear all
clc
figure (1);
t =0:0.001:pi*2-0.01; 
subplot(2,1,1);
plot(t,sec(t),'red','LineStyle','-.');
xlabel('\fontsize{11}X\fontname{times}')
ylabel('\fontsize{11}Y\fontname{times}')
title('�������� y=sec(x)');
grid on
subplot(2,1,2);
plot(t,csc(t),'blue');
xlabel('\fontsize{11}X\fontname{times}')
ylabel('\fontsize{11}Y\fontname{times}')
title('������� y=csc(x)');
grid on

figure (2);
s=0:0.1:10;
polar(s,2.*sin(1+s*2));

figure (3);
x = 0:0.01:3;
y1=2.*x+5;
y2=x.^2-3.*x+1;
subplot(2,1,1);
plot(x,y1);grid on
axis([0 3 0 12]);
subplot(2,1,2);
plot(x,y2);grid on
axis([0 3 -2 1.5]);

clear
figure (4);
subplot(2,1,1);
[x,y]=meshgrid(0:0.1:10,0:0.1:10);
z = x.^2+y.^2+sin(x.*y);
surf(x,y,z);
subplot(2,1,2);
contour(x,y,z);

figure (5);
data=[3000,2334,3444,6663;2342,3422,2111,4453;3232,2334,5433,3500];

bar(data);
title('Ʒ�����۱Ƚ�ͼ');
legend('2006','2007','2008','2009');

clear
figure (6);
z = 0:0.1:40;
x = cos(z).^2;
y = sin(z)+cos(z);
plot3(x,y,z);

clear
x = 0:1:10;
y = sin(x)+x;
p=polyfit(x,y,7);
x1=linspace(0,10);
y1=polyval(p,x1);
figure(7);
plot(x,y,'o');
hold on;
plot(x1,y1);
hold off;

clear
figure(8);
x = 0:50:450;
y = 0:50:450;
z=10 .*randn([10 10])+20;
subplot(2,1,1);
surf(x,y,z);
[Xq,Yq]=meshgrid(0:10:450);
Vq=interp2(x,y,z,Xq,Yq,'spline');
subplot(2,1,2);
surf(Xq,Yq,Vq);

clear
figure(9);
x=-2:0.01:2;
a=2;
y=sqrt((1-x.^2/a^2)*(25-a^2));
plot(x,y,x,-y);
axis([-2 2 -5 5]);


