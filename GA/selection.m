function parents=selection(FitPop,type)

    switch type
    case 'RouletteWheel'
        Prob=FitPop/sum(FitPop);
        SumProb=cumsum(Prob);
        i=1; parents=[];
        randoms=rand(length(FitPop),1);
        while i~=length(FitPop)+1
            sup=find(randoms(i)<SumProb);
            sup=min(sup);
            parents = [parents ; sup];
            i=i+1;
        end

    case 'Tournament'
        k=4;
        i=0; parents=[];
        while i~=length(FitPop)
            randoms = randi(length(FitPop),k,1);
            parents = [parents ; max(randoms)];
            i=i+1;
        end

    end

end
