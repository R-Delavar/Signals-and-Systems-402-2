clear
clc
%%
% part1:image input
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
figure
subplot(1,2,1)
imshow(picture)
%%
% part2: detecting the plate
boundingBoxes = detectplate_bluestrip(picture);
result = [];
for i = 1:size(boundingBoxes, 1)
    picture = imcrop(picture, boundingBoxes(i, :));
    figure
    imshow(picture);
    [a,b,~] = size(picture);
end
%%
%part3: RGB to Gray
figure
picture=rgb2gray(picture);
figure
subplot(1,2,1)
imshow(picture)

%%
% part4: Gray to Binary
threshold = graythresh(picture);
picture =~imbinarize(picture,threshold);
subplot(1,2,2)
imshow(picture)

%%
%part5: removing small objects + background
picture=imresize(picture,[300 1450]);
figure
[row,column,~] = size(picture);
picture = bwareaopen(picture,2000);
subplot(1,3,1)
imshow(picture)
background=bwareaopen(picture,20*column);
subplot(1,3,2)
imshow(background)
picture2=picture-background;
subplot(1,3,3)
imshow(picture2)
%%
%part6: labeling picture
figure
imshow(picture2)
[L,Ne]=bwlabel(picture2);
propied=regionprops(L,'BoundingBox');
hold on
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
%% 
% part7: Loading the mapset
load PTRAININGSET;
totalLetters=size(PTRAIN,2);
%%
% part8: correlation of each part with the mapset
final_output=[];
t=[];
for n=1:Ne
    [r,c]=find(L==n);
    Y=picture2(min(r):max(r),min(c):max(c));
    Y=imresize(Y,[60,50]);
    ro=zeros(1,totalLetters);
        for k=1:totalLetters   
            ro(k)=corr2(PTRAIN{1,k},Y);
        end
    [MAXRO,pos]=max(ro);
    if MAXRO>.50
        out=cell2mat(PTRAIN(2,pos));       
        final_output=[final_output , out];
    end
end
%%
% part8: Printing the plate
file = fopen('number_Plate.txt', 'wt');
fprintf(file,'%s\n',final_output);
fclose(file);
winopen('number_Plate.txt')