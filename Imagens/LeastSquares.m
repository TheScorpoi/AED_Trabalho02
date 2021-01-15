clear all; close all; clc;

% A parte do codigo sobre "Least Square Fit" foi retirado dos slides das
% disciplina (Pag.141) a data de 14/01/2021

% Visto que o primeiro valor de n de cada rotina que aparece no
% n_and_average_time.txt é sempre 10, encontramos assim um fator
% diferenciador para saber quando os valores de uma determinada rotina
% acabaram e devemos comecar outra


avg_time = load("n_and_average_time.txt");

indiceDeComeco = find(avg_time(:,1) == 10);
sizeAvg = size(avg_time);
indiceDeComeco(end+1) = sizeAvg(1);  
nomesRotinas = ["Bubble Sort" , "Shaker Sort", "Insertion Sort" , "Shell Sort" , "Quick Sort" , "Merge Sort" , "Heap Sort" , "Rank Sort", "Selection Sort"];


for i = 1:(length(indiceDeComeco) - 1)
    
    j = indiceDeComeco(i);
    seguinte = indiceDeComeco(i + 1);
    x = avg_time(j:seguinte,1);     % extract the first column
    y = avg_time(j:seguinte , 2);   % extract the second column
    X = [ x.^2, x, 0*x+1 ];         % build the X matrix
    w = pinv(X)*y;                  % optimal solution (could also be written as w = X \ y;)
    e = y-X*w;
    format long;
    norm(e);
    
    figure(i);
    plot(x,y,'.b',x,X*w,'or');      % plot the original data and its best least squares approximation
    title(nomesRotinas(i));
    xlabel("n");
    ylabel("Tempo (s)");
    legend('Tempo Médio','X*w')
  
end