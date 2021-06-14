clc;
load pcadb;  %loading all the varibales which we made in training Db

[filename,pathname]=uigetfile('*.*','Select the Input Image');
filewithpath=strcat(pathname,filename);
img=imread(filewithpath);
img0=img;

img=rgb2gray(img);
img=imresize(img,[M,N]);
img=double(reshape(img,[1,M*N]));
imgpca=(img-m)*Ppca; %projecting query image to pca space
distarray=zeros(n,1);  %initializing distance array all elements 0

for i=1:n
    distarray(i)=sum(abs(T(i,:)-imgpca)); %finding L1 distance
end

[result,index]=min(distarray);
resultimg=imread(sprintf('%d.jpg',index)); %getting best matched image
%plotting the recognized image
subplot(121);
imshow(img0);
title('Query Face');
subplot(122);
imshow(resultimg);
title('Recgognized Face');


    
