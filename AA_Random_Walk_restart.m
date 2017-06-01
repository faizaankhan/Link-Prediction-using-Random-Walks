% load('dolphn-netwrk.mat');
% adj=full(adj);
load('football.mat');
%load('Homo_sapiens.mat');
%adj=full(network);
[a,b]=rowwisse(adj);
A =full(a);
B =full(b);
scoreAA = AANew(B);
NScore = spdiags (1./sum (scoreAA,2), 0, size(scoreAA,1), size(scoreAA,1)) * scoreAA ;
NScore(isnan(NScore)) = 0; 
NScore(isinf(NScore)) = 0; 
Score=convertToRandomWalkWithRestart(NScore,0.9);
ScoreS=dosym(B,Score);
CValue=commnval1(adj,ScoreS,5);
Precision = findpre(CValue,5,115);