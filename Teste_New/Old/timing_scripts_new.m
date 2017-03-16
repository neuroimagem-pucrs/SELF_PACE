% Script feito por Luiz Fernando de Oliveira Dresch em 2016

clear all
clc
% Criando Vetores a partir das informações dos Txts

% Vetores de Leitura

fileID = fopen('Leitura1.txt');
    formatSpec = '%s';
    l1 = textscan(fileID,formatSpec,...            
                'Delimiter', '\n', ...
                'CollectOutput', true);
    for n=1:size(l1{1},1)   % Conversão de Cell para Array para execução dos calculos 
        M{n}=l1{1}{n};
        L1 = str2double(M);          % Variável L1 contém os tempos de reação de cada palavra
    end
fclose(fileID);

clear M;

fileID = fopen('Leitura2.txt');
    formatSpec = '%s';
    l2 = textscan(fileID,formatSpec,...            
                'Delimiter', '\n', ...
                'CollectOutput', true);
    for n=1:size(l2{1},1)   % Conversão de Cell para Array para execução dos calculos 
        M{n}=l2{1}{n};
        L2 = str2double(M);          % Variável L2 contém os tempos de reação de cada palavra
    end
fclose(fileID);

% Vetores de Pergunta

fileID = fopen('Pergunta1.txt');
    formatSpec = '%s';
    q1 = textscan(fileID,formatSpec,...            
                'Delimiter', '\n', ...
                'CollectOutput', true);
    for n=1:size(q1{1},1)
        N{n}=q1{1}{n};
        Q1 = str2double(N);          % Variável Q1 contém os tempos de Pergunta (Question)
    end
fclose(fileID);

clear N;

fileID = fopen('Pergunta2.txt');
    formatSpec = '%s';
    q2 = textscan(fileID,formatSpec,...            
                'Delimiter', '\n', ...
                'CollectOutput', true);
    for n=1:size(q2{1},1)
        N{n}=q2{1}{n};
        Q2 = str2double(N);          % Variável Q2 contém os tempos de Pergunta (Question)
    end
fclose(fileID);

% Vetores de Timefix

fileID = fopen('Timefix1.txt');
    formatSpec = '%s';
    t1 = textscan(fileID,formatSpec,...            
                'Delimiter', '\n', ...
                'CollectOutput', true);
    for n=1:size(t1{1},1)
        O{n}=t1{1}{n};
        T1 = str2double(O);          % Variável T1 contém os tempos de Timefix
    end
fclose(fileID);

clear O;

fileID = fopen('Timefix2.txt');
    formatSpec = '%s';
    t2 = textscan(fileID,formatSpec,...            
                'Delimiter', '\n', ...
                'CollectOutput', true);
    for n=1:size(t2{1},1)
        O{n}=t2{1}{n};
        T2 = str2double(O);          % Variável T2 contém os tempos de Timefix
    end
fclose(fileID);
    

% Criando o vetor de RT de cada frase através da soma dos RT das palavras

% Self1
for n=1:(size(L1,2)/6)
    c = (1:6:size(L1,2));
    SL1(n)= [ sum(L1(c(n):c(n)+5)) ];
     
end

% Self2
for n=1:(size(L2,2)/6)
    c = (1:6:size(L2,2));
    SL2(n)= [ sum(L2(c(n):c(n)+5)) ];
     
end

%%% Modelo M1 -> 1-Frase, 2-Proc_fix ,3-Pergunta, 4-Proc_Pause
%%% Modelo M2 -> 1-Frase, 2-Proc_fix ,3-Pergunta, 4-Proc_Pause
%%% SELF VERSÃO 1 =========================================================================================================================================================    

% Array do modelo de experimento Self
M1 = [ 1 2 1 2 1 3 2 1 4 2 1 2 1 2 1 4 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 4 2 1 2 1 2 1 3 ];
M2 = [ 1 2 1 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 3 2 1 4 2 1 2 1 2 1 3 4 1 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 3 2 1 2 1 4 1 2 1 2 1 ];

%%% SELF VERSÃO 2 =========================================================================================================================================================

% Array do modelo de experimento Self
%M1 = [1 3 2 1 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 4 2 1 2 1 2 1 3];
%M2 = [1 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 3 2 1 4 2 1 2 1 2 1 4 2 1 2 1 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1];

%%% SELF VERSÃO 3 =========================================================================================================================================================

% Array do modelo de experimento Self

%M1 = [1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 3 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 2 1 2 1 4 2 1	2 1 2 1	4 2 1 2	1 3 2 1	2 1 4 2	1 2 1 2	1 3 4 2	1 2 1 4 2 1 2 1 2 1 3];
%M2 = [1 2 1 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1 4 2 1 3 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 3 2 1 2 1 2 1 4 2 1 2 1 2 1];

%%%========================================================================================================================================================================

% Array do tempo dos PROC.PAUSE (Baseline) Self1
B1 = [7000 7000 7000 7000 7000 7000 7000 7000 7000];
B2 = [7000 7000 7000 7000 7000 7000 7000 7000 7000];

%%% Modelo M3-> 1-Ativa, 2-Proc_fix ,3-Pergunta, 4-Proc_Pause, 5-Passiva, 6-Intransitivas 
%%% Modelo M4-> 1-Ativa, 2-Proc_fix ,3-Pergunta, 4-Proc_Pause, 5-Passiva, 6-Intransitivas
%%% SELF VERSÃO 1 =========================================================================================================================================================

% Array do modelo de experimento Self
%M3 = [1 1 1 1 1 1 2  1 1 1 1 1 1 2 1 1 1 1 1 1 3 2 1 1 1 1 1 1 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 4 2 6 6 6 6 6 6 2 6 6 6 6 6 6 3 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 3 4 2 1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 4 2 1 1 1 1 1 1 2 1 1 1 1 1 1 3 2 1 1 1 1 1 1 2 1 1 1 1 1 1 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 4 2 6 6 6 6 6 6 2 6 6 6 6 6 6 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 3];
%M4 = [1 1 1 1 1 1 2  1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 4 2 6 6 6 6 6 6 2 6 6 6 6 6 6 3 2 6 6 6 6 6 6 2 6 6 6 6 6 6 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 3 4 2 1 1 1 1 1 1 3 2 1 1 1 1 1 1 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 3 4 6 6 6 6 6 6 2 6 6 6 6 6 6 2 6 6 6 6 6 6 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 3 4 2 6 6 6 6 6 6 2 6 6 6 6 6 6 3 2 6 6 6 6 6 6 2 6 6 6 6 6 6 4 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5];

M3 = [1 2  1 2 1 3 2 1 4 2 5 2 5 2 5 4 2 6 2 6 3 2 5 2 5 2 5 3 4 2 1 2 1 2 1 2 1 4 2 5 2 5 2 5 4 2 1 2 1 3 2 1 2 1 4 2 5 2 5 2 5 4 2 6 2 6 4 2 5 2 5 2 5 3];
M4 = [1 2  1 2 1 2 1 4 2 5 2 5 2 5 4 2 6 2 6 3 2 6 2 6 4 2 5 2 5 2 5 3 4 2 1 3 2 1 4 2 5 2 5 2 5 3 4 6 2 6 2 6 4 2 5 2 5 2 5 3 4 2 6 2 6 3 2 6 2 6 4 5 2 5 2 5];

%%%========================================================================================================================================================================

% Criação das Máscaras de Leitura, Pergunta e Baseline a partir das variáveis modelo M1 e M2 

% Máscara de Leitura_1 
for n=1:size(M1,2)
    if (M1(n)==1)
    Mask_SL1(n)=1;    
    else
    Mask_SL1(n)=0;
    end
end

% Máscara de Leitura_2
for n=1:size(M2,2)
    if (M2(n)==1)
    Mask_SL2(n)=1;    
    else
    Mask_SL2(n)=0;
    end
end

% Máscara de Pergunta_1
for n=1:size(M1,2)
    if (M1(n)==3)
    Mask_Q1(n)=1;    
    else
    Mask_Q1(n)=0;
    end
end

% Máscara de Pergunta_2
for n=1:size(M2,2)
    if (M2(n)==3)
    Mask_Q2(n)=1;    
    else
    Mask_Q2(n)=0;
    end
end

% Máscara de Baseline_1
for n=1:size(M1,2)
    if (M1(n)==4)
    Mask_B1(n)=1;    
    else
    Mask_B1(n)=0;
    end
end

% Máscara de Baseline_2
for n=1:size(M2,2)
    if (M2(n)==4)
    Mask_B2(n)=1;    
    else
    Mask_B2(n)=0;
    end
end

%%%========================================================================================================================================================================

% Finalização dos modelos M1 e M2

% Declaração dos contadores do for
c1 = 1; c2 = 1; c3 = 1; c4 = 1;

% Array do modelo de experimento 1 Self1 com os RTs 
for n=1:size(M1,2)
    
    if (M1(n)==1)               %%% 1 ==> Leitura ( Tarefa )
        if size(SL1,2)>=c1
            M1(n)=(SL1(c1));
            c1 = c1+1;
        else
            M1(n)=0;
        end
    elseif (M1(n)==2)           %%% 2 ==> Timefix ( Pequena Pausa )
        if size(T1,2)>=c2
            M1(n)=(T1(c2));
            c2 = c2+1;
        else
            M1(n)=0;
        end
    elseif (M1(n)==3)           %%% 3 ==> Pergunta ( Question )
        if size(Q1,2)>=c3
            M1(n)=(Q1(c3));
            c3 = c3+1;
        else
            M1(n)=0;
        end
    elseif (M1(n)==4)           %%% 4 ==> Proc.Pause ( Baseline )
         if size(B1,2)>=c4
            M1(n)=(B1(c4));  
            c4 = c4+1;
         else
            M1(n)=0;
         end
    end
    
end

% Redeclaração dos contadores do for
c1 = 1; c2 = 1; c3 = 1; c4 = 1;

% Array do modelo de experimento 2 Self2 com os RTs 
for n=1:size(M2,2)
    
    if (M2(n)==1)               %%% 1 ==> Leitura ( Tarefa )
        if size(SL2,2)>=c1
            M2(n)=(SL2(c1));
            c1 = c1+1;
        else
            M2(n)=0;
        end
    elseif (M2(n)==2)           %%% 2 ==> Timefix ( Pequena Pausa )
        if size(T2,2)>=c2
            M2(n)=(T2(c2));
            c2 = c2+1;
        else
            M2(n)=0;
        end
    elseif (M2(n)==3)           %%% 3 ==> Pergunta ( Question )
        if size(Q2,2)>=c3
            M2(n)=(Q2(c3));
            c3 = c3+1;
        else
            M2(n)=0;
        end
    elseif (M2(n)==4)           %%% 4 ==> Proc.Pause ( Baseline )
         if size(B2,2)>=c4
            M2(n)=(B2(c4));  
            c4 = c4+1;
         else
            M2(n)=0;
         end
    end
    
end

%%%========================================================================================================================================================================

% Criação das Máscaras de Frases Ativas, Passivas e Intransitivas a partir das variáveis modelo M3 e M4 (Tipos de Frases) 

% Máscara de Ativa_1 
for n=1:size(M3,2)
    if (M3(n)==1)
    Mask_A1(n)=1;    
    else
    Mask_A1(n)=0;
    end
end

% Máscara de Ativa_2 
for n=1:size(M4,2)
    if (M4(n)==1)
    Mask_A2(n)=1;    
    else
    Mask_A2(n)=0;
    end
end

% Máscara de Passiva_1 
for n=1:size(M3,2)
    if (M3(n)==1)
    Mask_P1(n)=1;    
    else
    Mask_P1(n)=0;
    end
end

% Máscara de Passiva_2 
for n=1:size(M4,2)
    if (M4(n)==1)
    Mask_P2(n)=1;    
    else
    Mask_P2(n)=0;
    end
end

% Máscara de Intransitiva_1 
for n=1:size(M3,2)
    if (M3(n)==1)
    Mask_I1(n)=1;    
    else
    Mask_I1(n)=0;
    end
end

% Máscara de Intransitiva_2 
for n=1:size(M4,2)
    if (M4(n)==1)
    Mask_I2(n)=1;    
    else
    Mask_I2(n)=0;
    end
end

%%%========================================================================================================================================================================

% Finalização dos modelos M3 e M4

% Váriavel o posicionamento das frases no experimento (Feita no Excel)

Ordem_SL1 = [1   1  1   1   5  5  5   6  6   5  5  5    1  1  1  1   5  5  5   1  1   1  1   5  5  5   6  6   5  5  5]; 
Ordem_SL2 = [1   1  1  1   5  5  5   6  6   6  6   5  5  5    1   1   5  5  5   6  6  6   5  5  5    6  6   6  6  5  5  5];
% criação das vetores das frases específicas SELF1
for n=1:size(SL1,2)
    if(Ordem_SL1(n)==1)
        A1(n)=SL1(n);
    end
end
A1 = A1(A1~=0);
for n=1:size(SL1,2)
    if(Ordem_SL1(n)==5)
        P1(n)=SL1(n);
    end
end
P1 = P1(P1~=0);
for n=1:size(SL1,2)
    if(Ordem_SL1(n)==6)
        I1(n)=SL1(n);
    end
end
I1 = I1(I1~=0);

% criação das vetores das frases específicas SELF2
for n=1:size(SL2,2)
    if(Ordem_SL2(n)==1)
        A2(n)=SL2(n);
    end
end
A2 = A2(A2~=0);
for n=1:size(SL2,2)
    if(Ordem_SL2(n)==5)
        P2(n)=SL2(n);
    end
end
P2 = P2(P2~=0);
for n=1:size(SL2,2)
    if(Ordem_SL2(n)==6)
        I2(n)=SL2(n);
    end
end
I2 = I2(I2~=0);

% Declaração dos contadores do for
c1 = 1; c2 = 1; c3 = 1; c4 = 1; c5 = 1; c6 = 1;

% Array do modelo de experimento 3 Self1 com os RTs 
for n=1:size(M3,2)
    
    if (M3(n)==1)               %%% 1 ==> Ativa ( Tarefa )
        if size(A1,2)>=c1
            M3(n)=(A1(c1));
            c1 = c1+1;
        else
            M3(n)=0;
        end
    elseif (M3(n)==2)           %%% 2 ==> Timefix ( Pequena Pausa )
        if size(T1,2)>=c2
            M3(n)=(T1(c2));
            c2 = c2+1;
        else
            M3(n)=0;
        end
    elseif (M3(n)==3)           %%% 3 ==> Pergunta ( Question )
        if size(Q1,2)>=c3
            M3(n)=(Q1(c3));
            c3 = c3+1;
        else
            M3(n)=0;
        end
    elseif (M3(n)==4)           %%% 4 ==> Proc.Pause ( Baseline )
         if size(B1,2)>=c4
            M3(n)=(B1(c4));  
            c4 = c4+1;
         else
            M3(n)=0;
         end
    elseif (M3(n)==5)           %%% 5 ==> Passiva ( Tarefa )
         if size(P1,2)>=c5
            M3(n)=(P1(c5));  
            c5 = c5+1;
         else
            M3(n)=0;
         end
    elseif (M3(n)==6)           %%% 6 ==> Intransitiva ( Tarefa )
         if size(I1,2)>=c5
            M3(n)=(I1(c5));  
            c5 = c5+1;
         else
            M3(n)=0;
         end     
    end
    
end

% Declaração dos contadores do for
c1 = 1; c2 = 1; c3 = 1; c4 = 1; c5 = 1; c6 = 1;

% Array do modelo de experimento 4 Self2 com os RTs 
for n=1:size(M4,2)
    
    if (M4(n)==1)               %%% 1 ==> Ativa ( Tarefa )
        if size(A2,2)>=c1
            M4(n)=(A2(c1));
            c1 = c1+1;
        else
            M4(n)=0;
        end
    elseif (M4(n)==2)           %%% 2 ==> Timefix ( Pequena Pausa )
        if size(T2,2)>=c2
            M4(n)=(T2(c2));
            c2 = c2+1;
        else
            M4(n)=0;
        end
    elseif (M4(n)==3)           %%% 3 ==> Pergunta ( Question )
        if size(Q2,2)>=c3
            M4(n)=(Q2(c3));
            c3 = c3+1;
        else
            M4(n)=0;
        end
    elseif (M4(n)==4)           %%% 4 ==> Proc.Pause ( Baseline )
         if size(B2,2)>=c4
            M4(n)=(B2(c4));  
            c4 = c4+1;
         else
            M4(n)=0;
         end
    elseif (M4(n)==5)           %%% 5 ==> Passiva ( Tarefa )
         if size(P2,2)>=c5
            M4(n)=(P2(c5));  
            c5 = c5+1;
         else
            M4(n)=0;
         end
    elseif (M4(n)==6)           %%% 6 ==> Intransitiva ( Tarefa )
         if size(I2,2)>=c5
            M4(n)=(I2(c5));  
            c5 = c5+1;
         else
            M4(n)=0;
         end     
    end
    
end

%%$==============================================================================================
%%% Convertendo os valores dos vetores para segundos %%%%

M1= (M1/1000);
M2= (M2/1000);
M3= (M3/1000);
M4= (M4/1000);
SL1= (SL1/1000);
SL2= (SL2/1000);
Q1= (Q1/1000);
Q2= (Q2/1000);
B1= (B1/1000);
B2= (B2/1000);

%%%%%%%%%%%%%%%%%%%%% Montando o arquivo de timing da tarefa de leitura


%%%%%%%%%%%%%%%%%% SELF1 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M1,2)

    if (Mask_SL1(n)==1)    
        M1_soma_L1(k1) = sum(M1(1:n-1));
        k1=k1+1;
    else    
end
end

Leitura1 = [ num2str(M1_soma_L1(1)) , ':' , num2str(SL1(1))];
for n=2:size(SL1,2)

Leitura1 = horzcat(Leitura1 ,' ',num2str(M1_soma_L1(n)),':',num2str(SL1(n)));

end

%%%%%%%%%%%%%%%%%% SELF2 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M2,2)

    if (Mask_SL2(n)==1)    
        M2_soma_L2(k1) = sum(M2(1:n-1));
        k1=k1+1;
    else    
end
end

Leitura2 = [ num2str(M2_soma_L2(1)) , ':' , num2str(SL2(1))];
for n=2:size(SL2,2)

Leitura2 = horzcat(Leitura2 ,' ',num2str(M2_soma_L2(n)),':',num2str(SL2(n)));

end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing de leitura %%%%%%%%%%%%%%%%%%%%%

LTiming = fopen('Leitura_Timing.1D','wt');
fprintf(LTiming, '%s' , Leitura1);
fprintf(LTiming, '\n%s' , Leitura2);
fclose(LTiming);

%%%%%%%%%%%%%%%%%%%%% Montando o arquivo de timming das Perguntas

%%%%%%%%%%%% SELF 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M1,2)

    if (Mask_Q1(n)==1)    
        M1_soma_Q1(k1) = sum(M1(1:n-1));
        k1=k1+1;
    else    
end
end

Pergunta1 = [ num2str(M1_soma_Q1(1)) , ':' , num2str(Q1(1))];
for n=2:size(Q1,2)

Pergunta1 = horzcat(Pergunta1 ,' ',num2str(M1_soma_Q1(n)),':',num2str(Q1(n)));

end

%%%%%%%%%%%% SELF 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M2,2)

    if (Mask_Q2(n)==1)    
        M2_soma_Q2(k1) = sum(M2(1:n-1));
        k1=k1+1;
    else    
end
end

Pergunta2 = [ num2str(M2_soma_Q2(1)) , ':' , num2str(Q2(1))];
for n=2:size(Q2,2)

Pergunta2 = horzcat(Pergunta2 ,' ',num2str(M2_soma_Q2(n)),':',num2str(Q2(n)));

end

%%%%%%%%%%% Gerando arquivo de timing de pergunta %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

LTiming = fopen('Pergunta_Timing.1D','wt');
fprintf(LTiming, '%s', Pergunta1);
fprintf(LTiming, '\n%s', Pergunta2);
fclose(LTiming);

%%%%%%%%%%%%%%%%%%%%% Montando o arquivo de timming das Pausas ( Baseline )

%%%%%%%%%%%% SELF 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M1,2)

    if (Mask_B1(n)==1)    
        M1_soma_B1(k1) = sum(M1(1:n-1));
        k1=k1+1;
    else    
end
end

Baseline1 = [ num2str(M1_soma_B1(1)) , ':' , num2str(B1(1))];
for n=2:size(B1,2)

Baseline1 = horzcat(Baseline1 ,' ',num2str(M1_soma_B1(n)),':',num2str(B1(n)));

end

%%%%%%%%%%%% SELF 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M2,2)

    if (Mask_B2(n)==1)    
        M2_soma_B2(k1) = sum(M2(1:n-1));
        k1=k1+1;
    else    
end
end

Baseline2 = [ num2str(M2_soma_B2(1)) , ':' , num2str(B2(1))];
for n=2:size(B2,2)

Baseline2 = horzcat(Baseline2 ,' ',num2str(M2_soma_B2(n)),':',num2str(B2(n)));

end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing de baseline %%%%%%%%%%%%%%%%%%%%%

LTiming = fopen('Baseline_Timing.1D','wt');
fprintf(LTiming, '%s', Baseline1);
fprintf(LTiming, '\n%s', Baseline2);
fclose(LTiming);

%exit

