function poblacion=PMXcrossover(parejas,pob)
% p: two parents to cross
% f1 & f2: crossover points
% offs: two offsprings

poblacion =[];

f1=randi(length(pob(1,:)));
while f1==length(pob(1,:))
    f1=randi(length(pob(1,:)));
end

f2=randi(length(pob(1,:)));
while f2==f1
    f2=randi(length(pob(1,:)));
end

aux=f1;
if f2<f1
    f1=f2;
    f2=aux;
end

i=1;
while i<=size(parejas,1) 
    aux1=pob(parejas(i,1),:);
    aux2=pob(parejas(i,2),:);
    
    p = [aux1;aux2];
     
     N=length(p);

     offs = zeros(2,N);
     % Copy values between f1:f2
     offs(1,f1:f2)=p(2,f1:f2);
     offs(2,f1:f2)=p(1,f1:f2);

     ic = [p(1,f1:f2);p(2,f1:f2)];
     em=find(offs(1,:)==0); %% empty positions to fill up
     p1=1;

     while p1<=2
         p2=mod(p1,2)+1;
         for j=em
            cand = p(p1,j); %%candidate value
            %  conflicts checking
            aux=cand;
            n=0;
            while sum(ic(p2,:) == cand) == 1
                cand = ic(p1,(ic(p2,:) == cand));
                if cand==aux
                    cand = ic(p1,n);
                    n=n+1;
                end
            end
            offs(p1,j) = cand;
         end
         p1=p1+1;
     end
     poblacion=[poblacion;offs];
     i=i+1;
end
end

