function In =RemoveFogByGlobalHisteq(I,flag)
%�ֱ������ͨ�����о��⻯��Iԭʼͼ��flag��Ǿ���In ���ͼ��
if nargin<2
    flag=1;
end
%��ȡR,G,B����
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
%�ֱ������ͨ�����⻯
M = histeq(R);N = histeq(G);L = histeq(B);
%�õ����ͼ��
In = cat(3,M,N,L);
%��ʾ���
if flag
    figure;
    subplot(221);imshow(I);title('ԭͼ��','FontWeight','Bold');
    subplot(222);imshow(In);title('������ͼ��','FontWeight','Bold');
    %�ҶȻ������ڼ���ֱ��ͼ
    Q = rgb2gray(I);
    W = rgb2gray(In);
    subplot(223);imhist(Q,64);title('ԭʼ�Ҷ�ֱ��ͼ','FontWeight','Bold');
    subplot(224);imhist(W,64);title('�����ĻҶ�ֱ��ͼ','FontWeight','Bold');
end
