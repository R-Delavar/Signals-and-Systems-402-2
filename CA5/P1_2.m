figure()
fs=100;
t4=0:1/fs:0.99;
x4=cos(30*pi*t4+(pi/4));
plot(t4,x4)
title('cos(30*pi*t+(pi/4))')

figure()
y1=fftshift(fft(x4));
f1=-50:1:49;
plot(f1,abs(y1)/max(abs(y1)))
xlabel('Frequency')
ylabel('F(x1)')
title("cos(30*pi*t+(pi/4))")

figure()
tol = 1e-6;
y1(abs(y1) < tol) = 0;
theta = angle(y1);
plot(f1,theta/pi)
xlabel 'Frequency (Hz)'
ylabel 'Phase / \pi'
title("cos(30*pi*t+(pi/4))")