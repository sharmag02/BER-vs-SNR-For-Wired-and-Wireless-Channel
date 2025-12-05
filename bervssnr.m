clc; clear; close all;

% ---------------- PARAMETERS ----------------
SNR_dB = -20:5:80;          % SNR range in dB
SNR = 10.^(SNR_dB/10);      % Convert dB to linear
L_values = [1, 2, 4];       % Diversity orders

% ---------------- WIRED CHANNEL (AWGN) ----------------
BER_wired = qfunc(sqrt(SNR));

% ---------------- WIRELESS CHANNEL (Your Formula) ----------------
BER_wireless = zeros(length(L_values), length(SNR));

for i = 1:length(L_values)
    L = L_values(i);
    
    % Combination (2L - 1 choose L)
    C = nchoosek(2*L - 1, L);
    
    % BER Formula
    BER_wireless(i,:) = C.* ( 1./ (2 .* SNR).^L );
end

% ====================================================
%   1️⃣ SEPARATE PLOTS
% ====================================================

% ----- WIRED CHANNEL -----
figure;
semilogy(SNR_dB, BER_wired, 'k-o', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('Wired Channel (AWGN)');
legend('Wired (AWGN)', 'Location', 'northeast');
axis([-20 80 1e-8 1]);

% ----- WIRELESS L = 1 -----
figure;
semilogy(SNR_dB, BER_wireless(1,:), '-r^', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('Wireless Channel — L = 1');
legend('Wireless L=1', 'Location', 'northeast');
axis([-20 80 1e-8 1]);

% ----- WIRELESS L = 2 -----
figure;
semilogy(SNR_dB, BER_wireless(2,:), '-bs', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('Wireless Channel — L = 2');
legend('Wireless L=2', 'Location', 'northeast');
axis([-20 80 1e-8 1]);

% ----- WIRELESS L = 4 -----
figure;
semilogy(SNR_dB, BER_wireless(3,:), '-g*', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('Wireless Channel — L = 4');
legend('Wireless L=4', 'Location', 'northeast');
axis([-20 80 1e-8 1]);

% ====================================================
%   2️⃣ COMBINED PLOT
% ====================================================
figure;
semilogy(SNR_dB, BER_wired, 'k-o', 'LineWidth', 2,...
    'DisplayName','Wired (AWGN)'); 
hold on;

for i = 1:length(L_values)
    semilogy(SNR_dB, BER_wireless(i,:), '-s', 'LineWidth', 2,...
        'DisplayName', sprintf('Wireless L=%d', L_values(i)));
end

grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('AWGN vs Wireless Channel (Your Formula)');
legend('Location','northeastoutside');
axis([-20 80 1e-8 1]);
