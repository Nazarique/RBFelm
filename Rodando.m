
clear all
clc
tic
rede = 'vinho';
qN = 5; %incremento de neuronios
Nm = 100; %qtdd maxima de neuronios
v = 1:(Nm/qN);
Dados = load('DadosVinho.mat');
Dados = Dados.x;
x = Dados(:,1:13);
d = Dados(:,14:end);

parfor i=1:size(v,2)  
    rbf_elm(i) = RBFelm(x, d, v(i)*qN);
end
save('ResultadoVinhoRBFelm.mat','rbf_elm');
toc

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
tic
rede = 'banco';
qN = 5; %incremento de neuronios
Nm = 100; %qtdd maxima de neuronios
v = 1:(Nm/qN);
Dados = load('bank_dados.txt');
x = Dados(:,1:(end-1));
d = Dados(:,end);

parfor i=1:size(v,2)  
    rbf_elm(i) = RBFelm(x, d, v(i)*qN);
end
save('ResultadoBankRBFelm.mat','rbf_elm');
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
tic
rede = 'Iris';
qN = 5; %incremento de neuronios
Nm = 50; %qtdd maxima de neuronios
v = 1:(Nm/qN);
Dados = load('Iris.txt');
x = Dados(:,1:4);
d = Dados(:,5:end);
parfor i=1:size(v,2)  
    rbf_elm(i) = RBFelm(x, d, v(i)*qN);
end
 save('ResultadoIrisRBFelm.mat','rbf_elm');
toc
