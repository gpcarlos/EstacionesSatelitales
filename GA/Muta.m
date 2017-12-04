function newPob=Muta(newPob,Pmut,N)
    i=1;
    while i<=size(newPob,1)
        if rand>Pmut
            indices = 1:N; %satelites
            conjunto_posible = setdiff(indices, newPob(i,:));
            %posibles satelites a seleccionar
            Repacambiar=randi(size(newPob,2));
            ELelegido=conjunto_posible(randi(size(conjunto_posible,2)));
            newPob(i,Repacambiar)=ELelegido;
            % Elegimos uno al azar y muta
        end
        i=i+1;
    end
end