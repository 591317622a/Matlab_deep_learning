clc;close all;
%��ȡ
tic
I = imread('0000.bmp');
I = double(I)/255;
subplot(231)
imshow(I);
title('ԭʼͼ��');

%��ͬ��������ͼ
for i=2:6
    G = imkmeans(I,i);
    subplot(2,3,i);
    imshow(G,[]);
    title(['�������=',num2str(i)]);
end
toc
