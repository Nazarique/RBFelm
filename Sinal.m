function [y] = Sinal(u) % u - Entrada da fun��o % l - Limite da fun��o
    l = 0.5;
    for j=1:size(u,2)
        for i=1:size(u,1)
               
            if (u(i,j) >= l )
                y(i,j) = 1;
            else 
                y(i,j) = 0;
            end
        end
    end
end