function Watershed_Fun(fileName)
%��ں���
%fileName ͼ���ļ���
rgb = imread(fileName);
if ndims(rgb) == 3
    I = rgb2gray(rgb);
else 
    I = rgb;
end
sz = size(I);
if sz(1) ~=256
    I = imresize(I,256/sz(1));
    rgb = imresize(rgb,256/sz(1));
end
%y �����Ե��ȡ����
hy = fspecial('sobel');
%x �����Ե��ȡ����
hx = hy';
% ��ȡy�����Ե
Iy = imfilter(double(I),hy,'replicate');
%��ȡX�����Ե
Ix = imfilter(double(I),hx,'replicate');
%�����ݶ�ͼ��
gradmag = sqrt(Ix.^2+Iy.^2);
%��̬ѧ����
se = strel('disk',3);
%������
Io = imopen(I,se);
%ͼ��ʴ
Ie = imerode(I,se);
%ͼ���ؽ�
Iobr = imreconstruct(Ie,I);
%������
Ioc = imclose(Io,se);
%����
Iobrd = imdilate(Iobr,se);
%ͼ���ؽ�
Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
%ͼ����
Iobrcbr = imcomplement(Iobrcbr);
%����������
fgm = imregionalmax(Iobrcbr);
%��̬ѧ����
se2 = strel(ones(3,3));
%�ղ���
fgm2 = imclose(fgm,se2);
%��ʴ
fgm3 = imerode(fgm2,se2);
%���������
fgm4 = bwareaopen(fgm3,15);
%��ֵ��
bw = im2bw(Iobrcbr,graythresh(Iobrcbr));
%�����������
D = bwdist(bw);
%��ˮ��
DL = watershed(D);
%���˱���
bgm = DL == 0;
%������
gradmag2 = imimposemin(gradmag,bgm|fgm4);
%��ˮ��
L =watershed(gradmag2);
%��Ǿ������ɫ
Lrgb = label2rgb(L,'jet','w','shuffle');
[pathstr,name,ext] = fileparts(fileName);
%���ϵõ���ϸĿ¼
filefolder = fullfile(pwd,'ʵ����',[name,'_ʵ���ͼ']);
%�ж��ļ����Ƿ����
if ~exist(filefolder,'dir')
    mkdir(filefolder);
end
%��ʾ�м����
h1 = figure(1);
set(h1,'Name','ͼ��ҶȻ�','NumberTitle','off');
subplot(121);imshow(rgb,[]);title('ԭͼ��');
subplot(122);imshow(I,[]);title('�Ҷ�ͼ��');
fileurl = fullfile(filefolder,'1');
set(h1,'PaperPositionMode','auto');
print(h1,'-dtiff','-r200',fileurl);
h2 = figure(2);
set(h2,'Name','��̬ѧ����','NumberTitle','off');
subplot(121);imshow(rgb,[]);title('ԭͼ��');
subplot(122);imshow(I,[]);title('�Ҷ�ͼ��');
fuleurl = fullfile(filefolder,'2');
set(h2,'PaperPositionMode','auto');
print(h2,'-dtiff','-r200',fileurl);
h3 = figure(3);
set(h3,'Name','ͼ���ݶ���ʾ','NumberTitle','off');
subplot(121);imshow(rgb,[]);title('�������ͼ��');
subplot(122);imshow(gradmag,[]);title('�ݶ�ͼ��');
fileurl = fullfile(filefolder,'3');
set(h3,'PaperPositionMode','auto');
print(h3,'-dtiff','-r200',fileurl);
%��ʾ���
h4 = figure(4);imshow(rgb,[]);hold on;
himage = imshow(Lrgb);
set(h4,'Name','ͼ���ˮ��ָ�','NumberTitle','off');
%��ʾ����
set(himage,'AlphaData',0.3);
hold off;
fileurl = fullfile(filefolder,'4');
set(h4,'PaperPositionMode','auto');
print(h4,'-dtiff','-r200',fileurl);
