clear
load('fbnet.mat');
adj=fbnet;
[a,b]=rowwisse(adj);
A =full(a);
B =full(b);

CnScore=AANew(B);
CnScore = full(CnScore); 

NScore = spdiags (1./sum (CnScore,2), 0, size(CnScore,1), size(CnScore,1)) * CnScore ;

val = zeros(1,15);
j=1;

for i= 0.1: 0.1 :1.0
Score=convertToRandomWalkWithRestart(CnScore,i);
ScoreS=dosym(B,Score);
CValue=commnval1(adj,ScoreS,20);
Precision = findpre(CValue,20,115);

val(j)= Precision;
j=j+1;
end