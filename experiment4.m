close all;
clear
figure(1)
Fs=1000;
t = (1:Fs)/Fs;
x = sin(100*pi*t)+sin(240*pi*t);
N=length(x);


figure(1);
subplot(6,1,1);
plot(t,x);
subplot(6,1,4);
%hua_fft(x,Fs,1);
x1=fft(x);
plot(t*Fs,abs(x1));
%% 

z=2*randn(1,N);
h=x+z;
subplot(6,1,2);
plot(t,h);
subplot(6,1,5);
%hua_fft(h,Fs,1);
h1=fft(h);
plot(t*Fs,abs(h1));
%% 
%y=lowp(h,120,170,0.1,20,Fs);

te=designfilt('lowpassiir','PassbandFrequency',120,'StopbandFrequency',150,'PassbandRipple',1,'StopbandAttenuation',60,'SampleRate',1000,'DesignMethod','cheby2');
%fvtool(te);
y=filter(te,h);

%% 

figure(1)
subplot(6,1,6);
%hua_fft(y,Fs,1);
y1=fft(y);
plot(t*Fs,abs(y1));

subplot(6,1,3);
plot(t,y);


