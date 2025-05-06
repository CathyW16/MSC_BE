function [res,me] = one_to_four(v1,v2,v3,v4)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
window=[v1,v2,v3,v4];
s=sum(window);
me=round(mean(window));
ma=max(window);
mi=min(window);

temp=(s-ma-mi)/2;
x_a=floor(temp);
x_b=ceil(temp);
d_a=x_a-mi;
d_b=ma-x_b;
d=min([d_a,d_b]);

if d==0
    if d_a==d_b
        if x_a==x_b
            res=1;
        else
            res=6;
        end
    else
        if x_a==x_b
            res=4;
        else
            res=12;
        end
    end
else
    if d_a==d_b
        if x_a==x_b
            res=12+24*(d-1)+6;
        else
            res=24+24*(d-1)+6;
        end
    else
        if x_a==x_b
            res=12+24*(d-1)+12;
        else
            res=24+24*(d-1)+12;
        end
    end
end
        

