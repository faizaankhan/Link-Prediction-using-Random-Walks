clear
%load('fbnet.mat');
%load('Homo_sapiens.mat');
load('dolphn-netwrk.mat')
%adj=network;
adj=full(adj);

%load('football.mat');
%adj=fbnet;
[a,b]=rowwisse(adj);
A =full(a);
B =full(b);

val = zeros(1,15);
j=1;

for i= 0.1: 0.1 :1.0
Score=convertToRandomWalkWithRestart(B,i);
ScoreS=dosym(B,Score);
CValue=commnval1(adj,ScoreS,5);
Precision = findpre(CValue,5,62);
val(j)= Precision;
j=j+1;
end