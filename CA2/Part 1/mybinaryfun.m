function [binaryPic] = mybinaryfun(grayPicture, threshold)
    binaryPic = grayPicture > threshold;
    imshow(binaryPic);
    binaryPic = ~binaryPic;
end