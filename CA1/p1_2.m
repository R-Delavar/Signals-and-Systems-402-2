clc
clear
t=0:0.01:1;
z1=sin(2*pi*t);
z2=cos(2*pi*t);

x0=[0.5;0.25];
y0=[0.2;-0.8];

s1='sin(2 \pi t)';
s2='cos(2 \pi t)';

figure('Position', [90, 90, 800, 400]);

subplot(2,2,1);
plot(t,z1,'--b');

text(x0(1), y0(1), s1); % Add label for subplot 1
title('Sine'); %Title
grid on %Add grid
legend('sine');
xlabel('time') % the name of X-axis
ylabel('amplitude') %the name of Y-axis


subplot(2,2,2);
plot(t,z2,'r');

text(x0(2), y0(2), s2); % Add label for subplot 2
legend('cosine');
title('Cosine'); %Title
xlabel('time') % the name of X-axis
ylabel('amplitude') %the name of Y-axis
grid on %Add grid