function sensor_data = creat2(M,K,SNR)
 % M阵列传感器数量 与特征值关系不明显
 % K目标数量 与特征值成正比
 % SNR信噪比（dB） 特征值与其成反比

% 生成目标信号和传感器噪声
sigma_s = 1; % 目标信号功率
sigma_w = sigma_s / 10^(SNR/10); % 噪声功率
t = 0:0.001:1; % 时间离散化，假设有1000个数据点 特征值与点数成正比

% 假设基础信号为正弦波
f1 = 1; % 第一个信号频率

s_base = sin(2*pi*f1*t); % 假设基础信号是正弦波

% 假设 s2(t) 是基础信号的一个缩放版本
A2 = 0.5; % 缩放因子
s2 = A2 * s_base;

% 假设 s3(t) 是基础信号的一个延迟版本
delay = 0.2; % 延迟时间
s3 = circshift(s_base, round(delay * length(t)));

% 生成目标信号
target_signals = sqrt(sigma_s) * [s_base;s2;s3];

% 生成传感器噪声
sensor_noise = sqrt(sigma_w) * randn(M, length(t));

% 生成传感器信号
sensor_data = zeros(M, length(t));
for k = 1:K
% 生成不同角度的入射信号
angle = (mod(rand,1)-1/2) * pi; % 随机选择入射角度
array_response = exp(1i * angle * (0:M-1)); % 阵列响应
sensor_data = sensor_data + array_response.' * target_signals(k, :);
end

% 添加噪声
sensor_data = sensor_data + sensor_noise;
%plot(t,sensor_data);