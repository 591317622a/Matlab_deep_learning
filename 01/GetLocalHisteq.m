function g = GetLocalHisteq(I)
%�ԻҶ�ͼ����оֲ����⻯
%I ����ͼ�����g ���ͼ��
g = adapthisteq(I,'clipLimit',0.02,'Distribution','rayleigh');
