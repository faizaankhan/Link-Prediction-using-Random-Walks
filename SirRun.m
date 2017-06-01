%load('prithmatrix.mat')
load('fbnet.mat');
%load('Homo_sapiens.mat');
%load('dolphn-netwrk.mat')
%adj=network;
adj=fbnet;
[a,b]=rowwisse(adj);
B =full(b);
BProb= convertToProbabilityMatrix(B);
BProb1= exp(-BProb);
c= (1 - BProb1)*0.1;
R = c .* inv(eye(size(BProb))-(1-c).*BProb);
ScoreS=dosym(B,R);
CValue=commnval1(adj,ScoreS,20);
Precision= findpre(CValue,20,115);