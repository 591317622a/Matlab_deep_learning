function C = searchinitial(X,method,varargin)
%���������ռ��ʼ��������
%X �����ռ䣻 method: ����������varargin: ��������
switch lower(method(1))
    case 's' %sample
        K = varargin{1};
        C = X(randsample(size(X,1),K),:);
    case 'u' %uinform
        Xmins=min(X,[],1);
        Xmaxs=max(X,[],1);
        K=varargin{1};
        C = unifrnd(Xmins(ones(K,1),:),Xmaxs(ones(K,1),:));
end
