% Devuelve las nuevas asignaciones posibles de representantes modificando
% solo el satélite representante con índice pos

function assigments = new_assigments(coordinates,current,pos)

    tam = size(coordinates,1)-length(current);
    % Tamaño de las combinaciones posibles

    assigments = zeros(tam,length(current)); % Inicialización de asignaciones

    satellites = 1:size(coordinates,1);
    possible_set = setdiff(satellites, current);
    % Posibles satelites a seleccionar. Quitamos los representantes actuales

    i=1;
    while i<=tam
        assigments(i,1) = possible_set(i);
        % Vamos metiendo cada satelite no seleccionado
        assigments(i,2:end) = setdiff(current,current(find(current==pos)));
        % Y rellenamos con el resto de la configuracion que se queda estatico
        i=i+1;
    end
    
end
