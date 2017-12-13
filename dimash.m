
filename = 'dimash.mp3';
Fs = 44100;
start_time = 280;
stop_time = 284;
samples = [start_time*Fs,stop_time*Fs];
clear y Fs
[y,Fs] = audioread(filename,samples);

%% fft
T = 1/Fs;             % Sampling period       
L = samples(2)-samples(1);             % Length of signal
t = (0:L-1)*T;        % Time vector

Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
%%
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of Dimash(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%% play samples 
mSample = audioplayer(y, Fs);
play(mSample);