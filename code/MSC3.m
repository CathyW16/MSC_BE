function [comp] = MSC3(A1,lambda0,start,last,mode)

% p = inputParser;            % 函数的输入解析器
% addParameter(p,'weight',ones(1,size(A1,3)));      % 设置变量名和默认参数
% parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值
% A1=round(A1,8);
% A1=single(A1);
% lambda0=single(lambda0);

n=size(A1,1);
compl_steps=log2(n)/log2(lambda0);
% compl_steps=10;
% lambda0=2;
over=zeros(1,compl_steps);
A2=zeros(size(A1));
% over=single(zeros(1,compl_steps));
% A2=single(zeros(size(A1)));
if mode==0
    for k=1:compl_steps
        lambda=lambda0^k;
        if mod(k,2)==1
            [A2,over] = complexity3(A1, A2, n, lambda, over, k);
        else
            [A1,over] = complexity3(A2, A1, n, lambda, over, k);
        end
    end
else
    for k=1:compl_steps
        lambda=lambda0^k;
        if mod(k,2)==1
            [A2,over] = complexity_RGB(A1, A2, n, lambda, over, k);
        else
            [A1,over] = complexity_RGB(A2, A1, n, lambda, over, k);
        end
    end
end
% save over over
comp=sum(sum(abs(over(start:last))));
% o=over(start:last);
end

