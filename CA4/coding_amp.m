function EncodedMsg = coding_amp(inputMsg , bitRate)
    mapset = MapsetBuilder();
    Fs=100;
    n=(strlength(inputMsg)*5)/bitRate;
    ImbinarizedMsg = []; 
    for char = inputMsg
        index = find([mapset{1,:}] == char, 1);
        if ~isempty(index)
            ImbinarizedMsg = [ImbinarizedMsg mapset{2, index}];
        else
            error(['Character ', char, ' does not exist in the dataset.']);
        end
    end

    stringLength = length(ImbinarizedMsg);

    loopCounter = 1;
    for i = 1 : bitRate : stringLength
        index1 = i;
        index2 = min(i + bitRate - 1, stringLength);
        outputMsg{loopCounter} = ImbinarizedMsg(index1 : index2);
        loopCounter = loopCounter + 1;
    end
    
    ImbinarizedMsg = outputMsg ;
    
    
    x = cell(1, 2^bitRate);
    
    for i=0:2^bitRate-1
        x{i+1} = dec2bin(i,bitRate);
    end

    y=zeros(1,2^bitRate);
    for i=1:2^bitRate
        y(1,i)=(i-1)/(2^bitRate-1);
    end


    t=zeros(n,100);
    for i=1:n
        t(i,:)=linspace(i-1,i,Fs);
    end
    Coeffs=[];
    for i=1:n
        for j=1:2^bitRate
            if strcmp(ImbinarizedMsg(1,i),x(1,j))==1
                Coeffs=[Coeffs y(1,j)];
            end
        end
    end

    [~,encMsgLen] = size(Coeffs);

    EncodedMsg=zeros(n,100);
    for i=1:encMsgLen
            EncodedMsg(i,:)=Coeffs(1,i).*sin(2*pi*t(i,:)); 
    end
    
    
  %  for i=1:n
  %      title(["BitRate = " , int2str(bitRate) ]);
  %      plot(t(i,:),EncodedMsg(i,:),'g');
  %      hold on 
  %  end
end