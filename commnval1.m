function commn1 = commnval1(adj,lap,top)
[r,c]=size(adj);
indsadjtst=cell(0);
index=1:c;
for i = 1:length(adj)
   indsadjtst(i,:)={[find(adj(i,:))]};
   scr=lap(i,:);
   [x,d]=sort(scr,'descend');
   sind=index(d);
   indpos=find(adj(i,:)>0);
   commn1(i,:) = nnz(intersect(sind(1:top),indpos));
end