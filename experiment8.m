clc;
% (1) ���������Ԫ����
sequence_length = 60;
binary_sequence = randsrc(1,sequence_length,[1 2; .5 .5]);

% (2) ��Դ���루�������룩
% ���������������0��1�ĸ������
p0 = 5; % ����0�ĳ���
p1 = 5; % ����1�ĳ���
source_encoded = arithenco(binary_sequence, [p0, p1]);

% (2) �ŵ����루(7,4)ѭ���룩
% ������
msg = source_encoded; % ������Ϣ
n = 7; % ���ֳ���
k = 4; % ��Ϣλ��
encoded_sequence = encode(msg, n, k, 'hamming/binary');

% (4) ģ���˹�������ŵ�
snr_dB = 10; % ����ȣ��Էֱ�Ϊ��λ��
noise_std = sqrt(0.5 / (10^(snr_dB/10)));
noisy_signal = encoded_sequence + noise_std * randn(1, length(encoded_sequence));

% (4) �ŵ�����
% ������
noisy_signal = mod(round(noisy_signal),1);
decoded_sequence1 = decode(noisy_signal, n, k, 'hamming/binary');

% (6) ��Դ���루�������룩
decoded_sequence = arithdeco(decoded_sequence1, [p0, p1], sequence_length);

% (7) ����������
error_bits = sum(abs(binary_sequence - decoded_sequence));
error_rate = error_bits / sequence_length;

fprintf('������: %f\n', error_rate);