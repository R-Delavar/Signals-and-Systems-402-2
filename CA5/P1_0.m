frequency=-10:1:9;
fs = 20;
time= 0:(1/fs):0.95;

x1=exp(1i*2*pi*5*time)+exp(1i*2*pi*8*time);
y1=fftshift(fft(x1));
plot(frequency,abs(y1))
xlabel('Frequency')
ylabel('X1(w)')
title('fourier transform of : X1(t) = exp(1i*2*pi*5*t1)+exp(1i*2*pi*8*t1)')

figure()
x2=exp(1i*2*pi*5*time)+exp(1i*2*pi*5.1*time);
y2=fftshift(fft(x2));
plot(frequency,abs(y2))
xlabel('X2(w)')
ylabel('Fourier')
title('fourier transform of : X2(t) = exp(1i*2*pi*5*t1)+exp(1i*2*pi*5.1*t1)')
