function In = RemoveFogByLocalHisteq(I,flag)
%�ֱ������ͨ�����о��⻯��Iԭʼͼ��flag��Ǿ���In ���ͼ��
%�ֱ��������оֲ�ֱ��ͼ���⻯
g1 = GetLocalHisteq(I(:,:,1));
g2 = GetLocalHisteq(I(:,:,2));
g3 = GetLocalHisteq(I(:,:,3));
%���ɾֲ����⻯�Ľ��
In = cat(3,g1,g2,g3);
%��ʾ���
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
