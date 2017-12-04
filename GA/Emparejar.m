function [parejas,NoParejas]=Emparejar(Padres,Pcross,itera)
        
    %rand('seed',1);
    N=size(Padres,1);  %% indices de los padres seleccionados

    cp=find(rand(N,1)< Pcross); % Busca padres en puntos aleatorios
    Padres=Padres(cp);
    if rem(size(Padres,1),2)
        Padres=Padres(1:(size(cp,1)-1));
    end % obtener un número par de padres para poder redimensionar
    
    if  size(Padres)<=1
        NoParejas=true;
        parejas=[];
    else
        NoParejas=false;
        parejas=reshape(Padres,ceil(size(Padres,1)/2),2);
        % los que salen el mismo indice los dejamos tal cual, son los que no se
        % cruzan y pasan directamente a la siguiente poblacion
    end
end


% PROBLEMA ORIGINAL

% %rand('seed',1);
%     N=size(Padres,1);  %% indices de los padres seleccionados
% 
%     cp=find(rand(N,1)< Pcross); % Busca padres en puntos aleatorios
%     Padres=Padres(cp);
%     if rem(size(Padres,1),2)
%         Padres=Padres(1:(size(cp,1)-1));
%     end % obtener un número par de padres para poder redimensionar
%     parejas=reshape(Padres,ceil(size(Padres,1)/2),2);
%     % los que salen el mismo indice los dejamos tal cual, son los que no se
%     % cruzan y pasan directamente a la siguiente poblacion

% SI NO TIENE SEED EL RAND, EN LA ITERACIÓN 2714 SOLO HAY UN 
% INDIVIDUO QUE CRUCE