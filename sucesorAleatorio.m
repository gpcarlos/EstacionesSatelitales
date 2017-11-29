function sucesor=sucesorAleatorio(space,actual,pos)
    %devuelve un sucesor aleatorio entre los seleccionados
    S=nueva_asignaciones(space,actual,pos);
    aleatorio=randperm(length(actual)-1);
    sucesor = S(aleatorio(1),:);
    
end