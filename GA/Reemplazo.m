function [Pob,FitPob]=Reemplazo(Pob,newPobMutada,FitPob,FitMutada)
    if size(newPobMutada,1)~=size(Pob,1)
        dif=size(Pob,1)-size(newPobMutada,1);
        [mejores,pos]=sort(FitPob,'descend');
        Pob=[newPobMutada ; Pob(pos(1:dif),:)];
        FitPob=[FitMutada ; mejores(1:dif)];
    end
    
%     n=size(Pob,1);
%     Pob=[newPobMutada;Pob];
%     FitPob=[FitMutada;FitPob];
%     
%     [~,ind]=sort(FitPob,'descend');
%     Pob=Pob(ind(1:n),:);
%     FitPob = FitPob(ind(1:n));
end
    