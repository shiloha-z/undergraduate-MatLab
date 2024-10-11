x = diag(3,4);

a = [0 5 8 ;3 -7 0 ;2 0 0];
b = [2 0 4 ;0 5 0 ; 7 0 8];

reshape(a,[1 9]);%将a 和b 变换成行向量
reshape(b,[1 9]);

c = -5 + 10.*rand([10 2]);%产生一个均匀分布在（-5，5）之间的随即矩阵（10×2），精确到小数点后一位。
c = roundn(c,-1);

A = [12 34 -4;34 7 87;3 65 7];
B = [1 3 -1;2 0 3;3 -2 7];
I = diag([1 1 1],0);
K11 = A+6*B;
K12 = A-B+I;
K21 = A * B;
K22 = A.*B;
K31 = A^ 3;
K32 = A.^3;
K41 = A/ B;
K42 = B \ A;
K51 = [A,B];
K52 = [A([1,3],:);B^ 2];%将A第一行和第三行截出接到B上方

clear
A = [1/ 2 1/3 1/ 4;1/ 3 1/ 4 1/ 5;1/ 4 1/ 5 1/ 6];
B = [0.95;0.67;0.52];
x1 = B/A
B(3,1) = 0.53;
x2 = A\B;

C = randn(6);
t=0;
for a = 1:3
    for b = 1:3
        if (C(a,b)> -0.3)&&(C(a,b)< 0.3) 
            t=t+1;
        end
    end
end
t;

clear
A = [0 1 5 -2 8;3 -4 9 3 -8;0 3 6 2 -1;0 0 55 1 -2];
B = [];
for a = 1:4
    for b = 1:5
        if (A(a,b)> 1)
            B = [B,A(a,b)];
        end
    end
end
B;

rand('state',0);
a=rand(2,2);
s1 = num2str(a);
s_s = sprintf('%.10e\n',a);%格式化字符串
fprintf('%.5g\\',a);%将格式化后的字符串打印到屏幕上
s_sscan = sscanf(s_s,'%f',[3,2]);%读取格式化数据

clear
A = [1 1 0.5;1 1 0.25;0.5 0.25 2];
[V,D]=eig(A);
V;%特征向量
D;%特征值

sqrtm(A);%矩阵平方根
sqrt(A);%平方根

c=0;
for i = 1000:9999
    if((i/17)==round(i/17))
        c=c+1;
    end
end

