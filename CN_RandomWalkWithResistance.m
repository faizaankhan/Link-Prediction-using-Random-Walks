clear
load('dolphn-netwrk.mat');
adj=full(adj);
[a,b]=rowwisse(adj);
A =full(a);
B =full(b);

CnScore=cn(B);
CnScore = full(CnScore); 
NScore = spdiags (1./sum (CnScore,2), 0, size(CnScore,1), size(CnScore,1)) * CnScore ;
NScore(isnan(NScore)) = 0; 
NScore(isinf(NScore)) = 0; 

Score=RWS(NScore,0.002,0.002);
ScoreS=dosym(B,Score);
CValue=commnval1(adj,ScoreS,5);
Precision = findpre(CValue,5,62);