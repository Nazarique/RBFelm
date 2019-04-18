function [x] = Normalizar(x0) % Função para normalizar valores de entrada entre o intervalo de [Linf,Lsup].
   Lsup = 1; Linf = -1;
    for i=1:size(x0,2)
        x(:,i) = ((((Lsup-Linf)*(x0(:,i)-min(x0(:,i))))/(max(x0(:,i))-min(x0(:,i)))))+Linf;
    end
end