fs=50;
t=-1:1/fs:0.98;
x1=cos(10*pi*t);
plot(t,x1)  
title('cos(10*pi*t)')

figure()
f1=-25:1/2:24.5;
y1=fftshift(fft(x1));
y1=y1/max(abs(y1));
plot(f1,abs(y1))
xlabel('Frequency')
ylabel("F(x1)")
title("cos(10*pi*t)")
