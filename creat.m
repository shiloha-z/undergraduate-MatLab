function sensor_data = creat(M,K,SNR)
 % M���д��������� ������ֵ��ϵ������
 % KĿ������ ������ֵ������
 % SNR����ȣ�dB�� ����ֵ����ɷ���

% ����Ŀ���źźʹ���������
sigma_s = 1; % Ŀ���źŹ���
sigma_w = sigma_s / 10^(SNR/10); % ��������
t = 0:0.001:1; % ʱ����ɢ����������1000�����ݵ� ����ֵ�����������

% ����Ŀ���ź�
target_signals = sqrt(sigma_s) * randn(K, length(t));

% ���ɴ���������
sensor_noise = sqrt(sigma_w) * randn(M, length(t));

% ���ɴ������ź�
sensor_data = zeros(M, length(t));
for k = 1:K
% ���ɲ�ͬ�Ƕȵ������ź�
angle = (mod(rand,1)-1/2) * pi; % ���ѡ������Ƕ�
array_response = exp(1i * angle * (0:M-1)); % ������Ӧ
sensor_data = sensor_data + array_response.' * target_signals(k, :);
end

% �������
sensor_data = sensor_data + sensor_noise;
%plot(t,sensor_data);