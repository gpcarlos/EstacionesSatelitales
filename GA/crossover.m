% Devuelve la los nuevos individudos a partir de los cruces
% entre los padres

function offsGlobal=crossover(couples,Pop,type)
% p: two parents to cross
% f1 & f2: crossover points
% offs: two offsprings

    switch type
    case 'OX'

      N=size(Pop,2); offsGlobal=[];
      f1=round(N*0.2); f2=round(N*0.8); % f1 el 20% y f2 el 80%
      while size(couples,1) ~= 0
          p=Pop(couples(1,:),:);
          couples(1,:)=[];

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

    case 'PMX'
        offsGlobal =[];

        f1=randi(length(Pop(1,:)));
        while f1==length(Pop(1,:))
            f1=randi(length(Pop(1,:)));
        end

        f2=randi(length(Pop(1,:)));
        while f2==f1
            f2=randi(length(Pop(1,:)));
        end

        aux=f1;
        if f2<f1
            f1=f2;
            f2=aux;
        end

        i=1;
        while i<=size(couples,1)
            aux1=Pop(couples(i,1),:);
            aux2=Pop(couples(i,2),:);

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
             offsGlobal=[offsGlobal;offs];
             i=i+1;
        end

    end % switch

end
