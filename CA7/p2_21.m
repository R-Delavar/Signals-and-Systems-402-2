t = 0:0.1:10; 
f_t = (sin(t)) .* (t >= 0);

plot(t, f_t, 'LineWidth', 2);
xlabel('Time (t)');
ylabel('f(t)');
title('sin(t)*u(t)');
grid on;
legend('sin(t)*u(t)');