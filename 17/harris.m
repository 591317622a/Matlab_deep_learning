function varargout=harris(I,k,q,h)
% I,ԭʼ�Ҷ�ͼ
% k = ��������
% q = ����ˮƽ
% h = �˲�Ȩֵ

%��������������
narginchk(0,4);
nargoutchk(0,2);

%�Ҷ�ͼ��
if nargin<1
    I = checkerboard(50,2,2);
end
%�������� k ,ȡֵ��Χһ�� 0.04~0.06
if nargin<2
    k = 0.04;
end
%����ˮƽq ,��R<q*Rmax,����Ϊ�ǽǵ�
if nargin<3
    q = 0.01;
end
%��˹Ȩֵh,���ø�˹ƽ������ͼ������
if nargin<3
    h = fspecial('gaussian',[5 5],1.5);
end

% 1 ���ò�����ӽ����˲����Ix,Iy
fx = [-2,-1,0,1,2];
Ix = filter2(fx,I);
fy = [-2,-1,0,1,2];
Iy=filter2(fy,I);

% 2 ��˹�˲�ƽ������ͻ���㣬�������M
Ix2 = filter2(h,Ix.^2);
Iy2 = filter2(h,Iy.^2);
Ixy = filter2(h,Ix.*Iy);

% ����ÿһ�����ص��harris��Ӧֵ
% m = [a,c,c,b];
%R = det(m)-k*(trace(m))^2;
% =(a*b-c^2)-k*(a+b)^2;
rfcn = @(a,b,c)(a*b-c^2)-k*(a+b)^2;
R = arrayfun(rfcn,Ix2,Iy2,Ixy);
%��������ˮƽȥ����Ӧֵ�͵ĵ�
R(R<q*max(R(:)))=0;

%4 �ҳ�[8,8]�����������Ӧֵ��Ϊ�ǵ�
[xp,yp] = find(imregionalmax(R,8));

%�����������
if nargout == 0
    subplot(121);
    imshow(I)
    hold on
    plot(xp,yp,'ro');
    title('�Լ���дHARRIS');
    
    subplot(122);
    cp = corner(I);
    imshow(I)
    hold on
    plot(cp(:,1),cp(:,2),'ro');
    title('MATLAB�Դ�CORNER����');
elseif nargout ==1
    vargout={[xp,yp]};
elseif nargout ==2
    vargout={xp,yp};
end
