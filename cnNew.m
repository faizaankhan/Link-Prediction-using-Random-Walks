function scorecn= cnNew(adj)
[row,col]=size(adj);
scorecn = sparse(row,col);
degree = sum(adj,2);

for i =1:row
    for j =1:col
        
%neigh1 = find(adj(i,:)>0);
%neigh2 = find(adj(j,:)>0);
%scoreCN = nnz(intersect(neigh1,neigh2));
%---------

testID= [i,j];
%scoreCN = cmmnNe(testID,adj);
scoreCN = AA(testID,adj);
%----------
d =adj(i,j)/degree(i);
i
j
scorecn(i,j)=(1+scoreCN/174)*d;
%12 is the maximum no. of neighbouhood for the football network
%174 for the prithi1 network
    end  
end