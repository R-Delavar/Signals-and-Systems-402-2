function codedImage = coding(dataset, grayImage, message, blockSize, blockVarianceThreshold)
    BinaryMessage = messageBinarizer(message, dataset);
    semicolonIndex = find([dataset{1,:}] == ';', 1);
    BinaryMessage = [BinaryMessage dataset{2, semicolonIndex}];
    
    codedImage = grayImage;
    [rows, cols] = size(grayImage); 
    Counter = 1;  
    for i = 1:blockSize(1):rows-4
        for j = 1:blockSize(2):cols-4

            chosenBlock = grayImage(i:i+4, j:j+4);
            if var(double(chosenBlock(:))) > blockVarianceThreshold
                for x = i:i+4
                    for y = j:j+4
                        if Counter > length(BinaryMessage), break; end
                        codedImage(x, y) = bitset(codedImage(x, y), 1, BinaryMessage(Counter) - '0');
                        Counter = Counter + 1; 
                    end
                end
            end
        end
    end

    if Counter <= length(BinaryMessage)
        error('Message length is too much; can not be fitted into picture');  % Raise an error if not all bits were encoded
    end
end
