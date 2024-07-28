function Message = BintoMsg(BinaryMessage, dataset)
    Message = '';
    for j = 1:5:length(BinaryMessage) - 4
        BinaryChar = BinaryMessage(j:j+4);  
        for i = 1:length(dataset(2, :))
            if strcmp(dataset{2, i}, BinaryChar)
                decodedChar = dataset{1, i};
                break;  
            end
        end
        if exist('decodedChar', 'var') && decodedChar == ';'
            break;  
        elseif exist('decodedChar', 'var')
            Message = [Message decodedChar]; 
        end
    end
    return;
end
