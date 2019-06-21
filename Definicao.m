function [aux] = Definicao(y)
    aux = zeros(size(y,1),1);
    
    for i=1:size(y,1)
        achou = 0;
        for j=1:size(y,2) 
            if ( y(i,j) == 1 && achou ~= 1 )
                   aux(i) = j;
                   achou = 1;
            end
        end
    end
    
end
