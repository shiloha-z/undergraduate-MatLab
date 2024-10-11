clc;
% (1) 随机产生二元序列
sequence_length = 60;
binary_sequence = randsrc(1,sequence_length,[1 2; .5 .5]);

% (2) 信源编码（算术编码）
% 假设二进制序列中0和1的概率相等
p0 = 5; % 概率0的出现
p1 = 5; % 概率1的出现
source_encoded = arithenco(binary_sequence, [p0, p1]);

% (2) 信道编码（(7,4)循环码）
% 编码器
msg = source_encoded; % 输入消息
n = 7; % 码字长度
k = 4; % 信息位数
encoded_sequence = encode(msg, n, k, 'hamming/binary');

% (4) 模拟高斯白噪声信道
snr_dB = 10; % 信噪比（以分贝为单位）
noise_std = sqrt(0.5 / (10^(snr_dB/10)));
noisy_signal = encoded_sequence + noise_std * randn(1, length(encoded_sequence));

% (4) 信道解码
% 解码器
noisy_signal = mod(round(noisy_signal),1);
decoded_sequence1 = decode(noisy_signal, n, k, 'hamming/binary');

% (6) 信源解码（算术解码）
decoded_sequence = arithdeco(decoded_sequence1, [p0, p1], sequence_length);

% (7) 计算误码率
error_bits = sum(abs(binary_sequence - decoded_sequence));
error_rate = error_bits / sequence_length;

fprintf('误码率: %f\n', error_rate);