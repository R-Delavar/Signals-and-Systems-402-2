t = 0:0.1:10; 
f_t = (1/2 * exp(-3*t) - 3/2 * exp(-t) + 1) .* (t >= 0);
plot(t, f_t, 'LineWidth', 2);

xlabel('Time (t)');
ylabel('f(t)');
title('Plot of (1/2 * e^(-3t) - 3/2 * e^(-t) + 1) * u(t)');
grid on;
legend('(1/2 * e^(-3t) - 3/2 * e^(-t) + 1) * u(t)');