function [RBEs] = GetBoltzEntr(grid)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
RBEs=[];
while size(grid,1)>=2 && size(grid,2)>=2
    new_grid=zeros(size(grid,1)/2,size(grid,2)/2);
    RBE=0;
    new_r=1;
    for r = 1:2:size(grid,1)
        new_c=1;
        for c = 1:2:size(grid,2)
            [temp,m]=one_to_four(grid(r,c),grid(r+1,c),grid(r,c+1),grid(r+1,c+1));
            s=log10(double(temp));
            RBE=RBE+s;
            new_grid(new_r,new_c)=m;
            new_c=new_c+1;
        end
        new_r=new_r+1;
    end
    RBEs=[RBEs,RBE];
    grid=new_grid;
end

end

