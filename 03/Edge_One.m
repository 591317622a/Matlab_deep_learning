function Gf = Edge_One(G,u)
%��Ե�ںϺ���
%G ��Եͼ������; u ��������
%Gf �����ں�ͼ��
if nargin<2
    u = rand(1,length(G));
    u = u/sum(u(:));
end
%��ʼ��
Gf = zeros(size(G{1}));
for i = 1:length
    Gf = Gf +u(i)*double(G{i});
end
%����ת��
Gf = im2uint8(mat2gray(Gf));
