function sensor_data = creat(M,K,SNR)
 % M阵列传感器数量 与特征值关系不明显
 % K目标数量 与特征值成正比
 % SNR信噪比（dB） 特征值与其成反比

% 生成目标信号和传感器噪声
sigma_s = 1; % 目标信号功率
sigma_w = sigma_s / 10^(SNR/10); % 噪声功率
t = 0:0.001:1; % 时间离散化，假设有1000个数据点 特征值与点数成正比

% 生成目标信号
target_signals = sqrt(sigma_s) * randn(K, length(t));

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