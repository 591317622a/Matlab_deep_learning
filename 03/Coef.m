function ua = Coef(fa,f)
% �����Ȩϵ��
% fa ͼ����� f ͼ������
% ua ��Ȩϵ��
N = length(f);
s = [];
for i=1:N
    fi = f{i};
    si = spoles(fi,f);
    s = [s si];
end
sp = min(s(:));
sa = spoles(fa,f);
%����ka
ka = sp/sa;
k = 0;
for i =1:N
    fb = f{i};
    s = [];
    for i = 1:N
        fi = f{i};
        si = spoles(fi,f);
        s = [s si];
    end
    sp = min(s);
    sb = spoles(fb,f);
    %����kb
    kb = sp/sa;
    k = k+kb;
end
