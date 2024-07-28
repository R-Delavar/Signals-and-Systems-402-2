t = 0:0.1:10; 
f_t = (100*exp(-100*t)) .* (t >= 0);

plot(t, f_t, 'LineWidth', 2);
xlabel('Time (t)');
ylabel('f(t)');
title('100*exp(-100*t)u(t)');
grid on;
legend('100*exp(-100*t)u(t)');