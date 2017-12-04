function FitPob=EvaluaPoblacion(Pob,space)
    i=1; FitPob=[];
    while i<=size(Pob,1)
        FitPob=[FitPob; Fvalu(Pob(i,:),space)];
        i=i+1;
    end
end
