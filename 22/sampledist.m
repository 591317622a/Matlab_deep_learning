function D = sampledist(X,C,method,varargin)
%���������ռ�;������ĵ�C �ľ���
%x �����ռ䣬nxp ����
% C �������ģ�kxp����
% method: ���빫ʽ
% varargin: ��������
% D ��ÿ���㵽�������ĵ�ŷ�Ͼ���
[n,p] = size(X);
K = size(C,1);
%��ʼ���������
D =zeros(n,K);
switch lower(method(1))
    %ѭ������������ĵľ���
    case 'e' %euclidean
        for i=1:K
            D(:,i) = (X(:,1)-C(i,1)).^2;
            for j = 2:p
                D(:,i) = D(:,i)+(X(:,j)-C(i,j)).^2;
            end
        end
    case 'c' %cityblock
        for i = 1:K
            D(:,i) =abs(X(:,1)-C(i,1));
            for j = 2:p
                D(:,i) = D(:,i)+abs(X(:,j)-C(i,j));
            end
        end
end
