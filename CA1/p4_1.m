clc
clear
[x, sampleFrequency] = audioread("recording.wav");
fprintf("sampling frequency: %d \n" , sampleFrequency);
time = 1:length(x);
plot(time',x);
xlabel('time (s)');
