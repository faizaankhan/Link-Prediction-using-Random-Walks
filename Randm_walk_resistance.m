clear
%load('Homo_sapiens.mat');
%load('fbnet.mat');
load('dolphn-netwrk.mat');
adj=full(adj);
%adj=network;
%adj=fbnet;

[a,b]=rowwisse(adj);
A =full(a);
B =full(b);
%val = zeros(1,20);
%j=1;

% for i= 0.001: 0.001 :0.006
%     for k= 0.001: 0.002 :0.010

Score=RWS(B);
ScoreS=dosym(B,Score);
CValue=commnval1(adj,ScoreS,20);
Precision = findpre(CValue,20,62);

%val(j)= Precision;
% j=j+1;
%     end
%    val(j)= 0;
%    j=j+1;
% end