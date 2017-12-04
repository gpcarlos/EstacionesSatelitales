function offsGlobal=OXcrossover(parejas,pob)
% p: two parents to cross
% f1 & f2: crossover points
% offs: two offsprings
%     clear all
%     pob = [1 2 3  4 5 6 7  8 9;
%           4 5 2  1 8 7 6  9 3];
%     parejas=[1 2];
    
    N=size(pob,2); offsGlobal=[];
    f1=round(N*0.2); f2=round(N*0.8); % f1 el 20% y f2 el 80%
    while size(parejas,1) ~= 0
        p=pob(parejas(1,:),:);
        parejas(1,:)=[];

        offs = zeros(2,N);
        offs(1,f1:f2)=p(1,f1:f2);
        offs(2,f1:f2)=p(2,f1:f2);

        p1=1;
        while p1<=2
            p2=mod(p1,2)+1;
            j=f2+1;
            k=f2+1;
            while j~=f1
                % conflicts checking
                cand=(p(p2,k)==offs(p1,:));
                if(~cand)
                    offs(p1,j)=p(p2,k);
                    j=mod(j,N)+1;
                end
                k=mod(k,N)+1;
            end
            p1=p1+1;
        end
        offsGlobal=[offsGlobal ; offs];
    end
    
end
