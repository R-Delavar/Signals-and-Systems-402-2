clc
clear
ts = 1e-9;
T = 1e-5;
tau = 1e-6;
t=0:ts:T;
t_len=length(t);
sent_signal = zeros(1,t_len);
sent_signal(1:round(tau/ts))=1;

subplot(2,2,1);
plot(t,sent_signal);
ylabel("Amplitude");
xlabel("Time");
hold on;

alpha = 0.5;
R = 450;
C = 3e8; %speed of lights
recieved = zeros(1,t_len);

td = 2*R/C;
recieved(round(td/ts):round((td+tau)/ts)-1) = alpha*1;
plot(t,recieved);
legend('sent signal','recieved signal');
hold on;
temp = ones(1,round(tau/ts));
ro=zeros(1,t_len);
for i=1:t_len-round(tau/ts)
    ro(i)=sum(recieved(i:i+round(tau/ts)-1).*temp);
end
subplot(2,2,2);
plot(t,ro);
legend('correlation result');
[amplitude, distance_in_time] = max(ro);
distance=distance_in_time*1e-9*C/2;
disp(distance);