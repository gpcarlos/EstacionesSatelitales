% Devuelve los valores de los diferentes individuos de la población

function FitPop = evaluatePopulation(Pop,coordinates)
    i=1; FitPop=[];
    while i<=size(Pop,1)
        FitPop=[FitPop; -Fvalue(Pop(i,:),coordinates)];
        i=i+1;
    end
end
