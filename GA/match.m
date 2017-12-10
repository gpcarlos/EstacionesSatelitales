% Devuelve las parejas de padres que se cruzarán

function couples = match(parents,Pcross)

    cp=find(rand(size(parents,1),1)< Pcross);
    parents=parents(cp); % Busca padres en puntos aleatorios

    if rem(size(parents,1),2)
        parents=parents(1:(size(cp,1)-1));
    end % obtener un número par de padres para poder redimensionar

    if  size(parents)<=1
        couples=[];
    else
        couples=reshape(parents,ceil(size(parents,1)/2),2);
        % los que salen el mismo indice los dejamos tal cual, son los que no se
        % cruzan y pasan directamente a la siguiente poblacion
    end
end
