clc
clear
[x, sampleFrequency] = audioread("recording.wav");
N=length(x);
t = linspace(0, N/sampleFrequency, N);
plot(t, x);
xlabel('time (s)');