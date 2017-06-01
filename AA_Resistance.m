clear
load('football.mat');
%adj=fbnet;
[a,b]=rowwisse(adj);
A =full(a);
B =full(b);
scoreAA = AANew(B);
NScore = spdiags (1./sum (scoreAA,2), 0, size(scoreAA,1), size(scoreAA,1)) * scoreAA ;
Score=RWS(scoreAA,0.002,0.002);
ScoreS=dosym(B,Score);
CValue=commnval1(adj,ScoreS,20);
Precision = findpre(CValue,20,115);