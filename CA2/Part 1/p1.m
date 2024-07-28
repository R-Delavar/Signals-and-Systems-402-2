clc
clear
%%
% Question 1
[file , path] = uigetfile({'*.jpg; *.bmp; *.png; *.tif'},'please enter the photo');
sourceFile = [path, file];
picture  = imread(sourceFile);
figure
subplot(1,2,1)
imshow(picture);
%%
% Question 2
picture = imresize(picture, [300,500]);
subplot(1,2,2)
imshow(picture);
%%
% Question 3
picture = mygrayfun(picture);
figure
imshow(picture);
%%
% Question 4
threshold = 100;
picture = mybinaryfun(picture,threshold);
figure
imshow(picture);
%%
%ًQuestion 5
noise = 350;
frameSize = 2300;
withoutNoise = myremovecom(picture, noise);
frame = myremovecom(picture,frameSize);
picture = withoutNoise - frame;
figure
imshow(picture);
%%
%Question 6
[L,Ne] = mysegmentation(picture);
propied=regionprops(L,'BoundingBox');
hold on
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
%%
%Question 7
load TRAININGSET;
totalLetters=size(TRAIN,2);
figure
final_output=[];
t=[];
for n=1:Ne
    [r,c]=find(L==n);
    Y=picture(min(r):max(r),min(c):max(c));
    imshow(Y)
    Y=imresize(Y,[42,24]);
    imshow(Y)
    pause(0.2)

    ro=zeros(1,totalLetters);

    for k=1:totalLetters   
        ro(k)=corr2(TRAIN{1,k},Y);
    end
    [MAXRO,pos]=max(ro);
    if MAXRO>.45
        out=cell2mat(TRAIN(2,pos));       
        final_output=[final_output out];
    end
end
%%
%ًQuestion 8
file = fopen('number_Plate.txt', 'wt');
fprintf(file,'%s\n',final_output);
fclose(file);
winopen('number_Plate.txt')
