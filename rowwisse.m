function [adjtst,adjtrn] = rowwisse(p)
[r,c]=size(p);
adjtrn=sparse(zeros(r,c));
adjtst=sparse(zeros(r,c));
d=sum(p,2);

    for i =1:length(d)
       %i
      if (d(i)<=1)
          adjtrn(i,:)=p(i,:);
          %adjtst(i,:)=p(i,:);
          if(nnz(adjtrn(i,:))==1)
             i
          end
          continue;
      end
      ind=crossvalind('Kfold',nnz(p(i,:)),4);
      [x,y,z]=find(p(i,:));
      adjtrn(i,y(ind~=1))=1;
      adjtst(i,y(ind==1))=1;
      
    end

   