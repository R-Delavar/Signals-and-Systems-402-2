function [pictureInGray] = mygrayfun(inputFile)
    pictureInGray = 0.299*inputFile(:,:,1) + 0.578* inputFile(:,:,2) + 0.114*inputFile(:,:,3);
end