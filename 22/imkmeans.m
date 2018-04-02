function [F,C] = imkmeans(I,C)
%I ͼ����� ��C �������ģ� F ����������
if nargin ~=2
    error('IMKEANS:INPUT PARAMENTER NOT RIGHT','ֻ��������������');
end
if isempty(C)
    K = 2;
    C =[];
elseif isscalar(C)
    K =C;
    C =[];
else
    K=size(C,1);
end

%��ȡ���ص���������
X = exactvecotr(I);

%������ʼ��������
if isempty(C)
    C = searchinitial(X,'sample',K);
end
%ѭ��������������
Cprev=rand(size(C));
while true
    %�������������ĵľ���
    D = sampledist(X,C,'euclidean');
    %�ҳ������������
    [~,locs] = min(D,[],2);
    %ʹ��������ֵ�������ġ�
    for i=1:K
        C(i,:)=mean(X(locs==i,:),1);
    end
    %�жϾ����㷨�Ƿ�����
    if norm(C(:)-Cprev(:))<eps
        break
    end
    Cprev=C;
end

[m,n,~] = size(I);
F = reshape(locs,[m,n]);
