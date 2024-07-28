clc
clear
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

N=length(recieved);
m2=fftshift(fft(recieved));
theta2 = angle(m2);
m2=abs(m2);
[mx,col]=maxk(m2,4);
fnew1=(col(2)-N/2-1)*fs/N;
pha1=abs(theta2(col(2)));
fnew2=(col(4)-N/2-1)*fs/N;
pha2=abs(theta2(col(4)));
fdfound1=fnew1-fc;
fdfound2=fnew2-fc;

Vfound1=fdfound1/beta*36/10;
Vfound2=fdfound2/beta*36/10;
Rfound1=pha1/(2*pi*(fdfound1+fc)*ro)*0.001;
Rfound2=pha2/(2*pi*(fdfound2+fc)*ro)*0.001;

fprintf("V1 = %f, R1 = %f\n", Vfound1, Rfound1);
fprintf("V2 = %f , R2 = %f" , Vfound2, Rfound2);