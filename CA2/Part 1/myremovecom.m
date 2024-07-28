function binaryImage = myremovecom(binaryImage, minArea)
    labeledImage = zeros(size(binaryImage));
    currentLabel = 1;
    [rows, cols] = size(binaryImage);
    for i = 1:rows
        for j = 1:cols
            if binaryImage(i, j) == 1 && labeledImage(i, j) == 0
                labeledImage = labelObject(binaryImage, labeledImage, i, j, currentLabel);
                currentLabel = currentLabel + 1;
            end
        end
    end
    
    areas = zeros(1, currentLabel - 1);
    for label = 1:(currentLabel - 1)
        areas(label) = sum(sum(labeledImage == label));
    end
    
    smallObjectsIdx = find(areas < minArea);
    
    for i = 1:numel(smallObjectsIdx)
        labeledImage(labeledImage == smallObjectsIdx(i)) = 0;
    end
    
    binaryImage = labeledImage > 0;
end

function labeledImage = labelObject(binaryImage, labeledImage, row, col, label)
    [rows, cols] = size(binaryImage);
    
    if row < 1 || row > rows || col < 1 || col > cols || binaryImage(row, col) == 0 || labeledImage(row, col) > 0
        return;
    end
    
    labeledImage(row, col) = label;
    for i=-1:1
        for j=-1:1
            labeledImage = labelObject(binaryImage, labeledImage, row+i, col+j, label);
        end
    end
end
