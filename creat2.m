function sensor_data = creat2(M,K,SNR)
 % M���д��������� ������ֵ��ϵ������
 % KĿ������ ������ֵ������
 % SNR����ȣ�dB�� ����ֵ����ɷ���

% ����Ŀ���źźʹ���������
sigma_s = 1; % Ŀ���źŹ���
sigma_w = sigma_s / 10^(SNR/10); % ��������
t = 0:0.001:1; % ʱ����ɢ����������1000�����ݵ� ����ֵ�����������

% ��������ź�Ϊ���Ҳ�
f1 = 1; % ��һ���ź�Ƶ��

s_base = sin(2*pi*f1*t); % ��������ź������Ҳ�

% ���� s2(t) �ǻ����źŵ�һ�����Ű汾
A2 = 0.5; % ��������
s2 = A2 * s_base;

% ���� s3(t) �ǻ����źŵ�һ���ӳٰ汾
delay = 0.2; % �ӳ�ʱ��
s3 = circshift(s_base, round(delay * length(t)));

% ����Ŀ���ź�
target_signals = sqrt(sigma_s) * [s_base;s2;s3];

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