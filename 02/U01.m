clc;clear all;close all;
filename = fullfile(pwd,'02.jpg');
Img = imread(filename);
%�ҶȻ�
if ndims(Img) ==3
    I = rgb2gray(Img);
else
    I = Img;
end
%�������
Ig = imnoise(I,'poisson');
%��ȡ����
s = GetStrelList();
%����ȥ��
e = ErodeList(Ig,s);
%����Ȩ��
f = GetRateList(Ig,e);
%����
Igo = GetRemoveResult(f,e);
%��ʾ���
figure;
subplot(121);imshow(I,[]);title('ԭʼͼ');
subplot(122);imshow(Ig,[]);title('����ͼ��');
figure;
subplot(221);imshow(e.eroded_co12,[]);title('����1������');
subplot(222);imshow(e.eroded_co22,[]);title('����2������');
subplot(223);imshow(e.eroded_co32,[]);title('����3������');
subplot(224);imshow(e.eroded_co42,[]);title('����4������');
figure;
subplot(121);imshow(Ig,[]);title('����ͼ��');
subplot(122);imshow(Igo,[]);title('����ȥ��ͼ��');
%����PSNRֵ
psnr1 = PSNR(I,e.eroded_co12);
psnr2 = PSNR(I,e.eroded_co22);
psnr3 = PSNR(I,e.eroded_co32);
psnr4 = PSNR(I,e.eroded_co42);
psnr5 = PSNR(I,Igo);
psnr_list = [psnr1 psnr2 psnr3 psnr4 psnr5];
figure;
plot(1:5,psnr_list,'r+-');%�����е���󣬳��Ȳ�ƥ��
axis([0 6 18 24]);
set(gca,'XTick',0:6,'XTickLabel',{'','����1','����2','����3','����4','����',''});
grid on;
title('PSNR���߱Ƚ�');


