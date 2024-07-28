clc;
clear;
chars = ['a':'z', ' ', '.', ',', '!', '"', ';'];

charCell = cell(2, length(chars));

for i = 1:length(chars)
    charCell{1, i} = chars(i);
end

for i = 1:32
    if i <= length(chars)
        charCell{2, i} = dec2bin(i-1, 5); 
    else
        break; 
    end
end
inputMessage = 'hi there;';
pic=imread('Amsterdam.jpg');
grayPic = rgb2gray(pic);

threshold = 70;
blockSize = [5,5];

coddedPic = coding(charCell, grayPic, inputMessage, blockSize, threshold);
subplot(1, 2, 1);
imshow(coddedPic);
title('Codded');

% Plot second image on the second subplot
subplot(1, 2, 2);
imshow(grayPic);
title('original')
decodedMessage = decoding(coddedPic, charCell, blockSize, threshold);
disp(decodedMessage);