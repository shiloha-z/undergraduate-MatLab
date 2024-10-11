%%函数：
%bar()绘制直方图
%subplot()画布布局函数
%cumsum()累加函数，比如[1，2，3，4]经过这个函数计算得到[1，3，6，10]
%.*矩阵的各个元素分别相乘

image=imread('lena512.bmp');
[height,width]=size(image);
 
 
% 然后统计每个灰度的像素值的累计数目
NumPixel = zeros(1,256);  % 建立一个256列的行向量，以统计各灰度级的像素个数
for i = 1 : height
   for j = 1 : width
       k = image(i,j);  % k是像素点(i,j)的灰度值
       % 因为NumPixel数组的下标是从1开始的，但是图像像素的取值范围是0~255
       % 所以用NumPixel(k+1)
       NumPixel(k+1) = NumPixel(k+1) + 1;  % 对应灰度值像素点数量加1 
   end
end
 
% % 这里我们将数组NumPixel显示出来，以观测效果
figure;
subplot(221), imshow(image);
subplot(222), bar(NumPixel);  % 灰度图像的直方图可以正确显示出来
xlabel("NumPixel")
 
% 接下来，将频数值算为频率
ProbPixel = zeros(1,256); % 统计各灰度级出现的频率
for i = 1 : 256
    ProbPixel(i) = NumPixel(i) / (height * width);
end
 
% % 这里我们将数组ProbPixel显示出来，以观测效果
%subplot(121), imshow(image);
subplot(223), bar(ProbPixel);  % 灰度图像的归一化直方图可以正确显示出来
xlabel("ProbPixel");
 
% 再用函数cumsum()来计算累积分布函数（CDF），并将频率（取值范围是0~1）映射到0~255的无符号整数
CumPixel = cumsum(ProbPixel);  % 这里的数组CumPixel大小也是1×256
CumPixel = uint8((256-1) .* CumPixel + 0.5); %转换成了原像素域
 
% % 这里我们将数组CumPixel显示出来，以观测效果
figure;
subplot(121), imshow(image);
subplot(224), bar(CumPixel);  % 数组CumPixel可以正确显示出来 
xlabel("CumPixel");
% 在下列用作直方图均衡化实现的赋值语句右端，image(i,j)被用来作为CumPixel的索引
% 例如，image(i,j)=120，则从CumPixel中取出第120个值作为image(i,j)的新像素值
outImage = uint8(zeros(height, width));  % 预分配数组
for i = 1 : height
   for j = 1 : width
      outImage(i,j) = CumPixel(image(i,j));
   end
end
figure;
% 显示直方图均衡化前后的图像，可以发现，与调用函数histeq()的效果一致
imshowpair(image, outImage, 'montage'); 




