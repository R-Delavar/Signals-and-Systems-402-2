function encoded_message=coding_freq(message,bit_rate)
    Mapset=mapsetBuilder();
    fs=100;
    n=(strlength(message)*5)/bit_rate;
    binaryMessage = []; 
    for char = message
        index = find([Mapset{1,:}] == char, 1);
        if ~isempty(index)
            binaryMessage = [binaryMessage Mapset{2, index}];
        else
            error(['Character ', char, ' does not exist in the dataset.']);
        end
    end

    stringLength = length(binaryMessage);
    loopCntr = 1;
    for k = 1 : bit_rate : stringLength
        index1 = k;
        index2 = min(k + bit_rate - 1, stringLength);
        out{loopCntr} = binaryMessage(index1 : index2);
        loopCntr = loopCntr + 1;
    end

    binaryMessage = out ;

    x = cell(1, 2^bit_rate);
    for i=0:2^bit_rate-1
        x{i+1} = dec2bin(i,bit_rate);
    end
    num_frequencies = 2^bit_rate;
    y = zeros(1, num_frequencies);
    step_size = 50 / (num_frequencies + 1);
    for i = 0:num_frequencies-1
        y(i+1) = round((i+1) * step_size);
    end
    y(y > 49) = 49;

    ts=1/fs;
    t=0:ts:1-ts; 
    freq=[];
    for i=1:n
        for j=1:2^bit_rate
            if strcmp(binaryMessage(1,i),x(1,j))==1
                freq=[freq y(1,j)];
            end
        end
    end

    encoded_message=zeros(n,100);
    for i=1:n
        encoded_message(i,:)=sin(2*pi*freq(1,i)*t);
    end

%    figure()
    t1=zeros(n,100); 
    for i=1:n
        t1(i,:)=linspace(i-1,i,fs); 
    end 
%    for k=1:n
%        plot(t1(k,:),encoded_message(k,:)); 
%        title('BitRate is :',bit_rate)
%        hold on 
%    end
end
