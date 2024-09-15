function [A2,over] = complexity3(A1, A2, n, lambda, over, l)
overlap2 = 0;
overlap1 = 0;
overlap3 = 0;
n_bl = n/lambda;
for n1_counti = 1:n_bl
    for n1_countj = 1:n_bl
        for n1_countk = 1:n_bl
            renorm=0;
            for counti = 1:lambda
                for countj = 1:lambda
                    for countk = 1:lambda
                        renorm= renorm + A1((n1_counti-1) * lambda + counti, (n1_countj-1) * lambda + countj, (n1_countk-1) * lambda + countk);
                    end
                end
            end
            ren_r = lambda * lambda * lambda;
            for counti= 1 :lambda
                for countj = 1:lambda
                    for countk = 1:lambda
                        A2((n1_counti-1) * lambda + counti , (n1_countj-1) * lambda + countj, (n1_countk-1) * lambda + countk)=renorm./ren_r;
                    end
                end
            end
        end
    end
end

for k = 1:n
    for j = 1:n
        for m = 1:n
            overlap1=overlap1+ A1(k,j,m)*A1(k,j,m);
            overlap2=overlap2+ A1(k,j,m)*A2(k,j,m);
            overlap3=overlap3+ A2(k,j,m)*A2(k,j,m);
        end
    end
end
o1 = overlap1/n/n/n;
o2 = overlap2/n/n/n;
o3 = overlap3/n/n/n;
over(l)= o2 - 0.5 * (o1 +  o3);
end

