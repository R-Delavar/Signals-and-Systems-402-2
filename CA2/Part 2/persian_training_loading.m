clc;clear;close all;  

di=dir('Persian Map Set');
st={di.name};
nam=st(3:end);
len=length(nam);


PTRAIN=cell(2,len);
for i=1:len
   pic = imread(['Persian Map Set','/',cell2mat(nam(i))]);
   pic = im2gray(pic);
   threshold = graythresh(pic);
   pic = im2bw(pic,threshold);
   PTRAIN(1,i)={pic};
   temp=cell2mat(nam(i));
   PTRAIN(2,i)={temp(1)};
end

save('PTRAININGSET.mat','PTRAIN');
clear;