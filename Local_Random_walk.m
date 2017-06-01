clear
load('dolphn-netwrk.mat');
adj=full(adj);
[a,b]=rowwisse(adj);
A =full(a);
B =full(b);

val = zeros(1,15);
j=1;

for i= 0.1: 0.1 :1.0
Score=LRW(B,5,i);

ScoreS=dosym(B,Score);
CValue=commnval1(adj,ScoreS,20);
Precision = findpre(CValue,20,62);

val(j)= Precision;
j=j+1;
end