function message = decoding(codedImage, dataset, blockSize, Threshold)
    BinaryMessage = '';
    [rows, cols] = size(codedImage);

    for i = 1:blockSize(1):rows-4
        for j = 1:blockSize(2):cols-4
            block = codedImage(i:i+4, j:j+4);
            if var(double(block(:))) > Threshold
                for x = i:i+4
                    for y = j:j+4
                        BinaryMessage = [BinaryMessage, num2str(bitget(codedImage(x, y), 1))];
                    end
                end
            end
        end
    end

    message = BintoMsg(BinaryMessage, dataset);
end

