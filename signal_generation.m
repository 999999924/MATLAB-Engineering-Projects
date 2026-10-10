clear;
clc;
close all;

Fs = 1000;                 % Sampling frequency: 1000 Hz
t = 0:1/Fs:0.1;            % 0 ile 0.1 saniye arasi

f1 = 50;                   % Birinci sinyal: 50 Hz
f2 = 100;                  % Ikinci sinyal: 100 Hz

x1 = sin(2*pi*f1*t);       % 50 Hz sinus
x2 = sin(2*pi*f2*t);       % 100 Hz sinus

figure;
plot(t, x1, 'b');          % Birinci sinyal: mavi
hold on;                  % Mevcut grafigi koru
plot(t, x2, 'r');          % Ikinci sinyal: kirmizi

xlabel('Time (s)');
ylabel('Amplitude');
title('50 Hz vs 100 Hz');
legend("50 Hz","100Hz")
grid on;


% Frequency-domain analysis using FFT

y = x1 + x2;              % Iki sinyali topluyoruz
N = length(y);            % Toplam ornek sayisi

Y = fft(y);               % Zaman domeninden frekans domenine gecis
P2 = abs(Y/N);            % Iki tarafli genlik spektrumu

P1 = P2(1:floor(N/2)+1);  % Pozitif frekanslari al
P1(2:end-1) = 2*P1(2:end-1);

freq = Fs*(0:floor(N/2))/N;

figure;
plot(freq, P1);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('FFT of 50 Hz + 100 Hz Signal');
grid on;