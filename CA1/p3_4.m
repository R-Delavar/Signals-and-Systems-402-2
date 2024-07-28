clc
clear
ts = 1e-9;
T = 1e-5;
tau = 1e-6;
t=0:ts:T;
t_len=length(t);
sent_signal = zeros(1,t_len);
sent_signal(1:round(tau/ts))=1;

alpha = 0.5;
R = 450;
C = 3e8; %speed of lights
recieved = zeros(1,t_len);

td = 2*R/C;
temp = ones(1,round(tau/ts));
ro=zeros(1,t_len);
recieved(round(td/ts):round((td+tau)/ts)-1) = alpha*1;
powers = 0 :0.1:5;
error_of_each_power = zeros(50,2);
p=1;
currentError=zeros(100,1);
for power = 0 :0.1:5
    currentError=zeros(100,1);
    for iteration = 1:100
        noise = power*randn(1,t_len);
        recieved = recieved + noise;
        ro = zeros(1,t_len);
        for i=1:t_len-round(tau/ts)
            ro(i)=sum(recieved(i:i+round(tau/ts)-1).*temp);
        end  
        [amplitude, distance_in_time] = max(ro);
        distance=distance_in_time*1e-9*C/2;
        error = abs(R-distance);
        currentError(iteration,1) = error;
    end
    error_of_each_power(p,1) = [mean(currentError)];
    error_of_each_power(p,2) = power;
    p=p+1;
end
plot(powers, error_of_each_power(:,1)');
xlabel('power');
ylabel('estimation error');
for i=1:10
    if error_of_each_power(i,1)>=10
        fprintf('maximum noise power for 10m error is: %f', error_of_each_power(i,2));
        break;
    end
end