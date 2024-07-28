function signalwNoise=noiseAdder(CodedMsg , sigma)
    num=size(CodedMsg);
    fs=100;
    encodedSignalLen=size(CodedMsg);
    
    noise=sigma*randn(encodedSignalLen(1),encodedSignalLen(2));
    
    signalwNoise=CodedMsg+noise;
    t=zeros(num(1),fs);
    

    for i=1:num(1)
        t(i,:)=linspace(i-1,i,fs);
    end
  %  figure()
  %  for k=1:num(1)
  %      plot(t(k,:),signalwNoise(k,:),'b');
  %      hold on 
  %  end
end