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

M1 = [ 1 2 1 2 1 3 2 1 4 2 1 2 1 2 1 4 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 4 2 1 2 1 2 1 3 ];
M2 = [ 1 2 1 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 3 2 1 4 2 1 2 1 2 1 3 4 1 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 3 2 1 2 1 4 1 2 1 2 1 ];

%%% SELF VERSÃO 2 =========================================================================================================================================================

%M1 = [1 3 2 1 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 4 2 1 2 1 2 1 3];
%M2 = [1 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 3 2 1 4 2 1 2 1 2 1 4 2 1 2 1 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1];

%%% SELF VERSÃO 3 =========================================================================================================================================================

%M1 = [1 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 3 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 2 1 2 1 4 2 1	2 1 2 1	4 2 1 2	1 3 2 1	2 1 4 2	1 2 1 2	1 3 4 2	1 2 1 4 2 1 2 1 2 1 3];
%M2 = [1 2 1 2 1 2 1 4 2 1 2 1 2 1 4 2 1 2 1 3 2 1 2 1 4 2 1 2 1 2 1 4 2 1 3 2 1 4 2 1 2 1 2 1 3 4 2 1 2 1 2 1 4 2 1 2 1 2 1 3 4 2 1 3 2 1 2 1 2 1 4 2 1 2 1 2 1];

%%%========================================================================================================================================================================

% Array do tempo dos PROC.PAUSE (Baseline) Self1
B1 = [7000 7000 7000 7000 7000 7000 7000 7000 7000];
B2 = [7000 7000 7000 7000 7000 7000 7000 7000 7000];

%%% Modelo M3-> 1-Ativa, 2-Proc_fix ,3-Pergunta, 4-Proc_Pause, 5-Passiva, 6-Intransitivas -- Frases 
%%% Modelo M4-> 1-Ativa, 2-Proc_fix ,3-Pergunta, 4-Proc_Pause, 5-Passiva, 6-Intransitivas -- Frases 
%%% SELF VERSÃO 1 =========================================================================================================================================================

M3 = [1 2  1 2 1 3 2 1 4 2 5 2 5 2 5 4 2 6 2 6 3 2 5 2 5 2 5 3 4 2 1 2 1 2 1 2 1 4 2 5 2 5 2 5 4 2 1 2 1 3 2 1 2 1 4 2 5 2 5 2 5 4 2 6 2 6 4 2 5 2 5 2 5 3];
M4 = [1 2  1 2 1 2 1 4 2 5 2 5 2 5 4 2 6 2 6 3 2 6 2 6 4 2 5 2 5 2 5 3 4 2 1 3 2 1 4 2 5 2 5 2 5 3 4 6 2 6 2 6 4 2 5 2 5 2 5 3 4 2 6 2 6 3 2 6 2 6 4 5 2 5 2 5];

%%%========================================================================================================================================================================


%%% Modelo M5-> 1-Ativa, 2-Proc_fix ,3-Pergunta, 4-Proc_Pause, 5-Passiva, 6-Intransitivas -- Palavras  
%%% Modelo M6-> 1-Ativa, 2-Proc_fix ,3-Pergunta, 4-Proc_Pause, 5-Passiva, 6-Intransitivas -- Palavras
%%% SELF VERSÃO 1 =========================================================================================================================================================

M5 = [1 1 1 1 1 1 2  1 1 1 1 1 1 2 1 1 1 1 1 1 3 2 1 1 1 1 1 1 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 4 2 6 6 6 6 6 6 2 6 6 6 6 6 6 3 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 3 4 2 1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 4 2 1 1 1 1 1 1 2 1 1 1 1 1 1 3 2 1 1 1 1 1 1 2 1 1 1 1 1 1 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 4 2 6 6 6 6 6 6 2 6 6 6 6 6 6 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 3];
M6 = [1 1 1 1 1 1 2  1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 4 2 6 6 6 6 6 6 2 6 6 6 6 6 6 3 2 6 6 6 6 6 6 2 6 6 6 6 6 6 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 3 4 2 1 1 1 1 1 1 3 2 1 1 1 1 1 1 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 3 4 6 6 6 6 6 6 2 6 6 6 6 6 6 2 6 6 6 6 6 6 4 2 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5 3 4 2 6 6 6 6 6 6 2 6 6 6 6 6 6 3 2 6 6 6 6 6 6 2 6 6 6 6 6 6 4 5 5 5 5 5 5 2 5 5 5 5 5 5 2 5 5 5 5 5 5];

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
    if (M3(n)==5)
    Mask_P1(n)=1;    
    else
    Mask_P1(n)=0;
    end
end

% Máscara de Passiva_2 
for n=1:size(M4,2)
    if (M4(n)==5)
    Mask_P2(n)=1;    
    else
    Mask_P2(n)=0;
    end
end

% Máscara de Intransitiva_1 
for n=1:size(M3,2)
    if (M3(n)==6)
    Mask_I1(n)=1;    
    else
    Mask_I1(n)=0;
    end
end

% Máscara de Intransitiva_2 
for n=1:size(M4,2)
    if (M4(n)==6)
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

%%%========================================================================================================================================================================

% Criação das Máscaras de Palavras Ativas, Passivas e Intransitivas a partir das variáveis modelo M3 e M4 (Tipos de Frases) 

% Máscara de Ativa_1 
for n=1:size(M5,2)
    if (M5(n)==1)
    Mask_AA1(n)=1;    
    else
    Mask_AA1(n)=0;
    end
end

% Máscara de Ativa_2 
for n=1:size(M5,2)
    if (M5(n)==1)
    Mask_AA2(n)=1;    
    else
    Mask_AA2(n)=0;
    end
end

% Máscara de Passiva_1 
for n=1:size(M5,2)
    if (M5(n)==5)
    Mask_PP1(n)=1;    
    else
    Mask_PP1(n)=0;
    end
end

% Máscara de Passiva_2 
for n=1:size(M5,2)
    if (M5(n)==5)
    Mask_PP2(n)=1;    
    else
    Mask_PP2(n)=0;
    end
end

% Máscara de Intransitiva_1 
for n=1:size(M5,2)
    if (M5(n)==6)
    Mask_II1(n)=1;    
    else
    Mask_II1(n)=0;
    end
end

% Máscara de Intransitiva_2 
for n=1:size(M5,2)
    if (M5(n)==6)
    Mask_II2(n)=1;    
    else
    Mask_II2(n)=0;
    end
end

%%%========================================================================================================================================================================

%%%========================================================================================================================================================================

% Finalização dos modelos M5 e M6

% Váriavel o posicionamento das frases no experimento (Feita no Excel)

Ordem_L1 = [1 1 1 1 1 1   1 1 1 1 1 1  1 1 1 1 1 1   1 1 1 1 1 1   5 5 5 5 5 5  5 5 5 5 5 5  5 5 5 5 5 5   6 6 6 6 6 6  6 6 6 6 6 6   5 5 5 5 5 5  5 5 5 5 5 5  5 5 5 5 5 5    1 1 1 1 1 1  1 1 1 1 1 1  1 1 1 1 1 1  1 1 1 1 1 1   5 5 5 5 5 5  5 5 5 5 5 5  5 5 5 5 5 5   1 1 1 1 1 1  1 1 1 1 1 1   1 1 1 1 1 1  1 1 1 1 1 1   5 5 5 5 5 5  5 5 5 5 5 5  5 5 5 5 5 5   6 6 6 6 6 6  6 6 6 6 6 6   5 5 5 5 5 5  5 5 5 5 5 5  5 5 5 5 5 5];
Ordem_L2 = [1 1 1 1 1 1   1 1 1 1 1 1  1 1 1 1 1 1  1 1 1 1 1 1   5 5 5 5 5 5  5 5 5 5 5 5  5 5 5 5 5 5   6 6 6 6 6 6  6 6 6 6 6 6   6 6 6 6 6 6  6 6 6 6 6 6   5 5 5 5 5 5  5 5 5 5 5 5  5 5 5 5 5 5    1 1 1 1 1 1   1 1 1 1 1 1   5 5 5 5 5 5  5 5 5 5 5 5  5 5 5 5 5 5   6 6 6 6 6 6  6 6 6 6 6 6  6 6 6 6 6 6   5 5 5 5 5 5  5 5 5 5 5 5  5 5 5 5 5 5    6 6 6 6 6 6  6 6 6 6 6 6   6 6 6 6 6 6  6 6 6 6 6 6  5 5 5 5 5 5  5 5 5 5 5 5  5 5 5 5 5 5];

% Adaptando as Ordens aos valores reais adquiridos.

Ordem_L1 = Ordem_L1(1:size(L1,2));
Ordem_L2 = Ordem_L2(1:size(L2,2));
% criação das vetores das frases específicas SELF1
%{
for n=1:size(L1,2)
    if(Ordem_L1(n)==1)
        AA1(n)=L1(n);
    else
        AA1(n)=0;
    end
end
%}
AA1 = L1(Ordem_L1==1);
%AA1 = AA1(AA1~=0);
%{
for n=1:size(L1,2)
    if(Ordem_L1(n)==5)
        PP1(n)=L1(n);
    end
end
%}
PP1 = L1(Ordem_L1==5);
%PP1 = PP1(PP1~=0);
%{
for n=1:size(L1,2)
    if(Ordem_L1(n)==6)
        II1(n)=L1(n);
    end
end
%}
II1 = L1(Ordem_L1==6);
%II1 = II1(II1~=0);

% criação das vetores das frases específicas SELF2
%{
for n=1:size(L2,2)
    if(Ordem_L2(n)==1)
        AA2(n)=L2(n);
    else
        AA2(n)='x';
    end
end
AA2 = AA2(AA2~='x');
%}
AA2 = L2(Ordem_L2==1);
%AA2 = AA2(AA2~=0);
%{
for n=1:size(L2,2)
    if(Ordem_L2(n)==5)
        PP2(n)=L2(n);
    end
end
%}
PP2 = L2(Ordem_L2==5);
%PP2 = PP2(PP2~=0);
%{
for n=1:size(L2,2)
    if(Ordem_L2(n)==6)
        II2(n)=L2(n);
    end
end
%}
II2 = L2(Ordem_L2==6);
%II2 = II2(II2~=0);

% Declaração dos contadores do for
c1 = 1; c2 = 1; c3 = 1; c4 = 1; c5 = 1; c6 = 1;

% Array do modelo de experimento 3 Self1 com os RTs 
for n=1:size(M5,2)
    
    if (M5(n)==1)               %%% 1 ==> Ativa ( Tarefa )
        if size(AA1,2)>=c1
            M5(n)=(AA1(c1));
            c1 = c1+1;
        else
            M5(n)=0;
        end
    elseif (M5(n)==2)           %%% 2 ==> Timefix ( Pequena Pausa )
        if size(T1,2)>=c2
            M5(n)=(T1(c2));
            c2 = c2+1;
        else
            M5(n)=0;
        end
    elseif (M5(n)==3)           %%% 3 ==> Pergunta ( Question )
        if size(Q1,2)>=c3
            M5(n)=(Q1(c3));
            c3 = c3+1;
        else
            M5(n)=0;
        end
    elseif (M5(n)==4)           %%% 4 ==> Proc.Pause ( Baseline )
         if size(B1,2)>=c4
            M5(n)=(B1(c4));  
            c4 = c4+1;
         else
            M5(n)=0;
         end
    elseif (M5(n)==5)           %%% 5 ==> Passiva ( Tarefa )
         if size(PP1,2)>=c5
            M5(n)=(PP1(c5));  
            c5 = c5+1;
         else
            M5(n)=0;
         end
    elseif (M5(n)==6)           %%% 6 ==> Intransitiva ( Tarefa )
         if size(II1,2)>=c6
            M5(n)=(II1(c6));  
            c6 = c6+1;
         else
            M5(n)=0;
         end     
    end
    
end

% Declaração dos contadores do for
c1 = 1; c2 = 1; c3 = 1; c4 = 1; c5 = 1; c6 = 1;

% Array do modelo de experimento 4 Self2 com os RTs 
for n=1:size(M6,2)
    
    if (M6(n)==1)               %%% 1 ==> Ativa ( Tarefa )
        if size(AA2,2)>=c1
            M6(n)=(AA2(c1));
            c1 = c1+1;
        else
            M6(n)=0;
        end
    elseif (M6(n)==2)           %%% 2 ==> Timefix ( Pequena Pausa )
        if size(T2,2)>=c2
            M6(n)=(T2(c2));
            c2 = c2+1;
        else
            M6(n)=0;
        end
    elseif (M6(n)==3)           %%% 3 ==> Pergunta ( Question )
        if size(Q2,2)>=c3
            M6(n)=(Q2(c3));
            c3 = c3+1;
        else
            M6(n)=0;
        end
    elseif (M6(n)==4)           %%% 4 ==> Proc.Pause ( Baseline )
         if size(B2,2)>=c4
            M6(n)=(B2(c4));  
            c4 = c4+1;
         else
            M6(n)=0;
         end
    elseif (M6(n)==5)           %%% 5 ==> Passiva ( Tarefa )
         if size(PP2,2)>=c5
            M6(n)=(PP2(c5));  
            c5 = c5+1;
         else
            M6(n)=0;
         end
    elseif (M6(n)==6)           %%% 6 ==> Intransitiva ( Tarefa )
         if size(II2,2)>=c6
            M6(n)=(II2(c6));  
            c6 = c6+1;
         else
            M6(n)=0;
         end     
    end
    
end


%%$==============================================================================================
%%% Convertendo os valores dos vetores para segundos %%%%

M1= (M1/1000);
M2= (M2/1000);
M3= (M3/1000);
M4= (M4/1000);
M5= (M5/1000);
M6= (M6/1000);
SL1= (SL1/1000);
SL2= (SL2/1000);
Q1= (Q1/1000);
Q2= (Q2/1000);
B1= (B1/1000);
B2= (B2/1000);
A1= (A1/1000);
A2= (A2/1000);
P1= (P1/1000);
P2= (P2/1000);
I1= (I1/1000);
I2= (I2/1000);
AA1= (AA1/1000);
AA2= (AA2/1000);
PP1= (PP1/1000);
PP2= (PP2/1000);
II1= (II1/1000);
II2= (II2/1000);



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

%%%%%%%%%%%%%%%%%%% Montando o arquivo de timing da tarefa de frases ativas


%%%%%%%%%%%%%%%%%% SELF1 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M3,2)

    if (Mask_A1(n)==1)    
        M3_soma_A1(k1) = sum(M3(1:n-1));
        k1=k1+1;
    else    
    end
end

Ativas1 = [ num2str(M3_soma_A1(1)) , ':' , num2str(A1(1))];
for n=2:size(A1,2)

Ativas1 = horzcat(Ativas1 ,' ',num2str(M3_soma_A1(n)),':',num2str(A1(n)));

end

%%%%%%%%%%%%%%%%%% SELF2 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M4,2)

    if (Mask_A2(n)==1)    
        M4_soma_A2(k1) = sum(M4(1:n-1));
        k1=k1+1;
    else    
end
end

Ativas2 = [ num2str(M4_soma_A2(1)) , ':' , num2str(A2(1))];
for n=2:size(A2,2)

Ativas2 = horzcat(Ativas2 ,' ',num2str(M4_soma_A2(n)),':',num2str(A2(n)));

end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing das frases Ativas %%%%%%%%%%%%%%%%%%%%%

LTiming = fopen('Ativas_Timing.1D','wt');
fprintf(LTiming, '%s' , Ativas1);
fprintf(LTiming, '\n%s' , Ativas2);
fclose(LTiming);

%%%%%%%%%%%%%%%%% Montando o arquivo de timing da tarefa de frases passivas


%%%%%%%%%%%%%%%%%% SELF1 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M3,2)

    if (Mask_P1(n)==1)    
        M3_soma_P1(k1) = sum(M3(1:n-1));
        k1=k1+1;
    else    
    end
end

Passivas1 = [ num2str(M3_soma_P1(1)) , ':' , num2str(P1(1))];
for n=2:size(P1,2)

Passivas1 = horzcat(Passivas1 ,' ',num2str(M3_soma_P1(n)),':',num2str(P1(n)));

end

%%%%%%%%%%%%%%%%%% SELF2 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M4,2)

    if (Mask_P2(n)==1)    
        M4_soma_P2(k1) = sum(M4(1:n-1));
        k1=k1+1;
    else    
end
end

Passivas2 = [ num2str(M4_soma_P2(1)) , ':' , num2str(P2(1))];
for n=2:size(P2,2)

Passivas2 = horzcat(Passivas2 ,' ',num2str(M4_soma_P2(n)),':',num2str(P2(n)));

end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing das Frases Passivas %%%%%%%%%%%%%%%%%%%%%

LTiming = fopen('Passivas_Timing.1D','wt');
fprintf(LTiming, '%s' , Passivas1);
fprintf(LTiming, '\n%s' , Passivas2);
fclose(LTiming);

%%%%%%%%%%%% Montando o arquivo de timing da tarefa de frases intransitivas


%%%%%%%%%%%%%%%%%% SELF1 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M3,2)

    if (Mask_I1(n)==1)    
        M3_soma_I1(k1) = sum(M3(1:n-1));
        k1=k1+1;
    else    
    end
end

Intransitivas1 = [ num2str(M3_soma_I1(1)) , ':' , num2str(I1(1))];
for n=2:size(I1,2)

Intransitivas1 = horzcat(Intransitivas1 ,' ',num2str(M3_soma_I1(n)),':',num2str(I1(n)));

end

%%%%%%%%%%%%%%%%%% SELF2 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M4,2)

    if (Mask_I2(n)==1)    
        M4_soma_I2(k1) = sum(M4(1:n-1));
        k1=k1+1;
    else    
end
end

Intransitivas2 = [ num2str(M4_soma_I2(1)) , ':' , num2str(I2(1))];
for n=2:size(I2,2)

Intransitivas2 = horzcat(Intransitivas2 ,' ',num2str(M4_soma_I2(n)),':',num2str(I2(n)));

end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing das Frases Intransitivas %%%%%%%%%%%%%%%%%%%

LTiming = fopen('Intransitivas_Timing.1D','wt');
fprintf(LTiming, '%s' , Intransitivas1);
fprintf(LTiming, '\n%s' , Intransitivas2);
fclose(LTiming);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%% Montando o arquivo de timing da tarefa de verbo ativo 1

% Declaração das Mascaras de posição dos verbos.
Mask_X1= [0 0 1 0 0 0 0 0 0 2 0 0 0 0 0 0 3 0 0 0  0 0 0 0 4 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 6 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 6 0 0 0 0 0 0 7 0 0 0 0 0 0 0 1 0 0 0 0 0 0 2 0 0 0 0 0 0 3 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 6 0 0 0 0 0 0 7 0 0 0 0 0 0 1 0 0 0 0 0 0 2 0 0 0 0 0 0 0 3 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 6 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 6 0 0 0 0 0 0 7 0 0 0];
Mask_X2= [0 0 1 0 0 0 0 0 0 2 0 0 0 0 0 0 3 0 0 0 0  0 0 4 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 6 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 6 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 6 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 6 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 6 0 0 0 0 0 0 7 0 0];

%%%%%%%%%%%%%%%%%% SELF1 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M5,2)

    if (Mask_X1(n)==1)    
        M5_soma_AA1(k1) = sum(M5(1:n-1));
        k1=k1+1;
    else    
    end
end
k1 = 1;
for n=1:size(M5,2)

    if (Mask_X1(n)==1)    
        VA1_S1(k1) = (M5(n));
        k1=k1+1;
    else    
    end
end


Verbo_A1_S1 = [ num2str(M5_soma_AA1(1)) , ':' , num2str(VA1_S1(1))];
for n=2:size(VA1_S1,2)

Verbo_A1_S1 = horzcat(Verbo_A1_S1 ,' ',num2str(M5_soma_AA1(n)),':',num2str(VA1_S1(n)));

end

%%%%%%%%%%%%%%%%%% SELF2 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M6,2)

    if (Mask_X2(n)==1)    
        M6_soma_AA2(k1) = sum(M6(1:n-1));
        k1=k1+1;
    else    
end
end
k1 = 1;
for n=1:size(M6,2)

    if (Mask_X2(n)==1)    
        VA1_S2(k1) = (M6(n));
        k1=k1+1;
    else    
    end
end

Verbo_A1_S2 = [ num2str(M6_soma_AA2(1)) , ':' , num2str(VA1_S2(1))];
for n=2:size(VA1_S2,2)

Verbo_A1_S2 = horzcat(Verbo_A1_S2 ,' ',num2str(M6_soma_AA2(n)),':',num2str(VA1_S2(n)));

end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing das frases Ativas 1 %%%%%%%%%%%%%%%%%%%%%

LTiming = fopen('VA1_Timing.1D','wt');
fprintf(LTiming, '%s' , Verbo_A1_S1);
fprintf(LTiming, '\n%s' , Verbo_A1_S2);
fclose(LTiming);

%%%%%%%%%%%%%%%%%%% Montando o arquivo de timing da tarefa de verbo ativo 2

%%%%%%%%%%%%%%%%%% SELF1 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M5,2)

    if (Mask_X1(n)==2)    
        M5_soma_AA2(k1) = sum(M5(1:n-1));
        k1=k1+1;
    else    
    end
end
k1 = 1;
for n=1:size(M5,2)

    if (Mask_X1(n)==2)    
        VA2_S1(k1) = (M5(n));
        k1=k1+1;
    else    
    end
end


Verbo_A2_S1 = [ num2str(M5_soma_AA2(1)) , ':' , num2str(VA2_S1(1))];
for n=2:size(VA2_S1,2)

Verbo_A2_S1 = horzcat(Verbo_A2_S1 ,' ',num2str(M5_soma_AA2(n)),':',num2str(VA2_S1(n)));

end

%%%%%%%%%%%%%%%%%% SELF2 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M6,2)

    if (Mask_X2(n)==2)    
        M6_soma_AA2(k1) = sum(M6(1:n-1));
        k1=k1+1;
    else    
end
end
k1 = 1;
for n=1:size(M6,2)

    if (Mask_X2(n)==2)    
        VA2_S2(k1) = (M6(n));
        k1=k1+1;
    else    
    end
end

Verbo_A2_S2 = [ num2str(M6_soma_AA2(1)) , ':' , num2str(VA2_S2(1))];
for n=2:size(VA1_S2,2)

Verbo_A2_S2 = horzcat(Verbo_A2_S2 ,' ',num2str(M6_soma_AA2(n)),':',num2str(VA2_S2(n)));

end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing das frases Ativas 2 %%%%%%%%%%%%%%%%%%%%%

LTiming = fopen('VA2_Timing.1D','wt');
fprintf(LTiming, '%s' , Verbo_A2_S1);
fprintf(LTiming, '\n%s' , Verbo_A2_S2);
fclose(LTiming);

%%%%%%%%%%%%%%%%%%% Montando o arquivo de timing da tarefa de verbo ativo 3

%%%%%%%%%%%%%%%%%% SELF1 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M5,2)

    if (Mask_X1(n)==3)    
        M5_soma_AA3(k1) = sum(M5(1:n-1));
        k1=k1+1;
    else    
    end
end
k1 = 1;
for n=1:size(M5,2)

    if (Mask_X1(n)==3)    
        VA3_S1(k1) = (M5(n));
        k1=k1+1;
    else    
    end
end


Verbo_A3_S1 = [ num2str(M5_soma_AA3(1)) , ':' , num2str(VA3_S1(1))];
for n=2:size(VA3_S1,2)

Verbo_A3_S1 = horzcat(Verbo_A3_S1 ,' ',num2str(M5_soma_AA3(n)),':',num2str(VA3_S1(n)));

end

%%%%%%%%%%%%%%%%%% SELF2 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M6,2)

    if (Mask_X2(n)==3)    
        M6_soma_AA3(k1) = sum(M6(1:n-1));
        k1=k1+1;
    else    
end
end
k1 = 1;
for n=1:size(M6,2)

    if (Mask_X2(n)==3)    
        VA3_S2(k1) = (M6(n));
        k1=k1+1;
    else    
    end
end

Verbo_A3_S2 = [ num2str(M6_soma_AA3(1)) , ':' , num2str(VA3_S2(1))];
for n=2:size(VA3_S2,2)

Verbo_A3_S2 = horzcat(Verbo_A3_S2 ,' ',num2str(M6_soma_AA3(n)),':',num2str(VA3_S2(n)));

end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing das frases Ativas 3 %%%%%%%%%%%%%%%%%%%%%

LTiming = fopen('VA3_Timing.1D','wt');
fprintf(LTiming, '%s' , Verbo_A3_S1);
fprintf(LTiming, '\n%s' , Verbo_A3_S2);
fclose(LTiming);



%%%%%%%%%%%%%%%%%%% Montando o arquivo de timing da tarefa de verbo ativo 4

%%%%%%%%%%%%%%%%%% SELF1 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M5,2)

    if (Mask_X1(n)==4)    
        M5_soma_AA4(k1) = sum(M5(1:n-1));
        k1=k1+1;
    else    
    end
end
k1 = 1;
for n=1:size(M5,2)

    if (Mask_X1(n)==4)    
        VA4_S1(k1) = (M5(n));
        k1=k1+1;
    else    
    end
end


Verbo_A4_S1 = [ num2str(M5_soma_AA2(1)) , ':' , num2str(VA4_S1(1))];
for n=2:size(VA4_S1,2)

Verbo_A4_S1 = horzcat(Verbo_A4_S1 ,' ',num2str(M5_soma_AA2(n)),':',num2str(VA4_S1(n)));

end

%%%%%%%%%%%%%%%%%% SELF2 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M6,2)

    if (Mask_X2(n)==4)    
        M6_soma_AA4(k1) = sum(M6(1:n-1));
        k1=k1+1;
    else    
end
end
k1 = 1;
for n=1:size(M6,2)

    if (Mask_X2(n)==4)    
        VA4_S2(k1) = (M6(n));
        k1=k1+1;
    else    
    end
end

Verbo_A4_S2 = [ num2str(M6_soma_AA4(1)) , ':' , num2str(VA4_S2(1))];
for n=2:size(VA1_S2,2)

Verbo_A4_S2 = horzcat(Verbo_A4_S2 ,' ',num2str(M6_soma_AA4(n)),':',num2str(VA4_S2(n)));

end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing das frases Ativas 4 %%%%%%%%%%%%%%%%%%%%%

LTiming = fopen('VA4_Timing.1D','wt');
fprintf(LTiming, '%s' , Verbo_A4_S1);
fprintf(LTiming, '\n%s' , Verbo_A4_S2);
fclose(LTiming);

%%%%%%%%%%%%%%%%% Montando o arquivo de timing da tarefa de verbo passivo 1

%%%%%%%%%%%%%%%%%% SELF1 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M5,2)

    if (Mask_X1(n)==5)    
        M5_soma_VP1(k1) = sum(M5(1:n-1));
        k1=k1+1;
    else    
    end
end
k1 = 1;
for n=1:size(M5,2)

    if (Mask_X1(n)==5)    
        VP1_S1(k1) = (M5(n));
        k1=k1+1;
    else    
    end
end


Verbo_P1_S1 = [ num2str(M5_soma_VP1(1)) , ':' , num2str(VP1_S1(1))];
for n=2:size(VP1_S1,2)
    if(VP1_S1(n)~=0)
Verbo_P1_S1 = horzcat(Verbo_P1_S1 ,' ',num2str(M5_soma_VP1(n)),':',num2str(VP1_S1(n)));
    end
end

%%%%%%%%%%%%%%%%%% SELF2 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M6,2)

    if (Mask_X2(n)==5)    
        M6_soma_VP1(k1) = sum(M6(1:n-1));
        k1=k1+1;
    else    
end
end
k1 = 1;
for n=1:size(M6,2)

    if (Mask_X2(n)==5)    
        VP1_S2(k1) = (M6(n));
        k1=k1+1;
    else    
    end
end

Verbo_P1_S2 = [ num2str(M6_soma_VP1(1)) , ':' , num2str(VP1_S2(1))];
for n=2:size(VP1_S2,2)
    if(VP1_S2(n)~=0)
Verbo_P1_S2 = horzcat(Verbo_P1_S2 ,' ',num2str(M6_soma_VP1(n)),':',num2str(VP1_S2(n)));
    end
end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing das frases passivas 1 %%%%%%%%%%%%%%%%%%%

LTiming = fopen('VP1_Timing.1D','wt');
fprintf(LTiming, '%s' , Verbo_P1_S1);
fprintf(LTiming, '\n%s' , Verbo_P1_S2);
fclose(LTiming);


%%%%%%%%%%%%%%%%% Montando o arquivo de timing da tarefa de verbo passivo 2

%%%%%%%%%%%%%%%%%% SELF1 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M5,2)

    if (Mask_X1(n)==6)    
        M5_soma_VP2(k1) = sum(M5(1:n-1));
        k1=k1+1;
    else    
    end
end
k1 = 1;
for n=1:size(M5,2)

    if (Mask_X1(n)==6)    
        VP2_S1(k1) = (M5(n));
        k1=k1+1;
    else    
    end
end


Verbo_P2_S1 = [ num2str(M5_soma_VP2(1)) , ':' , num2str(VP2_S1(1))];
for n=2:size(VP2_S1,2)
    if(VP2_S1(n)~=0)
Verbo_P2_S1 = horzcat(Verbo_P2_S1 ,' ',num2str(M5_soma_VP2(n)),':',num2str(VP2_S1(n)));
    end
end

%%%%%%%%%%%%%%%%%% SELF2 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M6,2)

    if (Mask_X2(n)==6)    
        M6_soma_VP2(k1) = sum(M6(1:n-1));
        k1=k1+1;
    else    
end
end
k1 = 1;
for n=1:size(M6,2)

    if (Mask_X2(n)==6)    
        VP2_S2(k1) = (M6(n));
        k1=k1+1;
    else    
    end
end

Verbo_P2_S2 = [ num2str(M6_soma_VP2(1)) , ':' , num2str(VP2_S2(1))];
for n=2:size(VP2_S2,2)
    if(VP2_S2(n)~=0)
Verbo_P2_S2 = horzcat(Verbo_P2_S2 ,' ',num2str(M6_soma_VP2(n)),':',num2str(VP2_S2(n)));
    end
end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing das frases passivas 1 %%%%%%%%%%%%%%%%%%%

LTiming = fopen('VP2_Timing.1D','wt');
fprintf(LTiming, '%s' , Verbo_P2_S1);
fprintf(LTiming, '\n%s' , Verbo_P2_S2);
fclose(LTiming);


%%%%%%%%%%%%%%%%% Montando o arquivo de timing da tarefa de verbo passivo 3

%%%%%%%%%%%%%%%%%% SELF1 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M5,2)

    if (Mask_X1(n)==7)    
        M5_soma_VP3(k1) = sum(M5(1:n-1));
        k1=k1+1;
    else    
    end
end
k1 = 1;
for n=1:size(M5,2)

    if (Mask_X1(n)==7)    
        VP3_S1(k1) = (M5(n));
        k1=k1+1;
    else    
    end
end


Verbo_P3_S1 = [ num2str(M5_soma_VP3(1)) , ':' , num2str(VP3_S1(1))];
for n=2:size(VP3_S1,2)
    if(VP3_S1(n)~=0)
Verbo_P3_S1 = horzcat(Verbo_P3_S1 ,' ',num2str(M5_soma_VP3(n)),':',num2str(VP3_S1(n)));
    end
end

%%%%%%%%%%%%%%%%%% SELF2 %%%%%%%%%%%%%%%%%%%%%

k1 = 1; 
for n=1:size(M6,2)

    if (Mask_X2(n)==7)    
        M6_soma_VP3(k1) = sum(M6(1:n-1));
        k1=k1+1;
    else    
end
end
k1 = 1;
for n=1:size(M6,2)

    if (Mask_X2(n)==7)    
        VP3_S2(k1) = (M6(n));
        k1=k1+1;
    else    
    end
end

Verbo_P3_S2 = [ num2str(M6_soma_VP3(1)) , ':' , num2str(VP3_S2(1))];
for n=2:size(VP3_S2,2)
    if(VP3_S2(n)~=0)
Verbo_P3_S2 = horzcat(Verbo_P3_S2 ,' ',num2str(M6_soma_VP3(n)),':',num2str(VP3_S2(n)));
    end
end

%%%%%%%%%%%%%%%%%% Gerando arquivo de timing das frases passivas 3 %%%%%%%%%%%%%%%%%%%

LTiming = fopen('VP3_Timing.1D','wt');
fprintf(LTiming, '%s' , Verbo_P3_S1);
fprintf(LTiming, '\n%s' , Verbo_P3_S2);
fclose(LTiming);



exit

