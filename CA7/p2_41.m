t = 0:0.1:10; 
f_t = (2*exp(-t)-t.*exp(-t)) .* (t >= 0);

plot(t, f_t, 'LineWidth', 2);
xlabel('Time (t)');
ylabel('f(t)');
title('2*e(-1*t)-t*e(-1*t)');
grid on;
legend('2*e(-1*t)-t*e(-1*t)');