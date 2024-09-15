function [comp] = MSC(A1,lambda0,start,last)

% p = inputParser;            % ���������������
% addParameter(p,'weight',ones(1,size(A1,3)));      % ���ñ�������Ĭ�ϲ���
% parse(p,varargin{:});       % ������������н����������⵽ǰ��ı�������ֵ������±���ȡֵ

n=size(A1,1);
compl_steps=log2(n)/log2(lambda0);
% compl_steps=10;
% lambda0=2;
over=zeros(1,compl_steps);
% over=zeros(start,last);
A2=zeros(size(A1));
for k=1:compl_steps
    lambda=lambda0^k;
    if mod(k,2)==1
        [A2,over] = complexity(A1, A2, n, lambda, over, k);
%         [A2,over] = complexity_abs(A1, A2, n, lambda, over, k);
    else
        [A1,over] = complexity(A2, A1, n, lambda, over, k);
%         [A1,over] = complexity_abs(A2, A1, n, lambda, over, k);
    end
end
% save over over
% comp=sum(sum(abs(over)));
comp=sum(sum(abs(over(start:last))));
% over=abs(over);
end

