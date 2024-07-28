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

R1=250*1000;
R2=200*1000;

V1=180*10/36;
V2=216*10/36;

alpha1=0.5;
alpha2=0.6;

fd1=round(beta*V1);
fd2=round(beta*V2);

td1=ro*R1;
td2=ro*R2;

receivedSignal1=alpha1*cos(2*pi*(fc+fd1)*(t-td1));
receivedSignal2=alpha2*cos(2*pi*(fc+fd2)*(t-td2));
recieved=receivedSignal1+receivedSignal2;
figure()
plot(t,recieved)
title('Recevied from the Two Airplane')