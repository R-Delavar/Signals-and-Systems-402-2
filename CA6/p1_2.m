fc = 5;
tstart = 0;
tend = 1;
fs = 100;
t = tstart:(1/fs):tend;

V=180*10/36;
R=250*1000;
beta=0.3;
alpha=0.5;
fd=beta*V;
c=3*1e9;
ro=2/c;
td=ro*R;

receivedSignal=alpha*cos(2*pi*(fc+fd)*(t-td));
plot(t,receivedSignal)
title('Received Signal')