function amostra(F, Fa)
    tol = 0.1; % tolerancia para o grafico de reconstrucao
    No = 2^12; % numero de pontos do sinal original
    m = 1; % harmonica do sinal original
    Fs=m*F; % frequencia do sinal considerando a harmonica
    N = Fa/Fs; % numero de pontos contidos na amostra
    Ta = 1/Fa; % periodo de amostragem
    x = linspace(0,m*2*pi,No); % cria vetor do sinal a ser amostrado
    t = linspace(0,1/F,No); % vetor de tempo
    y = sin(x); % gera o sinal
    xa = linspace(0,m*2*pi,(N*m+1)); % auxiliar para o grafico, pontos de amostragem
    ta = linspace(0,1/(F),(N*m+1)); % auxiliar para o grafico, vetor de tempo
    ya = sin(xa); % sinal reconstuido
    figure(1); % plotar na figura 1
    subplot(2,1,1); % plotar na janela superior
    hold off; % replotar
    plot(t,y); % tempo x sinal
    hold on; % manter grafico
    stem(ta,ya); % mostra pontos amostrados
    subplot(2,1,2); % plotar na janela inferiror
    hold off % replotar
    if(max(ya) > tol) %amplitude so sinal acima de tol
    %stairs(ta,ya); % plotar saâˆšâ‰ da do DAC
    plot(ta,ya); % plotar sinal reconstuido
    hold on % manter grafico
    plot(ta,ya,'o'); % plotar pontos amostrados
    else %amplitude so sinal abaixo de tol
    ya = zeros(1,length(ta)) % substitui o sinal por zero
    hold off % replotar
    plot(ta,ya); % plotar sinal
    hold on % manter grafico
    plot(ta,ya,'o'); % plotar pontos amostrados
endfunction