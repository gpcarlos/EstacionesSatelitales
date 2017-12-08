% Delvuelve la población mutada

function Pop = mutation(Pop,Pmut,N)

    i=1;
    while i<=size(Pop,1)
        if rand>Pmut
            satellites = 1:N;
            possible_set = setdiff(satellites, Pop(i,:));
            %posibles satelites a seleccionar

            RepToChange=randi(size(Pop,2));
            TheChosenOne=possible_set(randi(size(possible_set,2)));
            Pop(i,RepToChange)=TheChosenOne;
            % Elegimos uno al azar y muta
        end
        i=i+1;
    end
    
end
