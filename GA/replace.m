% Reemplaza la población con la nueva población

function [Pop,FitPop] = replace(Pop,newPop,FitPop,newFitPop,type)

    switch type
    case 'generational'
        if size(newPop,1)~=size(Pop,1)
            dif=size(Pop,1)-size(newPop,1);
            [best,pos]=sort(FitPop,'descend');
            Pop=[newPop ; Pop(pos(1:dif),:)];
            FitPop=[newFitPop ; best(1:dif)];
        else
          newPop = Pop;
          newFitPop = FitPop;
        end

    case 'elitist'
        N = size(Pop,1);
        Pop = [newPop;Pop];
        FitPop = [newFitPop;FitPop];
        [~,pos] = sort(FitPop,'descend');
        Pop = Pop(pos(1:N),:);
        FitPop = FitPop(pos(1:N));
    end

end
