%load('prithmatrix.mat');  % This is to load the ppi network thing
% load('fbpow.mat');       % This is for the fb network
% %adj=fbnet;
% adj=full(pownet);         %This is for the powernetwork
load('dolphn-netwrk.mat')       %Dolphin Network
%adj=fbnet;
adj=full(adj);                  %Few of them where sparse so it needs to be converted
%load('fbnet.mat');
%adj=fbnet;
%adj=full(adj);
[a,b]=rowwisse(adj);               %It is needed to divide into train and test matrices
%[b,a]=DivideNet(adj,0.5);         %This is another code which divides into train and test
A =full(a);                        
B =full(b);
%scoreAA = AANew(B);                %To run old AA code

%CnScore=cn(B);                     
%To run the old methd of CN, u will find new code in the file.

%CnScore = full(CnScore); 

%NScore = spdiags (1./sum (scoreAA,2), 0, size(scoreAA,1), size(scoreAA,1)) * scoreAA ;
%NScore = spdiags (1./sum (CnScore,2), 0, size(CnScore,1), size(CnScore,1)) * CnScore ;
%This two are just for normalization


%Score=convertToRandomWalkWithRestart(NScore,0.9);
Score=convertToRandomWalkWithRestart(B,0.9);
% above 2 for RWR

%Score=LRW(B,5,0.9);
%This is for Local Random Walk, nd its fast

%Score=RWS(B,0.002,0.002);
%Score=RWS(scoreAA,0.002,0.002);
%this is for the resistance thing


%ScoreS=dosym(B,Score);
ScoreS=dosym(B,Score);
%This needs to be run before checking comman values, Pass the train matrix
%and score matrix


CValue=commnval1(adj,ScoreS,10);


Precision = findpre(CValue,10,62);
%Precision  = CalcPrecision(B,A,ScoreS,5);
%Precision
