close all;
clear;
clc;
M=5; % M阵列传感器数量 与特征值关系不明显
K=3; % K目标数量 与特征值成正比
SNR=5; % SNR信噪比（dB） 特征值与其成反比
sensor_data=creat(M,K,SNR);
% 计算传感器数据协方差矩阵
Rx = sensor_data * sensor_data' / 1001;

% 显示协方差矩阵
disp('传感器数据协方差矩阵 Rx:');
disp(Rx);

%%
% 对协方差矩阵进行特征值分解
[eigen_vectors, eigen_values] = eig(Rx);
% 特征值分解结果
disp('协方差矩阵特征值:');
disp(eigen_values);
disp('协方差矩阵特征向量:');
disp(eigen_vectors);

%%
L = 200; % 蒙特卡洛实验次数
SNR_range = -10:1:20; % SNR范围
thresholds = [0.05, 0.1, 0.15, 0.2]; % 不同的阈值

success_probabilities = zeros(length(thresholds), length(SNR_range));

for t = 1:length(thresholds)
threshold = thresholds(t);
success_count = zeros(1, length(SNR_range));

for s = 1:length(SNR_range)
SNR = SNR_range(s);
successful_count=0;

for l = 1:L
% 在这里进行特征值分解和目标信号数目判定，使用阈值threshold
% 如果判定成功，increment successful_count
% 特征值分解
sensor_data=creat(5,3,SNR);
Rx = sensor_data * sensor_data' / 1001;
[eigen_vectors, eigen_values] = eig(Rx);

% 提取特征值的实部，因为特征值是复数
real_eigen_values = real(diag(eigen_values));

% 根据阈值判定目标信号数目
num_targets_detected = sum(real_eigen_values > threshold);

% 如果您需要成功判定的概率，可以在蒙特卡洛实验中统计成功次数并计算概率

    if(num_targets_detected==K)
        successful_count = successful_count + 1; % 假设判定成功
    end
     
end
success_count(s) = successful_count / L; % 成功判定的概率
end

success_probabilities(t, :) = success_count;
end

% 绘制成功概率随SNR的变化曲线
figure;
plot(SNR_range, success_probabilities(1,:),SNR_range, success_probabilities(2,:),SNR_range, success_probabilities(3,:),SNR_range, success_probabilities(4,:));
legend('阈值0.05', '阈值0.1', '阈值0.15', '阈值0.2');
xlabel('SNR (dB)');
ylabel('成功概率');
title('目标信号数目判定成功概率随SNR的变化');

%%