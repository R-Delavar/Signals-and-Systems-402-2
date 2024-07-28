fc = 5;
tstart = 0;
tend = 1;
fs = 100;
t = tstart:(1/fs):tend;
signal = cos(2*pi*fc*t);

plot(t,signal)
title('sent signal')