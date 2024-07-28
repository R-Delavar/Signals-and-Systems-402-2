function dcdMsg=decoding_amp(EncodedSignal,bitRate)

    count=size(EncodedSignal);
    fs=100;
    Mapset=MapsetBuilder();
    
    correlationResult=[];
    t=zeros(count(1),100);

    for i=1:count(1)
        t(i,:)=linspace(i-1,i,fs);
    end
    
    for k=1:count(1)
        corr_2d=0.01*sum((2*sin(2*pi*t(k,:))).*(EncodedSignal(k,:)));
        correlationResult=[correlationResult corr_2d];
        correlationResult=double(correlationResult);
    end

    y=zeros(1,2^bitRate);
    for i=1:2^bitRate
        y(1,i)=(i-1)/(2^bitRate-1);
    end
    
    meanMatrix=zeros(1,2^bitRate-1);
    for l=1:2^bitRate-1
        meanMatrix(1,l)=(y(1,l+1)-y(1,l))/2+y(1,l);
    end
    
    x = cell(1, 2^bitRate);
    for i=0:2^bitRate-1
        x{i+1} = dec2bin(i,bitRate);
    end
    
    BinaryMsg=[];
    for i=1:count(1)
        for j=1:2^bitRate-1
            if abs(correlationResult(1,i))>meanMatrix(1,j) && abs(correlationResult(1,i))<= y(1,j+1)
                BinaryMsg=[BinaryMsg x(1,j+1)];
            end
            if abs(correlationResult(1,i))< meanMatrix(1,j) && abs(correlationResult(1,i))>= y(1,j)
                BinaryMsg=[BinaryMsg x(1,j)];
            end
            if abs(correlationResult(1,i))>1
                BinaryMsg=[BinaryMsg x(1,2^bitRate)];
            end
               
        end
    end
    BinaryMsg=cell2mat(BinaryMsg);

    BinMsgLen = length(BinaryMsg);
    counter = 1;
    for k = 1 : 5 : BinMsgLen
        index1 = k;
        index2 = min(k + 5 - 1, BinMsgLen);
        out{counter} = BinaryMsg(index1 : index2);
        counter = counter + 1;
    end
    BinaryMsg = out ;

    dcdMsg=[];
    MapsetLen=size(Mapset);
    msgLen=round(count(1)*bitRate/5);
    for m=1:msgLen
        for n=1:MapsetLen(1,2)
            if strcmp(BinaryMsg(1,m),Mapset(2,n))==1
                dcdMsg=[dcdMsg  Mapset(1,n)];
            end
        end
    end
    dcdMsg=strjoin(dcdMsg,'');
%    disp(dcdMsg)
end