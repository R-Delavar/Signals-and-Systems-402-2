function MsgwNoise=NoiseAdder(codedSignal , sigma)
    num=size(codedSignal);
    fs=100;
    encoded_message_size=size(codedSignal);
    
    noise=sigma*randn(encoded_message_size(1),encoded_message_size(2));
    
    MsgwNoise=codedSignal+noise;
    xAxis=zeros(num(1),fs);
    %figure()

    for i=1:num(1)
        xAxis(i,:)=linspace(i-1,i,fs);
    end
    
    for k=1:num(1)
        plot(xAxis(k,:),MsgwNoise(k,:),'b');
        hold on 
    end
end
