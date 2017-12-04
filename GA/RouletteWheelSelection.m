function padres=RouletteWheelSelection(FitPob)
    Prob=FitPob/sum(FitPob);
    SumProb=cumsum(Prob);
    i=1; padres=[];
    randoms=rand(length(FitPob),1);
    while i~=length(FitPob)+1
        sup=find(randoms(i)<SumProb);
        sup=min(sup);
        padres = [padres ; sup];
        i=i+1;
    end
end