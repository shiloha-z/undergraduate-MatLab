% 读取Lenna图像并转换为灰度图像
img = imread('clena.jpeg');
if size(img, 3) == 3
    img = rgb2gray(img);
end
img = double(img)/255;

% Sobel算子
sobel_h = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
sobel_v = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
sobel_h_img = imfilter(img, sobel_h);
sobel_v_img = imfilter(img, sobel_v);
sobel_img = sqrt(sobel_h_img.^2 + sobel_v_img.^2);

% 高斯-拉普拉斯算子
gaussian_img = imgaussfilt(img, 2);
laplacian_img = del2(gaussian_img);
laplacian_img = laplacian_img/max(abs(laplacian_img(:)));

% Canny算子
canny_img = edge(img, 'Canny');

% 显示结果
figure;
subplot(2, 2, 1), imshow(img), title('原图像');
subplot(2, 2, 2), imshow(sobel_img), title('Sobel算子');
subplot(2, 2, 3), imshow(laplacian_img), title('高斯-拉普拉斯算子');
subplot(2, 2, 4), imshow(canny_img), title('Canny算子');
