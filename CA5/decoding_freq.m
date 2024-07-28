function decodedMsg=decoding_freq(encodedMessage,bit_rate)
    x = cell(1,(2^bit_rate)); 
    for i=0:2^bit_rate-1 
        x{i+1} = dec2bin(i,bit_rate); 
    end 

    Mapset=mapsetBuilder();
    num=size(encodedMessage);
    fs=100;

    num_frequencies = 2^bit_rate;
    y = zeros(1, num_frequencies);
    step_size = 50 / (num_frequencies + 1);
    for i = 0:num_frequencies-1
        y(i+1) = round((i+1) * step_size);
    end
    y(y > 49) = 49;

    freq=-fs/2:1:fs/2; 
    I=[];
    for k=1:num(1)
        emF=abs(fftshift(fft(encodedMessage(k,:)))); 
        [~,loc]=max(emF); 
        fhat=abs(freq(loc));
        I=[I fhat];
    end

    meanY=zeros(1,2^bit_rate);
    for l=1:2^bit_rate-1
        meanY(1,l+1)=(y(1,l+1)-y(1,l))/2+y(1,l);
    end

    indexFinder=[];
    for i=1:num(1)
        for h=1:2^bit_rate-1
            if (I(1,i)>= meanY(1,h) && I(1,i)< meanY(1,h+1))|| I(1,i)==meanY(1,h)
                indexFinder=[indexFinder x(1,h)];
            end
        end
        if I(1,i)>meanY(1,2^bit_rate)
            indexFinder=[indexFinder x(1,2^bit_rate)];
        end
    end

    indexFinder=cell2mat(indexFinder);

    charSize = 5;
    stringLength = length(indexFinder);
    loopCntr = 1;
    for k = 1 : charSize : stringLength
        index1 = k;
        index2 = min(k + charSize - 1, stringLength);
        out{loopCntr} = indexFinder(index1 : index2);
        loopCntr = loopCntr + 1;
    end

    indexFinder = out ;
    
    decodedMsg=[];
    Mapset_len=size(Mapset);
    for i=1:num(1)*bit_rate/5
        for j=1:Mapset_len(1,2)
            if strcmp(indexFinder(1,i),Mapset(2,j))==1
                decodedMsg=[decodedMsg  Mapset(1,j)];
            end
        end
    end

    decodedMsg=strjoin(decodedMsg,'');
    disp(decodedMsg)
end