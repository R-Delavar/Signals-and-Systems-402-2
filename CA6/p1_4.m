fc = 5;
tstart = 0;
tend = 1;
fs = 100;
t = tstart:(1/fs):tend-1/fs;

V=180*10/36;
R=250*1000;
beta=0.3;
alpha=0.5;
fd=beta*V;
c=3*1e9;
ro=2/c;
td=ro*R;
receivedSignal=alpha*cos(2*pi*(fc+fd)*(t-td));
sigma = 1;

receivedSignal=receivedSignal+sigma*randn(size(receivedSignal));
plot(receivedSignal);
title("Received Signal With Added Noise")
N=length(receivedSignal);
m=fftshift(fft(receivedSignal));
theta = angle(m);
m=abs(m);
[~,col]=find(m==max(m));
pha=abs(theta(col(2)));
fnew=(col(2)-N/2-1)*fs/N;
fdfound=fnew-fc;
foundV_withnoise=fdfound/beta*36/10;
foundR_withnoise=pha/(2*pi*(fdfound+fc)*ro)*0.001;
fprintf("Sigma of the noise: %f\n" , sigma);
fprintf("found distance: %f km\n", foundR_withnoise);
fprintf("found velocity: %f m/s\n" , foundV_withnoise);