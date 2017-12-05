function asignaciones=nueva_asignaciones(space,actual,pos)
    tam = size(space,1) - length(actual); % Tamano de las combinaciones posibles
    asignaciones = zeros(tam,length(actual)); % Inicializacion de asignaciones

    indices = 1:size(space,1); % Total de satelites
    conjunto_posible = setdiff(indices, actual);
    % Posibles satelites a seleccionar. Quitamos las representantes actuales

    i=1;
    while i<=tam % Solo vamos a modificar un elemento de la configuracion
        asignaciones(i,1) = conjunto_posible(i);
        %vamos metiendo cada satelite no seleccionado
        asignaciones(i,2:end) = setdiff(actual,actual(find(actual==pos)));
        %rellenamos con el resto de la configuracion que se queda estatico
        i=i+1;
    end
end
