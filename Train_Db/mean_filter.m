
%arithmatic mean filter
clc;
clear ;
close all;
x=imread('301.jfif');
x1=x;
figure;imshow(x1)
title('original image')%loading image.
x2=rgb2gray(x1);
figure;imshow(x2);title('gray image');
[m,n]=size(x2);%storing size of image.
for i=1:m-3
    for j=1:n-3
        a=x(i:i+3,j:j+3);
        v(i,j)=sum(sum(a));
    end
end
y=mat2gray(v);
figure;imshow(y);
title('average image');