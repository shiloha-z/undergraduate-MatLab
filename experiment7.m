close all;
clear;
clc;
M=5; % M���д��������� ������ֵ��ϵ������
K=3; % KĿ������ ������ֵ������
SNR=5; % SNR����ȣ�dB�� ����ֵ����ɷ���
sensor_data=creat(M,K,SNR);
% ���㴫��������Э�������
Rx = sensor_data * sensor_data' / 1001;

% ��ʾЭ�������
disp('����������Э������� Rx:');
disp(Rx);

%%
% ��Э��������������ֵ�ֽ�
[eigen_vectors, eigen_values] = eig(Rx);
% ����ֵ�ֽ���
disp('Э�����������ֵ:');
disp(eigen_values);
disp('Э���������������:');
disp(eigen_vectors);

%%
L = 200; % ���ؿ���ʵ�����
SNR_range = -10:1:20; % SNR��Χ
thresholds = [0.05, 0.1, 0.15, 0.2]; % ��ͬ����ֵ

success_probabilities = zeros(length(thresholds), length(SNR_range));

for t = 1:length(thresholds)
threshold = thresholds(t);
success_count = zeros(1, length(SNR_range));

for s = 1:length(SNR_range)
SNR = SNR_range(s);
successful_count=0;

for l = 1:L
% �������������ֵ�ֽ��Ŀ���ź���Ŀ�ж���ʹ����ֵthreshold
% ����ж��ɹ���increment successful_count
% ����ֵ�ֽ�
sensor_data=creat(5,3,SNR);
Rx = sensor_data * sensor_data' / 1001;
[eigen_vectors, eigen_values] = eig(Rx);

% ��ȡ����ֵ��ʵ������Ϊ����ֵ�Ǹ���
real_eigen_values = real(diag(eigen_values));

% ������ֵ�ж�Ŀ���ź���Ŀ
num_targets_detected = sum(real_eigen_values > threshold);

% �������Ҫ�ɹ��ж��ĸ��ʣ����������ؿ���ʵ����ͳ�Ƴɹ��������������

    if(num_targets_detected==K)
        successful_count = successful_count + 1; % �����ж��ɹ�
    end
     
end
success_count(s) = successful_count / L; % �ɹ��ж��ĸ���
end

success_probabilities(t, :) = success_count;
end

% ���Ƴɹ�������SNR�ı仯����
figure;
plot(SNR_range, success_probabilities(1,:),SNR_range, success_probabilities(2,:),SNR_range, success_probabilities(3,:),SNR_range, success_probabilities(4,:));
legend('��ֵ0.05', '��ֵ0.1', '��ֵ0.15', '��ֵ0.2');
xlabel('SNR (dB)');
ylabel('�ɹ�����');
title('Ŀ���ź���Ŀ�ж��ɹ�������SNR�ı仯');

%%