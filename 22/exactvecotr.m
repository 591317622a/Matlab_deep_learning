function vec = exactvecotr(img)
% ��imgͼ���л�ȡ����������������ɫ�����������
% img ͼ����󣬿���Ϊ�ҶȻ��߲�ɫ
% vec ���ص����������
%��ʼ������������ÿ�����Ӧһ����������
[m,n,~] = size(img);
vec = zeros(m*n,3);

%ת�����ض�����ɫ�ռ�
%img = rgb2lab(img);
img = double(img);

%ѭ�������������ص�
for j=1:n
    for i = 1:m
        %��ɫ����
        color = img(i,j,:);
        %��������
        %wx =1;wy=1;%����Ȩֵ
        %dist = [wx*j/n,wy*i/m];
        dist=[];
        %��������
        texture=[];
        %�����������
        vec((j-1)*m+i,:) = [color(:);dist(:);texture(:)];
    end
end
