function scorecn=cn(adj)
[row,col]=size(adj);
scorecn = sparse(row,col);
degree = sum(adj,2);

scoreCN=adj*adj;

maxCN = max(scoreCN(:));

degree=sum(adj);
degree=1./degree;
degree=repmat(degree',1,col);
degree=degree.*adj;
scorecn=(1+scoreCN/maxCN).*degree;

%for i =1:row
%     for j =1:col
% neigh1 = find(adj(i,:)>0);
% neigh2 = find(adj(j,:)>0);
% scoreCN = nnz(intersect(neigh1,neigh2));
% %d =adj(i,j)/degree(i);
% %scorecn(i,j)=(1+scoreCN/12)*d;
% scorecn(i,j)=scoreCN;
% %12 is the maximum no. of neighbouhood for the network
%     end  
% end