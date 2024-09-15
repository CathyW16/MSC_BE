function [A2,over] = complexity(A1, A2, n, lambda, over, l)

n_bl = n/lambda;
for n1_counti = 1:n_bl
    for n1_countj = 1:n_bl
        renorm=0;
        for counti = 1:lambda
            for countj = 1:lambda
                renorm= renorm + A1((n1_counti-1) * lambda + counti, (n1_countj-1) * lambda + countj);
            end
        end
        ren_r = lambda * lambda;
        for counti= 1 :lambda
            for countj = 1:lambda
                A2((n1_counti-1) * lambda + counti, (n1_countj-1) * lambda + countj)=renorm./ren_r;
            end
        end
    end
end
o=0;
for k = 1:n
    for h = 1:n
%         overlap1=overlap1+ A1(k,h).*A1(k,h);
%         overlap2=overlap2+ A1(k,h).*A2(k,h);
%         overlap3=overlap3+ A2(k,h).*A2(k,h);
o=o+(A1(k,h)-A2(k,h))^2;
    end
end
% o1 = overlap1/n/n;
% o2 = overlap2/n/n;
% o3 = overlap3/n/n;
over(l)=0.5*o/n/n; %o2 - 0.5 * (o1 +  o3);
end

