function score1=dosym(adj,score)
%adj is adjmatrix
% score is calculated
[ro,col]=size(adj);
edge=nnz(adj);
degree=sum(adj,2);

coef=degree/edge;
coef=repmat(coef,1,col);
score1=score.*coef+(score.*coef)';