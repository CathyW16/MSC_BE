function [RBEs] = GetBoltzEntrA3(A)
%UNTITLED9 此处显示有关此函数的摘要
%   此处显示详细说明
G=A;
RBEs=[];
while (size(G,1)>=2 && size(G,2)>=2 && size(G,3)>=2)
    new_grid=zeros(size(G,1)/2,size(G,2)/2,size(G,3)/2);
    RBE=0;
    new_r=1;
    for r = 1:2:size(G,1)
        new_c=1;
        for c = 1:2:size(G,2)
            new_t=1;
            for t = 1:2:size(G,3)
                m=round(mean([G(r,c,t),G(r+1,c,t),G(r,c+1,t),G(r,c,t+1),G(r,c+1,t+1),G(r+1,c,t+1),G(r+1,c+1,t),G(r+1,c+1,t+1)]));
                temp=one_to_eight([G(r,c,t),G(r+1,c,t),G(r,c+1,t),G(r,c,t+1),G(r,c+1,t+1),G(r+1,c,t+1),G(r+1,c+1,t),G(r+1,c+1,t+1)]);
%                 ma=max([G(r,c,t),G(r+1,c,t),G(r,c+1,t),G(r,c,t+1),G(r,c+1,t+1),G(r+1,c,t+1),G(r+1,c+1,t),G(r+1,c+1,t+1)]);
%                 mi=min([G(r,c,t),G(r+1,c,t),G(r,c+1,t),G(r,c,t+1),G(r,c+1,t+1),G(r+1,c,t+1),G(r+1,c+1,t),G(r+1,c+1,t+1)]);
                %             temp=temp;
                %             s=log10(temp);
                s=log10(temp);%(ma-mi)*
                %             s1=log10(temp);
                %             (size(A,1)/size(new_grid,1))^2
                RBE=RBE+s;
                new_grid(new_r,new_c,new_t)=m;
                new_t=new_t+1;
            end
            new_c=new_c+1;
        end
        new_r=new_r+1;
    end
    RBEs=[RBEs,RBE/(size(new_grid,1))^3];
    G=new_grid;
end
% ABE=sum(RBEs(2:end-2));
% RBE=RBEs(1);
