function [g] = saida(x, qNeuro, w, var)
auxG = zeros(size(x,1),1);
         g = zeros(size(x,1),qNeuro);
         for i=1:qNeuro %separa os grupos por neuronio 
           for j=1:size(x,1)
               auxG(j) = sum((x(j,:) - w(i,:)).^2); %calcula as distancias das amostras de acordo com seus centroides
               auxG(j) = auxG(j)/(2*var(i));
           end 
           g(:,i) = exp(-auxG);
         end
end