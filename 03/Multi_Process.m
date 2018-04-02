function [Gi,ng] = Multi_Process(I,g,n)
%��߶ȱ�Ե��⺯�� 
%I, ͼ����� G �߶Ƚṹ�� n �߶Ȳ���
%Gi ��Եͼ�� ng ��߶ȽṹԪ��
if nargin<3
    n=6;
end
%�����߶ȽṹԪ��
ng = g;
for i=1:n
    ng = imdilate(ng,g);
end
%ͼ�񿪲���
Gi1 = imopen(I,ng);
%����
Gi1 = imdilate(Gi1,ng);
%�ղ���
Gi2 = imclose(I,ng);
%��ʴ����
Gi2 = imerode(Gi2,ng);
%��������
Gi = imsubtract(Gi1,Gi2);
