function matriz_asignaciones=nueva_asignaciones(space,actual,pos)
    tam = size(space,1) - length(actual); %tamanno de las combinaciones posibles
    matriz_asignaciones = zeros(tam,length(actual)); %valor de retorno con todos los sucesores
    
    indices = 1:size(space,1); %satelites
    conjunto_posible = setdiff(indices, actual); %posibles satelites a seleccionar
    
    i=1;
    while i<=tam %solo vamos a modificar un elemento de la configuracion
        matriz_asignaciones(i,1) = conjunto_posible(i); %vamos metiendo cada satelite no seleccionado
        matriz_asignaciones(i,2:end) = setdiff(actual,actual(find(actual==pos))); %rellenamos con el resto de la configuracion
                                                                    %que se queda estatico
        i=i+1;
    end
end